﻿using System;
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

    public partial class WebForm1 : System.Web.UI.Page
    {
        string constr; 
        protected void Page_Load(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString; 
            if (!this.IsPostBack)
            {
                ViewState["Filter"] = "All";
                ViewState["Searched"] = String.Empty;
                BindGridView();
            }
        }       


        private void BindGridView()
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("filter_open_packages_searched", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Filter", ViewState["Filter"].ToString());
            cmd.Parameters.AddWithValue("@Searched", ViewState["Searched"].ToString());

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            DropDownList ddlOpened = (DropDownList)GridView1.HeaderRow.FindControl("ddlOpened");
            ddlOpened.Items.FindByValue(ViewState["Filter"].ToString()).Selected = true;
            
        }

        protected void OpenedChanged(object sender, EventArgs e)
        {
            DropDownList ddlOpened= (DropDownList)sender;
            ViewState["Filter"] = ddlOpened.SelectedValue;
            this.BindGridView();
        }

        protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {                
                String packageName = e.Row.Cells[1].Text;
                GridView gv_Child = (GridView)e.Row.FindControl("gv_Child");

                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("select p.PackageName, s.ShipName, s.Address, s.CreatingDate, s.Loads from Shipments as s inner join Packages as p on p.Shipment=s.Shipname where p.Packagename='"+packageName+"'", con);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                gv_Child.DataSource = dt;
                gv_Child.DataBind();

            }
        }

        /*protected void tb_TextChanged(object sender, GridViewRowEventArgs e)
        {
            t.Text = "changed";
            ViewState["Searched"] = tb.Text;        
            this.BindGridView();
        }*/

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                CheckBox open_ans = (CheckBox)row.FindControl("openedChBox");
                bool ans = open_ans.Checked;
                string packageName = row.Cells[1].Text;

                if (ans==false)
               
                  ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "MyKey", "Confirm("+"'"+packageName+"');", true);
                
                else
                 Response.Redirect("~/Update.aspx?PacNo=" + row.Cells[1].Text);
                
             }
        }     
     

        protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            BindGridView();
           
        }

      

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            
        }

        
    }
    
}