using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    static public string GetString()
    {
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
        builder.DataSource = "DESKTOP-FHKCNSU\\SQLEXPRESS";
        builder.InitialCatalog = "ReceitaPedia";
        builder.IntegratedSecurity = true;

        return builder.ConnectionString;
    }

    protected List<pessoa> BuscarUsuario(String Email, String Senha)
    {
        DataContext db = new DataContext(GetString());
        return (from pessoa in db.GetTable<pessoa>()
                where (pessoa.senha == Senha && pessoa.email == Email)
                select pessoa).ToList<pessoa>();
    }

    public void OnLogin(Object src, EventArgs e)
    {
        if (BuscarUsuario(txtUsuario.Text, txtSenha.Text).Count != 0)
        {
            FormsAuthentication.RedirectFromLoginPage(txtUsuario.Text, chkLembrarSenha.Checked);
        }
        else
        {
            Response.Write("<script>alert('E-mail ou senha inválido!');</script>");
        }
    }



}