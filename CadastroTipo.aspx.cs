using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CadastroTipo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        CRUD.cadastrarTipoReceita(txtTipo.Text);
        Response.Write("<script>alert('Tipo de receita cadastrado com sucesso!');</script>");
    }
}