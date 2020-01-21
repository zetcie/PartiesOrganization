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
    public partial class reservations : System.Web.UI.Page
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
            dt1.Columns.Add("date_of_party");
            dt1.Columns.Add("places");
            dt1.Columns.Add("name");
            dt1.Columns.Add("firstname");
            dt1.Columns.Add("lastname");
            dt1.Columns.Add("booking_id");
            dt1.Columns.Add("final_costs");

            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bookings as b join halls as h on h.hall_id=b.hall join users as u on u.email=b.tenant";
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
                dr1["firstname"] = dr["firstname"].ToString();
                dr1["lastname"] = dr["lastname"].ToString();
                dr1["booking_id"] = dr["booking_id"].ToString();


                SqlCommand cmd2 = connectionString.CreateCommand();
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

                dt1.Rows.Add(dr1);
            }
            r1.DataSource = dt1;
            r1.DataBind();
        }
    }
}