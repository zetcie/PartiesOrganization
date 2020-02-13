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
            cmd.CommandText = "SELECT products_name, PRODUCTS_WEIGHT, TotalQuantity, price FROM PRODUCTS AS p JOIN(SELECT sum(CEILING(CONVERT(float, WEIGHT, 1) * CONVERT(float, places, 1) / 5 / CONVERT(float, PRODUCTS_WEIGHT, 1))) AS TotalQuantity, PRODUCT FROM bookings as b join menu as m on m.booging = b.booking_id join dishes as d on m.dish = d.dish_id join ingredients as i on i.dish = d.dish_id join products as p on p.product_id = i.product where DATE_OF_PARTY between CONVERT(VARCHAR, GETDATE(), 105) and CONVERT(VARCHAR, DATEADD(day, 7, GETDATE()), 105) GROUP BY products_name, PRODUCT) AS s ON p.PRODUCT_ID = s.product";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                DataRow dr1 = dt1.NewRow();
                dr1["products_name"] = dr["products_name"].ToString();
                dr1["weight"] = dr["PRODUCTS_WEIGHT"].ToString();
                dr1["count"] = dr["TotalQuantity"].ToString();
                dr1["price"] = dr["price"].ToString();
                dt1.Rows.Add(dr1);
            }
            r1.DataSource = dt1;
            r1.DataBind();
        }
    }
}