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
    public partial class delete_meal : System.Web.UI.Page
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
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "delete menu where menu_id='" + Request.QueryString["id"].ToString() + "'";
                cmd.ExecuteNonQuery();

                Response.Redirect("reservations.aspx");
            }

        }
    }
}