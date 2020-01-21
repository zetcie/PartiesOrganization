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
    public partial class products_to_buy : System.Web.UI.Page
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

            DataTable dt1 = new DataTable();
            dt1.Clear();
            dt1.Columns.Add("products_name");
            dt1.Columns.Add("weight");
            dt1.Columns.Add("count");
            dt1.Columns.Add("price");

            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bookings as b join menu as m on m.booging=b.booking_id join dishes as d on m.dish=d.dish_id join ingredients as i on i.dish=d.dish_id join products as p on p.product_id=i.product where DATE_OF_PARTY between CONVERT(VARCHAR,GETDATE(),105) and CONVERT(VARCHAR,DATEADD(day, 7, GETDATE()),105)";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                DataRow dr1 = dt1.NewRow();
                dr1["products_name"] = dr["products_name"].ToString();
                dr1["weight"] = dr["PRODUCTS_WEIGHT"].ToString();
                dr1["count"] = (((Convert.ToInt32(dr["places"].ToString()) / 5) * Convert.ToInt32(dr["weight"].ToString())) / (Convert.ToInt32(dr["PRODUCTS_WEIGHT"].ToString()))).ToString();
                dr1["price"] = dr["price"].ToString();

                /*SqlCommand cmd2 = connectionString.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "SELECT COUNT(DISTINCT meals_number) FROM menu where booging=" + dr["booking_id"].ToString() + "";
                int number_of_meals = (int)cmd2.ExecuteScalar();
                cmd2.CommandText = "select PRICE from COSTS where NUMER_OF_MEALS='" + number_of_meals.ToString() + "'";
                int costs;
                if (cmd2.ExecuteScalar() != null)
                {
                    costs = (int)cmd2.ExecuteScalar();
                }
                else
                {
                    costs = 0;
                }
                int guests = Convert.ToInt32(dr["places"].ToString());

                int final_price = guests * costs;

                dr1["final_costs"] = final_price.ToString();
                */
                dt1.Rows.Add(dr1);
            }
            r1.DataSource = dt1;
            r1.DataBind();
        }
    }
}