using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityDesignPattern.Business;
using EntityDesignPattern.Database;

namespace EntityDesignPattern.Presentation
{
    public partial class ReturnMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillRentDetails();
        }
        //Filling the details of rent 
        private void FillRentDetails()
        {
            MovieRent_BAL Obj_rental = new MovieRent_BAL();
            List<MovieRent> Obj_Rent_ID = Obj_rental.GetMovieRentData_BAL();

            if (Obj_Rent_ID != null && Obj_Rent_ID.Count > 0)
            {
                for (int i = 0; i < Obj_Rent_ID.Count; i++)
                {
                    ddl_RentID.Items.Add(Obj_Rent_ID[i].RentID.ToString());
                }
                ddl_RentID.Items.Insert(0, new ListItem("Select Rental ID", " "));
            }
            else
            {
                ddl_RentID.Items.Clear();
            }
        }
        //Selecting the datas by selecring the Id from drop down box
        protected void ddl_Rent_SelectedIndexChanged(object sender, EventArgs e)
        {

            //Creating a varibale to find the rent per day
            decimal MovieRe = 0;
            //Listing the Movie rental datas to dropdownbox
            List<MovieRent> Obj_Rent = MovieRent_BAL.GetRentDetails_BAL(ddl_RentID.SelectedValue);
            if (Obj_Rent != null && Obj_Rent.Count > 0)
            {
                for (int i = 0; i < Obj_Rent.Count; i++)
                {
                    //Getting selected customer details 
                    List<Customer> Obj_Customer = Customer_BAL.GetCustomerDetails_BAL(Obj_Rent[i].CustomerID.ToString());
                    if (Obj_Customer != null && Obj_Customer.Count > 0)
                    {
                        for (int k = 0; k < Obj_Customer.Count; k++)
                        {
                            txt_CustomerName.Text = Obj_Customer[k].FirstName;
                        }
                    }
                    //Getting Movie details 
                    List<Movy> Obj_Bike = Movies_BAL.GetMovieDetails_BAL(Obj_Rent[i].MovieID.ToString());
                    if (Obj_Bike != null && Obj_Bike.Count > 0)
                    {
                        for (int j = 0; j < Obj_Bike.Count; j++)
                        {
                            txt_movieTitle.Text = Obj_Bike[j].Title;
                            MovieRe = Convert.ToDecimal(Obj_Bike[j].RentPerDay);
                        }
                    }
                    
                    // Coverting to the datatype to string and dateTime
                    txtIssueDate.Text = Obj_Rent[i].IssuseDate.ToString();
                    txtReturnDate.Text = DateTime.Now.ToString();
                    DateTime issuedate = Convert.ToDateTime(Obj_Rent[i].IssuseDate);
                    double days = (DateTime.Now - issuedate).TotalDays;
                    //Calculating the Rent 
                    txtTotalRent.Text = (MovieRe * Convert.ToDecimal(Math.Round(days))).ToString();
                }
            }
        }

        // Function to return Movies 
        protected void Return_btn_Click(object sender, EventArgs e)
        {
            MovieRent_DAL.DeleteIssue(ddl_RentID.SelectedValue);
             MovieReturned Obj_Returned_Movie  = new MovieReturned
             { 
                ReturnID = Convert.ToInt32(ddl_RentID.SelectedValue),
                CustomerName = txt_CustomerName.Text,
                MovieTitle = txt_movieTitle.Text,
                IssueDate = Convert.ToDateTime(txtIssueDate.Text),
                ReturnDate = Convert.ToDateTime(txtReturnDate.Text),
                TotalRent = Convert.ToDecimal(txtTotalRent.Text)
            };
            //Once the movie is Returned form Rent It will insert into retunred table from Rent table
            MovieRent_DAL.InsertReturnedMovie(Obj_Returned_Movie);
            Response.Redirect("default.aspx");
        }
    }
    }
