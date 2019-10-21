using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EntityDesignPattern.Business
{
    public class Customer_BAL
    {//Initiate  the Object of Database layer
        Database.Customers_DAL obj_Database = new Database.Customers_DAL();
        public List<Customer> GetCustomersData_BAL()
        { 
            try
            {
                List<Customer> obj_customer = obj_Database.GetCustomersData_DAL();
                return obj_customer;
            }
            catch (Exception)
            {
                throw;
            }

        }
        // Adding new customer to table 
        public void InsertCustomers_BAL(Customer obj_Customers_insert)
        {
            try
            {
                //Initilazing from database layer 
                obj_Database.InsertCustomers_DAL(obj_Customers_insert);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //Getting customer details 
        public static List<Customer> GetCustomerDetails_BAL(string selectedValue)
        {
            //Initiate  the Object of Database layer
            Database.Customers_DAL obj_Database = new Database.Customers_DAL();
            
            try
            {
                return obj_Database.GetCustomerDetails_DAL(selectedValue);
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}