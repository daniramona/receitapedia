using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CadastroReceitas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCriarReceita_Click(object sender, EventArgs e)
    {
        NameValueCollection nvc = Request.Form;
        
        CRUD.cadastrarReceitas(nvc);
        Response.Write("<script>alert('Receita cadastrada com sucesso!');</script>");
    }

}