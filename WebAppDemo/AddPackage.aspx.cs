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
    public partial class AddPackage : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("add_empty_package", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PackageName", txtPackageName.Text);
            cmd.Parameters.AddWithValue("@CreatingDate", txtCreatingDate.Text);
            cmd.Parameters.AddWithValue("@Opened", openedCheckBox.Checked);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);

            if (txtClosingDate.Text.Equals(("NULL")) || txtClosingDate.Text.Equals(("null")) || txtClosingDate.Text.Equals(("Null")) || txtClosingDate.Text == string.Empty)
                cmd.Parameters.AddWithValue("@ClosingDate", (object)DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@ClosingDate", txtClosingDate.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "close", "refreshAndClose();", true);

        }
    }
}