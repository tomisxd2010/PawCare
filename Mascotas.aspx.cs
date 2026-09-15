using System;
using System.Data;
using System.Data.SqlClient;

namespace PawCare
{
    public partial class Mascotas : System.Web.UI.Page
    {
        string conexion = "Server=TOMISMENDOZA\\MSSQLSERVER1;Database=PawCare;Integrated Security=True;TrustServerCertificate=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarMascotas();
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("spInsertarMascota", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@NombreMascota", txtNombreMascota.Text));
                cmd.Parameters.Add(new SqlParameter("@NombreDueno", txtNombreDueno.Text));
                cmd.Parameters.Add(new SqlParameter("@Tipo", ddlTipo.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@Edad", Convert.ToInt32(txtEdad.Text)));
                cmd.Parameters.Add(new SqlParameter("@Telefono", txtTelefono.Text));
                cmd.Parameters.Add(new SqlParameter("@Observaciones", txtObservaciones.Text));

                cn.Open();
                cmd.ExecuteNonQuery();
            }

            Limpiar();
            ListarMascotas();
        }

        private void ListarMascotas()
        {
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("spListarMascotas", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                gvMascotas.DataSource = dt;
                gvMascotas.DataBind();
            }
        }

        private void Limpiar()
        {
            txtNombreMascota.Text = "";
            txtNombreDueno.Text = "";
            ddlTipo.SelectedIndex = 0;
            txtEdad.Text = "";
            txtTelefono.Text = "";
            txtObservaciones.Text = "";
        }
    }
}