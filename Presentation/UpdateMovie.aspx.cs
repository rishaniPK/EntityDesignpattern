using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntityDesignPattern.Presentation
{
    public partial class UpdateMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillMovieDetails();
        }

        protected void btn_movieUpdate(object sender, EventArgs e)
        {

        }
        //Selecting the Movie details
        protected void ddl_Movie_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Movy> Obj_movie = Business.Movies_BAL.GetMovieDetails_BAL(ddl_Movie.SelectedValue);
            if (Obj_movie != null && Obj_movie.Count > 0)
            {
                for (int i = 0; i < Obj_movie.Count; i++)
                {
                    txt_title.Text = Obj_movie[i].Title;
                    txt_year.Text = Obj_movie[i].Year;
                    txt_Gener.Text = Obj_movie[i].Gener;
                    txt_RentPerDay.Text = Obj_movie[i].RentPerDay.ToString();
                }
            }
        }
        //filling the selected Movie details 
        private void FillMovieDetails()
        {
           Business.Movies_BAL Obj_Movies = new Business.Movies_BAL();
            List<Movy> Obj_Mov_ID = Obj_Movies.GetMoviesData_BAL();

            if (Obj_Mov_ID != null && Obj_Mov_ID.Count > 0)
            {
                for (int i = 0; i < Obj_Mov_ID.Count; i++)
                {

                    ddl_Movie.Items.Add(Obj_Mov_ID[i].MovieID.ToString());
                }
                ddl_Movie.Items.Insert(0, new ListItem("Select Movie", " "));
            }
            else
            {
                ddl_Movie.Items.Clear();
            }
        }
        //Upodate Function 
        protected void Update_btn_Click(object sender, EventArgs e)
        {
            Movy Obj_Ins_Movi = new Movy
            {
                MovieID = Convert.ToInt32(ddl_Movie.SelectedValue),
                Title = txt_title.Text,
                Year = txt_year.Text,
                Gener = txt_Gener.Text,
                RentPerDay = Convert.ToDecimal(txt_RentPerDay.Text)
            };
            Database.Movies_DAL.UpdateMovie(Obj_Ins_Movi);
            Response.Redirect("default.aspx");
        }
        //delete function
        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            Database.Movies_DAL.DeleteMovie(ddl_Movie.SelectedValue);
            Response.Redirect("default.aspx");
        }
    }
}