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
    public partial class add_new_dish : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.ConnectionStrings["BDEntities"].ConnectionString;
        SqlConnection connectionString = new SqlConnection(conString);
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (connectionString.State == ConnectionState.Open)
            {
                connectionString.Close();
            }
            connectionString.Open();

            if (Session["client"] == null)
            {
                Response.Redirect("../Main/login.aspx");
            }

            if (Request.QueryString["ID"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
            }
            else
            {
                Response.Redirect("clients_reservations.aspx");
            }

            if (IsPostBack)
            {
                return;
            }
            else
            {
                SqlCommand cmd3 = connectionString.CreateCommand();
                cmd3.CommandType = CommandType.Text;
                cmd3.CommandText = "select * from DISHES";
                cmd3.ExecuteNonQuery();
                dish.DataSource = cmd3.ExecuteReader();
                dish.DataBind();
            }
        }

        protected void b2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd2 = connectionString.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "insert into menu values('" + dish.SelectedValue.ToString() + "', '" + id + "', '" + meals_number.Text + "')";
            cmd2.ExecuteNonQuery();

            Response.Redirect("add_new_dish.aspx");
        }

        protected void Selection_Change(Object sender, EventArgs e)
        {
            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select description from dishes where dish_id='" + dish.SelectedValue.ToString() + "'";
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                description.Text = dr["description"].ToString();
            }
        }
    }
}