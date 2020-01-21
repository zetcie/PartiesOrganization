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
    public partial class edit_dish : System.Web.UI.Page
    {
        int id;
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

            if (Request.QueryString["ID"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
            }
            else
            {
                Response.Redirect("dishes.aspx");
            }

            if (IsPostBack)
            {
                return;
            }

            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from dishes where dish_id=" + id + "";
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                name.Text = dr["dishes_name"].ToString();
                description.Text = dr["description"].ToString();
            }
        }

        protected void b2_Click(object sender, EventArgs e)
        {
            if (vegan.Checked == true)
            {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update dishes set dishes_name='" + name.Text + "', description='" + description.Text + "', vegan='yes', vegtarian='yes' where dish_id=" + id + "";
                cmd.ExecuteNonQuery();

                Response.Redirect("dishes.aspx");
            }
            else if (vegetarian.Checked == true)
            {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update dishes set dishes_name='" + name.Text + "', description='" + description.Text + "', vegan='no', vegtarian='yes' where dish_id=" + id + "";
                cmd.ExecuteNonQuery();

                Response.Redirect("dishes.aspx");
            }
            else
            {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update dishes set dishes_name='" + name.Text + "', description='" + description.Text + "', vegan='no', vegtarian='no' where dish_id=" + id + "";
                cmd.ExecuteNonQuery();

                Response.Redirect("dishes.aspx");
            }
        }
    }
}