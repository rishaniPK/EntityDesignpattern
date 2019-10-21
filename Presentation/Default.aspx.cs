using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntityDesignPattern
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            Customer_Fill();
            Movie_Fill();
            RentMovie_Fill();
            ReturnMovie();
        }

        private void Customer_Fill()
        {
            //Initiate a object under the Business.customer_Bal
            Business.Customer_BAL Obj_Cust = new Business.Customer_BAL();
            //method of creating Customer list (List<Customer> is the Customer table)
            List<Customer> Obj_Customer = Obj_Cust.GetCustomersData_BAL();
            if (Obj_Customer != null && Obj_Customer.Count > 0)
            {
                //Filling & Binding the gridview.  
                GVD_Customer.DataSource = Obj_Customer;
                GVD_Customer.DataBind();
            }
            else
            {
                GVD_Customer.DataSource = null;
                GVD_Customer.DataBind();
            }
        }

        private void Movie_Fill()
        {
            //Initiate a object under the Business.movies.bal
            Business.Movies_BAL Obj_Mov = new Business.Movies_BAL();
            //method of creating Customer list (List<Movy> is the Movies table)
            List<Movy> Obj_Movie = Obj_Mov.GetMoviesData_BAL();
            if (Obj_Movie != null && Obj_Movie.Count > 0)
            {
                //Filling & Binding the gridview.  
                GVD_Movies.DataSource = Obj_Movie;
                GVD_Movies.DataBind();
            }
            else
            {
                GVD_Movies.DataSource = null;
                GVD_Movies.DataBind();
            }
        }
        private void RentMovie_Fill()
        {
            {
                //Initiate a object under the Business.movies.bal
                Business.MovieRent_BAL Obj_MovRent = new Business.MovieRent_BAL();
                //method of creating Customer list (List<Movy> is the Movies table)
               List<MovieRent> Obj_MovieRent = Obj_MovRent.GetMovieRentData_BAL();
                if (Obj_MovieRent != null && Obj_MovieRent.Count > 0)
                {
                    //Filling & Binding the gridview.  
                    GVD_MovieRent.DataSource = Obj_MovieRent;
                    GVD_MovieRent.DataBind();
                }
                else
                {
                    GVD_MovieRent.DataSource = null;
                    GVD_MovieRent.DataBind();
                }
            }
        }
        private void ReturnMovie()
        {
            {
                //Initiate a object under the Business.movies.bal
                Business.MovieRent_BAL Obj_MovRent = new Business.MovieRent_BAL();
                //method of creating Customer list (List<Movy> is the Movies table)
                List<MovieReturned> Obj_MovieRent = Obj_MovRent.GetMovieReturnedData_BAL();
                    
                if (Obj_MovieRent != null && Obj_MovieRent.Count > 0)
                {
                    //Filling & Binding the gridview.  
                    GVD_ReturnedMovie.DataSource = Obj_MovieRent;
                    GVD_ReturnedMovie.DataBind();
                }
                else
                {
                    GVD_ReturnedMovie.DataSource = null;
                    GVD_ReturnedMovie.DataBind();
                }
            }
        }
        protected void GVD_Customer_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GVD_Movies_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}