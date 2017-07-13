using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppDemo

{
   
    public partial class Update : System.Web.UI.Page
    {
        
        string packageName;
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            packageName = Request.QueryString["PacNo"].ToString();

            if (!IsPostBack)
            {
                FillComboShipments();
                BindTextBoxvalues();
                
            }
        }

        protected void Application_Error(Object sender, EventArgs e)
        {
            Session["CurrentError"] = "Global: " + Server.GetLastError().Message;
            Server.Transfer("lasterr.aspx");
        }

        private void BindTextBoxvalues()
        {
            DataTable dt = GetCurrentPackage();
            RepeaterHandler();

            pacName.Text = dt.Rows[0][0].ToString();
            createDate.Text = dt.Rows[0][1].ToString();
            closeDate.Text = dt.Rows[0][2].ToString();
            openedCheckBox.Checked = Convert.ToBoolean(dt.Rows[0][3].ToString());
            city.Text = dt.Rows[0][5].ToString();

        }

        private void FillComboShipments()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select a.shipname, a.Address, a.CreatingDate, a.Loads from Shipments as a full outer join Packages as p on p.shipment=a.shipname where p.Shipment is null and a.ShipName is not null", con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dt);
            int flag = 0;
            foreach (Shipment ship in shipments)
            {
                foreach(DataRow tableShip in dt.Rows)
                {
                    if (ship.ShipName.Equals(tableShip["ShipName"]))
                    {
                        tableShip.Delete();
                        flag = 1;
                        break;
                    }
                }
                if (flag == 1) break;    
            }

            cb1.DataSource = dt;
            cb1.DataValueField = "ShipName";
            cb1.DataBind();

            cb1.Items.Insert(0, "--SelectShipment--");
            con.Close();

        }

        private DataTable GetCurrentPackage()
        {
            SqlConnection con = new SqlConnection(constr);
            DataTable dt = new DataTable();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Packages where PackageName= '" + packageName + " ' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                
            }
            catch(Exception ex)
            {                
                 Session["CurrentError"] = ex.Message; 
 
            }
            finally
            {
                con.Close();                
            }        
            return dt;
            
            
        }      
        

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            packages.Clear();
            shipments.Clear();
            Response.Redirect("~/WebForm1.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "MyKey2", "Warning();", true);
                return;
            }

               
            DataTable dt = GetCurrentPackage();
            SqlConnection con = new SqlConnection(constr);

            SqlCommand getShipCmd = new SqlCommand("select Shipment from Packages where PackageName='" + packageName + "'", con);
            DataTable shipments = new DataTable();

            SqlDataAdapter shipmentsSql = new SqlDataAdapter(getShipCmd);

            shipmentsSql.Fill(shipments);           

            

            /*try
            {      */          
                con.Open();

                SqlCommand cmd2;


            foreach (DataRow ship in shipments.Rows)
            {
                if (ship[0].ToString() == String.Empty)
                    cmd2 = new SqlCommand("update Packages set CreatingDate=@CreatingDate,City=@City, ClosingDate=@ClosingDate, Opened=@Opened where PackageName=@PackageName", con);
                else
                    cmd2 = new SqlCommand("update Packages set CreatingDate=@CreatingDate,City=@City, ClosingDate=@ClosingDate, Opened=@Opened where PackageName=@PackageName and Shipment=@Shipment", con);

                cmd2.Parameters.AddWithValue("@CreatingDate", createDate.Text);
                cmd2.Parameters.AddWithValue("@Opened", openedCheckBox.Checked);
                cmd2.Parameters.AddWithValue("@PackageName", packageName);
                cmd2.Parameters.AddWithValue("@City", city.Text);
                cmd2.Parameters.AddWithValue("@Shipment", ship[0].ToString());

                if (closeDate.Text.Equals(("NULL")) || closeDate.Text.Equals(("null")) || closeDate.Text.Equals(("Null")) || closeDate.Text == string.Empty)
                    cmd2.Parameters.AddWithValue("@ClosingDate", (object) DBNull.Value);
                else
                    cmd2.Parameters.AddWithValue("@ClosingDate", closeDate.Text);

                cmd2.ExecuteNonQuery();

              }


            /*if (closeDate.Text.Equals(("NULL")) || closeDate.Text.Equals(("null")) || closeDate.Text.Equals(("Null")) || closeDate.Text == string.Empty)
            {          
            
                foreach (DataRow ship in shipments.Rows)
                {
                    TextBox5.Text = ship[0].ToString();
                    if(ship[0].ToString()=="NULL")
                        cmd2 = new SqlCommand("update Packages set CreatingDate='" + createDate.Text + "',City='" + city.Text + "', ClosingDate=NULL, Opened='" + openedCheckBox.Checked + "'where PackageName='" + pacName.Text + "'", con);


                    cmd2 = new SqlCommand("update Packages set CreatingDate='" + createDate.Text + "',City='" + city.Text + "', ClosingDate=NULL, Opened='" + openedCheckBox.Checked + "'where PackageName='" + pacName.Text + "' and Shipment='"+ship[0].ToString()+"'", con);
                    if (Page.IsValid == true) cmd2.ExecuteNonQuery();
                }
            }
            else
            { 
                foreach (DataRow ship in shipments.Rows)
                {
                    if (ship[0].ToString() == "NULL")
                        cmd2 = new SqlCommand("update Packages set CreatingDate='" + createDate.Text + "',City='" + city.Text + "',ClosingDate='" + closeDate.Text + "',Opened='" + openedCheckBox.Checked + "'where PackageName='" + pacName.Text + "'", con);

                    cmd2 = new SqlCommand("update Packages set CreatingDate='" + createDate.Text + "',City='" + city.Text + "',ClosingDate='" + closeDate.Text + "',Opened='" + openedCheckBox.Checked + "'where PackageName='" + pacName.Text +"' and Shipment='" + ship[0].ToString() + "'", con);
                    if (Page.IsValid == true) cmd2.ExecuteNonQuery();
                }
            }*/
                    
            
                

            /*}
            catch(Exception ex)
            {
                Session["CurrentError"] = ex.Message;            
                

            }
            finally
            {
                con.Close();
            }   
            */

        }

        private void RepeaterHandler()
        {            
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd2 = new SqlCommand("select * from Shipments inner join Packages on Packages.Shipment=Shipments.ShipName where PackageName = '" + packageName + " ' ", con);
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

            da2.Fill(dt2);
            rptShipments.DataSource = dt2;
            rptShipments.DataBind();
            
        }

        private void updateShipments()
        {
            
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[4] { new DataColumn("ShipName", typeof(string)), new DataColumn("Address", typeof(object)), new DataColumn("CreatingDate", typeof(object)), new DataColumn("Loads", typeof(object)) });


            foreach (Shipment s in shipments)
            {
                dt.Rows.Add(s.ShipName, s.Address, s.CreatingDate, s.Loads);
            }

            ListView1.DataSource = dt;
            ListView1.DataBind();
            FillComboShipments();
        }

        
        protected void customValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (city.Text.Equals(String.Empty))
            {
                requiredCityValidator.ErrorMessage = "This field can't be empty";
                args.IsValid = false;
            }

            if (closeDate.Text == string.Empty || createDate.Text == string.Empty)
                return;

            DateTime close = DateTime.ParseExact(closeDate.Text, "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);
            DateTime create = DateTime.ParseExact(createDate.Text, "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);
            if (close < create)
            {
                customValidator1.ErrorMessage = "Close date can't be earlier than create date";
                args.IsValid = false;
                
            }

            

        }
        
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd2 = new SqlCommand("select * from Packages where PackageName = '" + packageName + " ' ", con);
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

            da2.Fill(dt2);

            List<Package> li = packages;
            li.Add(new Package(packageName, dt2.Rows[0][1], dt2.Rows[0][2], dt2.Rows[0][3], dt2.Rows[0][5], cb1.Text));
            packages = li;

            SqlCommand cmd3 = new SqlCommand("select * from Shipments where ShipName = '" + cb1.Text + "'", con);
            DataTable dt3 = new DataTable();
            SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
            da3.Fill(dt3);

            List<Shipment> ship = shipments;
            ship.Add(new Shipment(cb1.Text, dt3.Rows[0][1], dt3.Rows[0][2], dt3.Rows[0][3]));
            shipments = ship;

            updateShipments();    

        }

        private void PrintShipments()
        {
            ListView1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete" && e.CommandArgument.ToString() != "")
            {
                List<Package> li = packages;
                li.RemoveAt((int)e.CommandArgument);
                packages = li;
            }
        }

            
        protected void Button1_Click(object sender, EventArgs e)
        {
            packages.Clear();
            shipments.Clear();
            btnUpdate_Click(sender, e);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "window.location='WebForm1.aspx';", true);

        }

        protected void btnSaveShip_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(constr);
            con.Open();

            foreach (Package p in packages){

                SqlCommand cmd;

                cmd = new SqlCommand("add_shipment_to_package",con);
                cmd.Parameters.AddWithValue("@PackageName", p.PackageName);
                cmd.Parameters.AddWithValue("@Shipment", p.Shipment);
                cmd.CommandType = CommandType.StoredProcedure;
                int numberSql = Convert.ToInt32(cmd.ExecuteScalar());

           }
            shipments.Clear();
            packages.Clear();
            updateShipments();                  
            
            con.Close();
            
            RepeaterHandler();
        }

        private bool CheckPackageCapacity()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand cmd = new SqlCommand("select count(PackageName) from Packages where PackageName='" + packageName+"'", con);
            int numberSql = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            //int number = Convert.ToInt32(numberSql);
            if (numberSql > 1) return false;
            return true;
            
        }

        protected void DeleteButtonDB(object sender, CommandEventArgs e)      
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            bool single = CheckPackageCapacity();

            SqlCommand cmd;
            if (single)            
                cmd = new SqlCommand("update Packages set Shipment=null where PackageName='" + packageName+ "'", con);
            
            else
                cmd = new SqlCommand("delete from Packages where Shipment='" + e.CommandArgument + "' and PackageName='"+packageName+"'", con);

            cmd.ExecuteNonQuery();
            RepeaterHandler();
            FillComboShipments();
            con.Close();
        }

        protected void DeleteButton(object sender, CommandEventArgs e)
        {
            Package searched = new Package();
            Shipment searchedShip = new Shipment();
            List<Package> li = packages;
            foreach (Package p in li)
            {

                if (p.Shipment.Equals(e.CommandArgument))
                    searched = p;
            }
            li.Remove(searched);
            packages = li;

            List<Shipment> s = shipments;
            foreach (Shipment ship in s)
            {
                if (ship.ShipName.Equals(e.CommandArgument))
                    searchedShip = ship;
            }
            s.Remove(searchedShip);
            updateShipments();
            shipments = s;
        }

        private void ShowMessage(string msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }

        protected List<Package> packages
        {
            get
            {
                List<Package> li = new List<Package>();

                if (Session["packages"] != null)
                {
                    try
                    {
                        return (List<Package>)Session["packages"];
                    }
                    catch (Exception ex)
                    {
                        return li;
                    }
                }
                else
                {
                    return li;
                }
            }
            set
            {
                Session["packages"] = value;
            }
        }
        protected List<Shipment> shipments
        {
            get
            {
                List<Shipment> li = new List<Shipment>();

                if (Session["shipments"] != null)
                {
                    try
                    {
                        return (List<Shipment>)Session["shipments"];
                    }
                    catch (Exception ex)
                    {
                        return li;
                    }
                }
                else
                {
                    return li;
                }
            }
            set
            {
                Session["shipments"] = value;
            }
        }

    }

    
}