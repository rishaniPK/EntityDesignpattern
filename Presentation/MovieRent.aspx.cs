using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntityDesignPattern.Presentation
{
    public partial class MovieRent_Class : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            FillCustomerDetails();
            FillMovieDetails();
        }

        //filling the customer details in drop down box 
        private void FillCustomerDetails()
        {
            Business.Customer_BAL Obj_Cust = new Business.Customer_BAL();
            // Using ID picking the details 
            List<Customer> Obj_Customer_ID = Obj_Cust.GetCustomersData_BAL();

            if (Obj_Customer_ID != null && Obj_Customer_ID.Count > 0)
            {
                for (int i = 0; i < Obj_Customer_ID.Count; i++)
                {
                    ddl_Customer.Items.Add(Obj_Customer_ID[i].CustomerID.ToString());
                }
                ddl_Customer.Items.Insert(0, new ListItem("Select Customer", " "));
            }
            else
            {
                ddl_Customer.Items.Clear();
            }
        }
        ////filling the Movie details in drop down box 
        private void FillMovieDetails()
        {
           Business.Movies_BAL Obj_Movie = new Business.Movies_BAL();
            //Picking details with ID 
            List<Movy> Obj_Movie_ID = Obj_Movie.GetMoviesData_BAL();

            if (Obj_Movie_ID != null && Obj_Movie_ID.Count > 0)
            {
                for (int i = 0; i < Obj_Movie_ID.Count; i++)
                {

                    ddl_Movie.Items.Add(Obj_Movie_ID[i].MovieID.ToString());
                }
                ddl_Movie.Items.Insert(0, new ListItem("Select Movie", " "));
            }
            else
            {
                ddl_Movie.Items.Clear();
            }
        }
       
        // deatils of Customer
        
        protected void ddl_Customer_SelectedIndexChanged(object sender, EventArgs e)
        {
            {
               List<Customer> Obj_Customer = Business.Customer_BAL.GetCustomerDetails_BAL(ddl_Customer.SelectedValue);
                if (Obj_Customer != null && Obj_Customer.Count > 0)
                {
                    for (int i = 0; i < Obj_Customer.Count; i++)
                    {
                        txt_FirstName.Text = Obj_Customer[i].FirstName;
                    }
                }
            }
        }
        //details of movie
        protected void ddl_Movie_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Movy> Obj_movie = Business.Movies_BAL.GetMovieDetails_BAL(ddl_Movie.SelectedValue);
            if (Obj_movie != null && Obj_movie.Count > 0)
            {
                for (int i = 0; i < Obj_movie.Count; i++)
                {
                    txt_movieName.Text = Obj_movie[i].Title;
                }
            }
        }
        //Issues button function 
        protected void Issue_btn_Click(object sender, EventArgs e)
        {
            //Issues date convert 
            DateTime IssueDate = Convert.ToDateTime(txtIssueDate.Text);
            double days = (DateTime.Now - IssueDate).TotalDays;
            Business.MovieRent_BAL obj_Database = new Business.MovieRent_BAL();

            if (days >= 0)
            {
                MovieRent Obj_rent = new MovieRent
                {
                    CustomerID = Convert.ToInt32(ddl_Customer.SelectedValue),
                    MovieID = Convert.ToInt32(ddl_Movie.SelectedValue),
                    IssuseDate = Convert.ToDateTime(txtIssueDate.Text)
                };
                obj_Database.InsertRent_BAL(Obj_rent);
            
                Response.Redirect("default.aspx");
            }
            else
            {
                MessageIssue.Text = "Issue date can not grater than Today's Date.";
            }
        }
    }
    }
