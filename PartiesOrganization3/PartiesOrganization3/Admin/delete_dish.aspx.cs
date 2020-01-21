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
    public partial class delete_dish : System.Web.UI.Page
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

            SqlCommand cmd3 = connectionString.CreateCommand();
            cmd3.CommandType = CommandType.Text;
            cmd3.CommandText = "delete menu where dish='" + Request.QueryString["id"].ToString() + "'";
            cmd3.ExecuteNonQuery();

            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete dishes where dish_id='"+ Request.QueryString["id"].ToString() +"'";
            cmd.ExecuteNonQuery();

            SqlCommand cmd2 = connectionString.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "delete ingredients where dish='" + Request.QueryString["id"].ToString() + "'";
            cmd2.ExecuteNonQuery();

            Response.Redirect("dishes.aspx");
        }
    }
}