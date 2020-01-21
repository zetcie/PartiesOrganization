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
    public partial class add_ingredient : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from PRODUCTS";
                cmd.ExecuteNonQuery();
                product.DataSource = cmd.ExecuteReader();
                product.DataBind();

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
            cmd2.CommandText = "insert into ingredients values('"+ dish.SelectedValue.ToString() +"', '" + product.SelectedValue.ToString() + "','" + weight.Text + "')";
            cmd2.ExecuteNonQuery();

            Response.Redirect("add_ingredient.aspx");
        }
    }
}