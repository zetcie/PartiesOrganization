using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PartiesOrganization3.Main
{
    public partial class login : System.Web.UI.Page
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
        }

        protected void b2_Click(object sender, EventArgs e)
        {
            int i = 0;
            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from users where email='" + email.Text + "' and password=HASHBYTES('SHA2_512', '" + password.Text + "')";
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            i = Convert.ToInt32(dt.Rows.Count.ToString());

            foreach (DataRow dr in dt.Rows)
            {
                DataRow dr1 = dt.NewRow();
                dr1["firstname"] = dr["firstname"].ToString();
                dr1["lastname"] = dr["lastname"].ToString();
                dr1["email"] = dr["email"].ToString();
                dr1["phone"] = dr["phone"].ToString();
                dr1["role"] = dr["role"].ToString();

                string r = (dr["role"].ToString());

                if (i > 0)
                {
                    if (r == "admin")
                    {
                        Session["admin"] = email.Text;
                        Response.Redirect("../Admin/reservations.aspx");
                    }
                    else if (r == "client")
                    {
                        Session["client"] = email.Text;
                        Response.Redirect("../Client/clients_reservations.aspx");
                    }
                    else
                    {
                        Response.Redirect("../Main/login.aspx");
                        error.Style.Add("display", "block");
                    }
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }
        }
    }
}