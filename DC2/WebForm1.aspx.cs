using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DC2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            //GridView1.DataBind();
            con = new SqlConnection(getConnectionString());
        }

        private string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        }

        protected void Button1_click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Table1 (firstname, lastname, city) VALUES (@firstname, @lastname, @city)", con);
                cmd.Parameters.AddWithValue("@firstname", firstname.Text.ToString());
                cmd.Parameters.AddWithValue("@lastname", lastname.Text.ToString());
                cmd.Parameters.AddWithValue("@city", city.Text.ToString());

                cmd.ExecuteNonQuery();
                con.Close();
                //GridView1.DataBind();
                Response.Write("<script>alert('Data Inserted..')</script>");

                firstname.Text = "";
                lastname.Text = "";
                city.Text = "";

            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            DeleteUser();
        }

        // user difine
        void DeleteUser()
        {
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Table1 WHERE id=@id", con);

                cmd.Parameters.AddWithValue("@id", textbox5.Text.ToString());
               
                cmd.ExecuteNonQuery();
                //GridView1.DataBind();
                con.Close();
                Response.Write("<script>alert('Data DELETED..')</script>");

               

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(getConnectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Table1 SET firstname=@firstname,lastname=@lastname,city=@city WHERE id=@id", con);


                cmd.Parameters.AddWithValue("@id", textbox5.Text.ToString());
                cmd.Parameters.AddWithValue("@firstname", firstname.Text.ToString());
                cmd.Parameters.AddWithValue("@lastname", lastname.Text.ToString());
                cmd.Parameters.AddWithValue("@city", city.Text.ToString());


                cmd.ExecuteNonQuery();
                //GridView1.DataBind();
                con.Close();
                Response.Write("<script>alert('Data UPDATED..')</script>");



            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView1.Visible =  true;
            GridView1.DataBind();
        }
    }
}