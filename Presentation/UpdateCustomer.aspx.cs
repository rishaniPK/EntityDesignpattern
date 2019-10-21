using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntityDesignPattern.Presentation
{
    public partial class UpdateCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillCustomerDetails();
        }

        protected void ddl_Customer_SelectedIndexChanged(object sender, EventArgs e)
        {
          //Selecting the customer details 
            List<Customer> Obj_Customer = Business.Customer_BAL.GetCustomerDetails_BAL(ddl_Customer.SelectedValue);
            if (Obj_Customer != null && Obj_Customer.Count > 0)
            {
                for (int i = 0; i < Obj_Customer.Count; i++)
                {
                    txt_FirstName.Text = Obj_Customer[i].FirstName;
                    txt_LastName.Text = Obj_Customer[i].LastName;
                    txt_Address.Text = Obj_Customer[i].Address;
                    txt_Phone.Text = Obj_Customer[i].Phone;
                }
            }
        }
        private void FillCustomerDetails()
        {
            //filling the selected cutomer details 
            Business.Customer_BAL Obj_Cust = new Business.Customer_BAL();
            List<Customer> Obj_Customer_ID = Obj_Cust.GetCustomersData_BAL();

            if (Obj_Customer_ID != null && Obj_Customer_ID.Count > 0)
            {
                for (int i = 0; i < Obj_Customer_ID.Count; i++)
                {
                    ddl_Customer.Items.Add(Obj_Customer_ID[i].CustomerID.ToString());
                }
                ddl_Customer.Items.Insert(0, new ListItem("Select Customer", " "));
            }
            else
            {
                ddl_Customer.Items.Clear();
            }
        }
        //Upodate Function 
        protected void Update_btn_Click(object sender, EventArgs e)
        {
          Customer Obj_Ins_Cust = new Customer
            {
                CustomerID = Convert.ToInt32(ddl_Customer.SelectedValue),
                FirstName = txt_FirstName.Text,
                LastName = txt_LastName.Text,
                Address = txt_Address.Text,
                Phone = txt_Phone.Text,
               
            };
            Database.Customers_DAL.UpdateCustomer(Obj_Ins_Cust);
            Response.Redirect("default.aspx"); 
        }

        //delete function
        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            Database.Customers_DAL.DeletCustomer(ddl_Customer.SelectedValue);
            Response.Redirect("default.aspx");
        }
    }
}