using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace PartiesOrganization3.Admin
{
    public partial class add_dish : System.Web.UI.Page
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
        }
        protected void b2_Click(object sender, EventArgs e)
        {
            if (vegan.Checked == true)
            {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "insert into dishes values('" + name.Text + "','" + description.Text + "','yes', 'yes')";
                cmd.ExecuteNonQuery();

                Response.Redirect("dishes.aspx");
            }
            else if (vegetarian.Checked == true)
            {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "insert into dishes values('" + name.Text + "','" + description.Text + "','no', 'yes')";
                cmd.ExecuteNonQuery();

                Response.Redirect("dishes.aspx");
            }
            else
            {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "insert into dishes values('" + name.Text + "','" + description.Text + "','no', 'no')";
                cmd.ExecuteNonQuery();

                Response.Redirect("dishes.aspx");
            }
        }
    }
}