using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GestionHotelera
{
    public partial class WFPruebaRegistro : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //Label label = e.Item.FindControl("lblId") as Label;

           
            //TextBox txtNumero = (TextBox)DetailsView1.FindControl("id_persona");

            //txtNumero.Attributes.Add("onblur", "validar();");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "valida", "validar();", true);
            //(el id de tu control).Attributes.Add("evento deseado", "javascript: return TuFuncion();")
            //ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: validar();</script>");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: alert('Se guardaron los datos satisfactoriamente');</script>");
        }

        
        protected void validarTodo_Click1(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "valida2", "<script>javascript: if (validarDocumento()) alert('EL NUMERO DE DOCUMENTO INGRESADO ES CORRECTO'); else alert('NO SE PUEDE VALIDAR EL NUMERO DE DOCUMENTO'); </ script > ");

        }
    }
       
    }