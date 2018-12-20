using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CadastroUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Cadastrar_Click(object sender, EventArgs e)
    {
        CRUD.cadastrarUsuario(txtNome.Text, txtCPF.Text, txtEmail.Text,
                              txtSenha.Text, Convert.ToInt32(txtNivel.Text));
        //TabelaProdutos.DataBind();
        Response.Write("<script>alert('Usuário cadastrado com sucesso!');</script>");

        //prod.valor = decimal.Parse(Valor.ToString());
        //Convert.ToDateTime(txtData.Text)

    }
}