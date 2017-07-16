using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppDemo
{
    public partial class AddShipment : System.Web.UI.Page
    {
        readonly string constr = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            cancelBtn.Attributes.Add("onclick", "window.close();");
        }

        protected void submitBtn_OnClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("add_shipment", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ShipName", txtShipName.Text);
            cmd.Parameters.AddWithValue("@CreatingDate", txtCreatingDate.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Loads", txtLoads.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "close", "refreshAndClose();", true);
           
        }
        
    }
}