using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PartiesOrganization3.Client
{
    public partial class delete_reservation : System.Web.UI.Page
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

            SqlCommand cmd2 = connectionString.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "delete menu where booging='" + Request.QueryString["id"].ToString() + "'";
            cmd2.ExecuteNonQuery();

            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete bookings where booking_ID='" + Request.QueryString["id"].ToString() + "'";
            cmd.ExecuteNonQuery();

            Response.Redirect("clients_reservations.aspx");
        }
    }
}