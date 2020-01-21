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
    public partial class clients_reservations : System.Web.UI.Page
    {
        int number_of_meals =0;
        int costs =0;
        int guests=0;
        int final_price=0;
        static string conString = ConfigurationManager.ConnectionStrings["BDEntities"].ConnectionString;
        SqlConnection connectionString = new SqlConnection(conString);
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

            SqlCommand cmd3 = connectionString.CreateCommand();
            cmd3.CommandType = CommandType.Text;
            cmd3.CommandText = "select * from costs";
            cmd3.ExecuteNonQuery();

            DataTable dt1 = new DataTable();
            dt1.Clear();
            dt1.Columns.Add("date_of_party");
            dt1.Columns.Add("places");
            dt1.Columns.Add("name");
            dt1.Columns.Add("booking_id");
            dt1.Columns.Add("final_costs");

            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bookings as b join halls as h on h.hall_id=b.hall where tenant='" + Session["client"].ToString() + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                DataRow dr1 = dt1.NewRow();
                dr1["date_of_party"] = dr["date_of_party"].ToString();
                dr1["places"] = dr["places"].ToString();
                dr1["name"] = dr["name"].ToString();
                dr1["booking_id"] = dr["booking_id"].ToString();
                

                SqlCommand cmd2 = connectionString.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "SELECT COUNT(DISTINCT meals_number) FROM menu where booging="+ dr["booking_id"].ToString()+"";
                number_of_meals = (int)cmd2.ExecuteScalar();
                cmd2.CommandText = "select PRICE from COSTS where NUMER_OF_MEALS='" + number_of_meals.ToString() + "'";
                if (cmd2.ExecuteScalar() != null)
                {
                    costs = (int)cmd2.ExecuteScalar();
                }
                else
                {
                    costs = 0;
                }

                guests = Convert.ToInt32(dr["places"].ToString());

                final_price = guests * costs;

                dr1["final_costs"] = final_price.ToString();

                dt1.Rows.Add(dr1);
            }
            d1.DataSource = dt1;
            d1.DataBind();
        }
    }
}