using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AccesoData;
using LogicaNegocios;
using System.Data.Linq;

namespace GestionHotelera
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] != null)
            {
                Response.Redirect("~/Login.aspx");

            }

        }

        protected void Page_init()
        {
            //Arranca antes del

        }

        private void Ingresar()
        {
            string usuario = txtUsuario.Value;
            string pass = txtPassword.Value;
            if (usuario == string.Empty && pass == string.Empty)
            {
                //Desplegar mensaje de error SI ESTA VACIO
                lbl_error.Text = ("Por favor ingrese sus credenciales");

            }
            else
            {
                bool existe = false;
                existe = Llogin.Autentificar(usuario, pass);
                if (existe)
                {
                    tbl_persona user = new tbl_persona();
                    tbl_usuario nk = new tbl_usuario();
                    tbl_rol rol = new tbl_rol();

                    user = Llogin.ObtenerUsuario(usuario, pass);
                    nk = Llogin.ObtenerNick(usuario, pass);
                    rol = Llogin.obtenerPerfil(usuario, pass);

                    //crear la sesion
                    Llogin cs = new Llogin();
                    
                    Session["perfil"] = rol.descripcion_rol;
                    Session["nombres"] = user.nombre1_persona + " " + user.apellido1_persona;
                    Session["nick"] = nk.nick_usuario;
                    Response.Redirect("~/inicio.aspx");
                }
                else
                {
                    //Mensaje de error
                    lbl_error.Text = ("Usuario o Clave incorrectos");
                    //lbl_error.Text = ("El usuario no existe");
                }
            }
        }


        private void Close()
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Ingresar();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}