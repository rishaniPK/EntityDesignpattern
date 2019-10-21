using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntityDesignPattern
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Function of adding customer button 
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            //creating new object to get the new customer details 
            Customer Obj_Ins_Cust = new Customer
            {
                FirstName = txt_FirstName.Text,
                LastName = txt_LastName.Text,
                Address = txt_Address.Text,
                Phone = txt_Phone.Text,
            };
            
            Database.Customers_DAL obj_Database = new Database.Customers_DAL();
            // calling from database layer 
            obj_Database.InsertCustomers_DAL(Obj_Ins_Cust);
            Response.Redirect("default.aspx");
        }
    }
}