using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityDesignPattern.Presentation;

namespace EntityDesignPattern.Database
{
    public class MovieRent_DAL
    {
        public List<MovieRent> GetMovieRentData_DAL()
        {
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                // To list the Movies Rent using LINQ Queries  
                // a is an object with fetching the data with Database of table MovieReturn
                var query = (from a in db.MovieRents select a).ToList();
                return query;
            }
        }
        public List<MovieReturned> GetMovieReturnedData_DAL()
        {
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                // To list the Movie Return using LINQ Queries
                // a is an object with fetching the data with Database of table MovieReturn
                var query = (from a in db.MovieReturneds select a).ToList();
                return query;
            }
        }

        //Inserting data to Rent Table
        public void InsertRent_DAL(MovieRent obj_rent_insert)
        {
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                //adding object to movies table 
                db.MovieRents.Add(obj_rent_insert);
                db.SaveChanges();
            }
        }
        public List<MovieRent> GetRentDetails_DAL(string selectedValue)
        {
            List<MovieRent> Obj_Rent_Detail = null;
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                // To list the Movie Return using LINQ Queries
                // u is an object with fetching the data with Database of table MovieRent
                //selected value is the parameter for search query with RentID
                Obj_Rent_Detail = (from u in db.MovieRents where u.RentID.ToString() == selectedValue select u).ToList();
                return Obj_Rent_Detail;
            }
        }
        public List<MovieReturned> GetMovyReturnedDetails_DAL(string selectedValue)
        {
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                // To list the Movie Return using LINQ Queries
                // u is an object with fetching the data with Database of table MovieRent
                //selected value is the parameter for search query with RentID
                List<MovieReturned> Obj_Return_Detail = (from u in db.MovieReturneds where u.ReturnID.ToString() == selectedValue select u).ToList();
                return Obj_Return_Detail;
            }
        }

        public static void DeleteIssue(string Obj_Issue_Delete)
        {
            try
            {
                using (MovieRentalDBEntities db = new MovieRentalDBEntities())
                {
                    //Lembda expression to delete the issues movie
                    MovieRent c = db.MovieRents.SingleOrDefault(x => x.RentID.ToString().Trim() == Obj_Issue_Delete.Trim());
                    if (c != null)
                    {
                        db.MovieRents.Remove(c);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //Inserting data to return movie table 
        public static void InsertReturnedMovie(MovieReturned Obj_Returned_Movie_Insert)
        {
            try
            {
                using (MovieRentalDBEntities db = new MovieRentalDBEntities())
                {
                    db.MovieReturneds.Add(Obj_Returned_Movie_Insert);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}