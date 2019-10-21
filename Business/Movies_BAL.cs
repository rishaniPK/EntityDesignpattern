using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EntityDesignPattern.Business
{
    public class Movies_BAL
    {
        //Initiate  the Object of Database layer
        Database.Movies_DAL obj_Database = new Database.Movies_DAL();
        public List<Movy> GetMoviesData_BAL()
        {
            try
            {
                List<Movy> obj_Movie = obj_Database.GetMoviesData_DAL();

                return obj_Movie;
            }
            catch (Exception)
            {
                throw;
            }

        }
        //Adding new  movies 
        public void InsertMovies_BAL(Movy obj_movie_insert)
        {
            try
            {
                obj_Database.InsertMovies_DAL(obj_movie_insert);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //Getting details of movies 
        public static List<Movy> GetMovieDetails_BAL(string selectedValue)
        {
            //Initiate  the Object of Database layer
            Database.Movies_DAL obj_Database = new Database.Movies_DAL();
            try
            {
                List<Movy> Obj_Customer_Detail = obj_Database.GetMovyDetails_DAL(selectedValue);
                return Obj_Customer_Detail;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}