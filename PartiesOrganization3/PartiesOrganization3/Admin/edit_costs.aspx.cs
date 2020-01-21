using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PartiesOrganization3.Admin
{
    public partial class edit_costs : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.ConnectionStrings["BDEntities"].ConnectionString;
        SqlConnection connectionString = new SqlConnection(conString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (connectionString.State == ConnectionState.Open)
            {
                connectionString.Close();
            }
            connectionString.Open();

            if (Session["admin"] == null)
            {
                Response.Redirect("../Main/login.aspx");
            }

            if (IsPostBack)
            {
                return;
            }
            else
            {
                SqlCommand cmd2 = connectionString.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "select * from costs";
                cmd2.ExecuteNonQuery();
                cost.DataSource = cmd2.ExecuteReader();
                cost.DataBind();
            }

            
        }

        protected void itemSelected(object sender, EventArgs e)
        {
            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from costs where cost_id='" + cost.SelectedValue + "'";
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                price.Text = dr["price"].ToString();
            }
        }

        protected void b2_Click(object sender, EventArgs e)
        {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update costs set price='" + price.Text + "' where cost_id='"+cost.SelectedValue+"'";
                cmd.ExecuteNonQuery();

                Response.Redirect("edit_costs.aspx");
            
        }
    }
}