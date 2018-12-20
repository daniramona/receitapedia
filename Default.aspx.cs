using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            DataContext db = new DataContext(GetString());
            var Receitas = (
                    from r in db.GetTable<receitas>()
                    join tp in db.GetTable<tipoReceitas>() on r.tipo_receita equals tp.id
                    select new { r.id, r.receita, r.preparo, tp.tipoReceita }
                );

                

            Receitas.ToList();

            StringBuilder html = new StringBuilder();
            html.Append("<div>");
            foreach(var receita in Receitas)
            {
                var ingredientes = (
                from ir in db.GetTable<ingredientesReceitas>()
                join ing in db.GetTable<ingredientes>() on ir.id_ingrediente equals ing.id
                join um in db.GetTable<unidadesMedidas>() on ir.id_unidade equals um.id_unidade
                where ir.id_receita == receita.id
                select new {ing.ingrediente, ir.qtd, um.unidade}
                );

                ingredientes.ToList();


                html.Append("<b>Receita: ");
                
                html.Append(receita.receita);

                html.Append("<br /></b>");
                html.Append("<b>Categoria: </b>");
                html.Append(receita.tipoReceita);
                html.Append("<br />");
                html.Append("<br />");

                html.Append("<b>Ingredientes:</b> ");
                foreach (var ing in ingredientes)
                {
                    html.Append("<br />");
                    html.Append(ing.ingrediente);
                    html.Append(", Quantidade: ");
                    html.Append(ing.qtd);
                    html.Append(" ");
                    html.Append(ing.unidade);

                }

                html.Append("<br />");
                html.Append("<b>Modo de Preparo:</b> ");
                html.Append("<br />");
                html.Append(receita.preparo);

                html.Append("<br />");
                html.Append("<b>_________________________________________________________</b>");
                html.Append("<br />");
                html.Append("<br />");
            }
            html.Append("</div>");

            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
            
    }

    static public string GetString()
    {
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
        builder.DataSource = "DESKTOP-FHKCNSU\\SQLEXPRESS";
        builder.InitialCatalog = "ReceitaPedia";
        builder.IntegratedSecurity = true;

        return builder.ConnectionString;
    }
}