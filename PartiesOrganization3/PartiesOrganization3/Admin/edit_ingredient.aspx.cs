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
    public partial class edit_ingredient : System.Web.UI.Page
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
                Response.Redirect("ingredients.aspx");
            }

            if (IsPostBack)
            {
                return;
            }
            else
            {
                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from INGREDIENTS where ingredient_id=" + this.Request["id"].ToString() + "";
                cmd.ExecuteNonQuery();

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    weight.Text = dr["weight"].ToString();
                }
            }
        }

        protected void b2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update INGREDIENTS set weight='" + weight.Text + "' where INGREDIENT_ID=" + this.Request["id"].ToString() + "";
            cmd.ExecuteNonQuery();

            Response.Redirect("ingredients.aspx");
        }
    }
}