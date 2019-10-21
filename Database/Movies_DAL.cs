using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EntityDesignPattern.Database
{
    public class Movies_DAL
    {
        public List<Movy> GetMoviesData_DAL()
        {
         
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
         // To list the Movies using LINQ Queries  
         // m is an object with fetching the data with Database Movies
                var query = (from m in db.Movies select m).ToList();
                return query;
            }
        }

        public List<Movy> GetMovyDetails_DAL(string selectedValue)
        {
            List<Movy> Obj_Movy_Detail = null;
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                // To list the Movie Return using LINQ Queries
                // u is an object with fetching the data with Database of table Customer
                //selected value is the parameter for search query with CustomerId
                Obj_Movy_Detail = (from u in db.Movies where u.MovieID.ToString() == selectedValue select u).ToList();
                return Obj_Movy_Detail;
            }
        }
        // calling the object from business.Movies_BAL
        public void InsertMovies_DAL(Movy obj_movie_insert)
        {
            using(MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                //adding object to movies table 
                db.Movies.Add(obj_movie_insert);
                db.SaveChanges();
            }
        }
        public static int UpdateMovie(Movy Obj_Movi_Update)
        {
            try
            {
                using (MovieRentalDBEntities db = new MovieRentalDBEntities())
                {
                    //Lembda expression to update movie 

                    Movy c = db.Movies.SingleOrDefault(x => x.MovieID == Obj_Movi_Update.MovieID);
                    c.Title = Obj_Movi_Update.Title;
                    c.Year = Obj_Movi_Update.Year;
                    c.Gener = Obj_Movi_Update.Gener;
                    c.RentPerDay = Obj_Movi_Update.RentPerDay;
                    db.SaveChanges();
                    return Obj_Movi_Update.MovieID;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void DeleteMovie(string Obj_mov_Delete)
        {
            try
            {
                using (MovieRentalDBEntities db = new MovieRentalDBEntities())
                {
                    //Lembda expression to delete movie 
                    Movy c = db.Movies.SingleOrDefault(x => x.MovieID.ToString().Trim() == Obj_mov_Delete.Trim());
                    if (c != null)
                    {
                        db.Movies.Remove(c);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        }
    }