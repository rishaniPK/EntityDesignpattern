using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EntityDesignPattern.Database
{
    public class Customers_DAL
    {
        public List<Customer> GetCustomersData_DAL()
        {
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                // To list the Customers using LINQ Queries  
                var query = (from c in db.Customers select c).ToList();
                return query;
            }
        }
        public void InsertCustomers_DAL(Customer obj_Customers_insert)
        {
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                //adding object to movies table 
                db.Customers.Add(obj_Customers_insert);
                db.SaveChanges();
            }
        }
        //To get the details from the drop down box to select the data 
        public List<Customer> GetCustomerDetails_DAL(string selectedValue)
        {
            List<Customer> Obj_Customer_Detail = null;
            using (MovieRentalDBEntities db = new MovieRentalDBEntities())
            {
                // To list the Movie Return using LINQ Queries
                // u is an object with fetching the data with Database of table Customer
                //selected value is the parameter for search query with CustomerId
                Obj_Customer_Detail = (from u in db.Customers where u.CustomerID.ToString() == selectedValue select u).ToList();
                return Obj_Customer_Detail;
            }
        }
        public static int UpdateCustomer(Customer Obj_Cust_Update)
        {
            try
            {
                using (MovieRentalDBEntities db = new MovieRentalDBEntities())
                {
                    //Lembda expression for updating customer

                    Customer c = db.Customers.SingleOrDefault(x => x.CustomerID == Obj_Cust_Update.CustomerID);
                    c.FirstName = Obj_Cust_Update.FirstName;
                    c.LastName = Obj_Cust_Update.LastName;
                    c.Address = Obj_Cust_Update.Address;
                    c.Phone = Obj_Cust_Update.Phone;
                    db.SaveChanges();
                    return Obj_Cust_Update.CustomerID;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void DeletCustomer(string Obj_Cust_Delete)
        {
            try
            {
                using (MovieRentalDBEntities db = new MovieRentalDBEntities())
                {
                    //Lembda expression for deleting customer
                    Customer c = db.Customers.SingleOrDefault(x => x.CustomerID.ToString().Trim() == Obj_Cust_Delete.Trim());
                    if (c != null)
                    {
                        db.Customers.Remove(c);
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