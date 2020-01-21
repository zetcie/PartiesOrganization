using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace PartiesOrganization3.Main
{
    public partial class registration : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.ConnectionStrings["BDEntities"].ConnectionString;
        SqlConnection connectionString = new SqlConnection(conString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(connectionString.State == ConnectionState.Open)
            {
                connectionString.Close();
            }
            connectionString.Open();
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            int count = 0;

            SqlCommand cmd = connectionString.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from users where email='"+email.Text+"'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            count = Convert.ToInt32(dt.Rows.Count.ToString());

            if (count > 0)
            {
                error.Style.Add("display", "block");
                email.Style.Clear();
            }
            else
            {
                if(password != submitpassword)
                {
                    SqlCommand cmd1 = connectionString.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "insert into users values('" + email.Text + "','" + firstname.Text + "','" + lastname.Text + "', HASHBYTES('SHA2_512', '" + password.Text + "'),'" + phonenumber.Text + "','client')";
                    cmd1.ExecuteNonQuery();

                    Response.Redirect("login.aspx");
                }
                else
                {
                    error2.Style.Add("display", "block");
                    password.Style.Clear();
                    submitpassword.Style.Clear();
                }
            }
        }
    }
}