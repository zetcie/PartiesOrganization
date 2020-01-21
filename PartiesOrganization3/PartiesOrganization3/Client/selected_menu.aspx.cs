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
    public partial class selected_menu : System.Web.UI.Page
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

            id = Convert.ToInt32(Request.QueryString["id"].ToString());

            if (IsPostBack)
            {
                return;
            }

            DataTable dt1 = new DataTable();
            dt1.Clear();
            dt1.Columns.Add("meals_number");
            dt1.Columns.Add("dishes_name");
            dt1.Columns.Add("booging");
            dt1.Columns.Add("menu_id");

            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from menu as m join dishes as d on d.dish_id=m.dish where booging=" + id + " order by meals_number";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                DataRow dr1 = dt1.NewRow();
                dr1["menu_id"] = dr["menu_id"].ToString();
                dr1["meals_number"] = dr["meals_number"].ToString();
                dr1["dishes_name"] = dr["dishes_name"].ToString();
                dr1["booging"] = dr["booging"].ToString();

                dt1.Rows.Add(dr1);
            }
            d1.DataSource = dt1;
            d1.DataBind();
        }
    }
}