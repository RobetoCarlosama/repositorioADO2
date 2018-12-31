using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionHotelera
{
    public partial class home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfil"] != null)
            {
                lbl_perfil.Text = Session["perfil"].ToString();
                lbl_nombres.Text = "Bienvenid@" + ": " + Session["nombres"].ToString();
                lbl_nick.Text = Session["nick"].ToString();
            }


        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            //Session.Remove("perfil");
            //Session.Remove("nombres");
            //Session.Remove("nick");
            Response.Redirect("~/Login.aspx");

        }
    }
}