using System;
using System.Collections.Generic;
using EntityDesignPattern.Business;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntityDesignPattern.Presentation
{
    public partial class AddMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Function of adding Movie button 
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            //creating new object to get the new Movie details 
            Movy Obj_Int_Movie = new Movy
            {
                Title = txt_title.Text,
                Year = txt_year.Text,
                Gener = txt_Gener.Text,
                RentPerDay = Convert.ToDecimal(txt_RentPerDay.Text)
            };
            Database.Movies_DAL obj_Database = new Database.Movies_DAL();
            // calling from database layer 
            obj_Database.InsertMovies_DAL(Obj_Int_Movie);
            Response.Redirect("default.aspx");
        }
    }
}