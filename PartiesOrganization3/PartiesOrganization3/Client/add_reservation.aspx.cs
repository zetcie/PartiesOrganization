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
    public partial class add_reservation : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.ConnectionStrings["BDEntities"].ConnectionString;
        SqlConnection connectionString = new SqlConnection(conString);
        protected DataSet dsDates;
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

            if (!IsPostBack)
            {
                date_of_party.VisibleDate = DateTime.Today;

                SqlCommand cmd = connectionString.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from halls";
                cmd.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
                hall.DataSource = cmd.ExecuteReader();
                hall.DataBind();
            }
            GetDates();
            date_of_party.VisibleDate = DateTime.Today;


        }

        protected void b2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd2 = connectionString.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "insert into bookings values('" + date_of_party.SelectedDate.ToString("dd-MM-yyyy") + "', '" + places.Text + "','" + hall.SelectedValue.ToString() + "', '" + Session["client"].ToString() + "')";
            cmd2.ExecuteNonQuery();

            Response.Redirect("clients_reservations.aspx");
        }

        protected void GetDates()
        {
            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bookings ";
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            dt1.Clear();
            dt1.Columns.Add("booking_id");
            dt1.Columns.Add("date_of_party");
            dt1.Columns.Add("places");
            dt1.Columns.Add("hall");
            dt1.Columns.Add("tenant");

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                DataRow dr1 = dt1.NewRow();
                dr1["booking_id"] = dr["booking_id"].ToString();
                dr1["date_of_party"] = dr["date_of_party"].ToString();
                dr1["places"] = dr["places"].ToString();
                dr1["hall"] = dr["hall"].ToString();
                dr1["tenant"] = dr["tenant"].ToString();

                dt1.Rows.Add(dr1);
            }
            DataSet ds = new DataSet();
            ds.Tables.Add(dt1);
            dsDates = ds;
        }

        protected void Calendar1DayRender(object sender, DayRenderEventArgs e)
        {
            
            DateTime pastday = e.Day.Date;
            DateTime date = DateTime.Now;
            int year = date.Year;
            int month = date.Month;
            int day = date.Day;
            DateTime today = new DateTime(year, month, day);
            if (pastday.CompareTo(today) < 0)
            {
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Day.IsSelectable = false;
            }
            DateTime nextDate;
            if (dsDates != null)
            {
                foreach (DataRow dr in dsDates.Tables[0].Rows)
                {
                    nextDate = Convert.ToDateTime(dr["date_of_party"].ToString());
                    if (nextDate.Date == e.Day.Date)
                    {
                        if (hall.SelectedValue == (dr["hall"]).ToString())
                        {
                            e.Day.IsSelectable = false;
                            e.Cell.BackColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
        }

        protected void Selection_Change(Object sender, EventArgs e)
        {
            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select size, places from halls where hall_id='" + hall.SelectedValue.ToString() + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                max_places.Text = "Maksymalna ilość miejsc: " + dr["places"].ToString();
                size.Text = "Rozmiar sali: " + dr["size"].ToString();
                RangeValidator2.MaximumValue = (dr["places"]).ToString();
                RangeValidator2.Type = ValidationDataType.Integer;
                RangeValidator2.Validate();
            }
        }
    }
}