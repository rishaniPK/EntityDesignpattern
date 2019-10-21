using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityDesignPattern.Database;

namespace EntityDesignPattern.Business
{
    public class MovieRent_BAL
    {
        //Initiate  the Object of Database layer
        MovieRent_DAL obj_Database = new MovieRent_DAL();
        //Getting the datas by listing the MovieRent table
        public List<MovieRent> GetMovieRentData_BAL()
        {
            List<MovieRent> obj_movierent = null;
            try
            {
               obj_movierent = obj_Database.GetMovieRentData_DAL();
                return obj_movierent;
            }
            catch (Exception)
            {
                throw;
            }
        }
        //Getting the datas by listing the MovieReturn table
        public List<MovieReturned> GetMovieReturnedData_BAL()
        {          
            try
            {
                List<MovieReturned> obj_Returned = obj_Database.GetMovieReturnedData_DAL();
           
                return obj_Returned;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<MovieReturned> GetMovieReturnedDetails_BAL(string selectedValue)
        {
            //Initiate  the Object of Database layer
            MovieRent_DAL obj_Database = new MovieRent_DAL();
            try
            {
                //Selected Id's deatils 
                List<MovieReturned> Obj_MovReturn_Detail = obj_Database.GetMovyReturnedDetails_DAL(selectedValue);
                return Obj_MovReturn_Detail;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //Inserting Rent
        public void InsertRent_BAL(MovieRent obj_rent_insert)

        {
            
           MovieRent_DAL obj_Database = new MovieRent_DAL();
            try
            {
                obj_Database.InsertRent_DAL(obj_rent_insert);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //Getting the datas by listing the MovieRent Details  table
        public static List<MovieRent> GetRentDetails_BAL(string selectedValue)
        {
           MovieRent_DAL obj_Database = new MovieRent_DAL();
            try
            {
                //Selected Id's deatils 
                List<MovieRent> Obj_Rent_Detail = obj_Database.GetRentDetails_DAL(selectedValue);
                return Obj_Rent_Detail;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}