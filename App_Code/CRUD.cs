using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Collections.Specialized;
using System.Web.Security;

/// <summary>
/// Descrição resumida de CRUD
/// </summary>
public class CRUD
{
    public CRUD()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }

    static public string GetString()
    {
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
        builder.DataSource = "DESKTOP-FHKCNSU\\SQLEXPRESS";
        builder.InitialCatalog = "ReceitaPedia";
        builder.IntegratedSecurity = true;

        return builder.ConnectionString;
    }

    public static void cadastrarUsuario(String Nome, String Cpf,
        String Email, String Senha, int Nivel)
    {
        try
        {
            DataContext db = new DataContext(GetString());
            Table<pessoa> pessoa = db.GetTable<pessoa>();

            pessoa p = new pessoa();

            p.nome = Nome;
            p.cpf = Cpf;
            p.email = Email;
            p.senha = Senha;
            p.nivel = Nivel;

            pessoa.InsertOnSubmit(p);
            pessoa.Context.SubmitChanges();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void cadastrarTipoReceita(String Tipo)
    {
        try
        {
            DataContext db = new DataContext(GetString());
            Table<tipoReceitas> tipoReceitas = db.GetTable<tipoReceitas>();

            tipoReceitas tr = new tipoReceitas();

            tr.tipoReceita = Tipo;

            tipoReceitas.InsertOnSubmit(tr);
            tipoReceitas.Context.SubmitChanges();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void cadastrarUM(String Unidade)
    {
        try
        {
            DataContext db = new DataContext(GetString());
            Table<unidadesMedidas> unidadesMedidas = db.GetTable<unidadesMedidas>();

            unidadesMedidas um = new unidadesMedidas();

            um.unidade = Unidade;

            unidadesMedidas.InsertOnSubmit(um);
            unidadesMedidas.Context.SubmitChanges();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

   public static void cadastrarIngredientes(String Ingrediente)
    {
        try
        {
            DataContext db = new DataContext(GetString());
            Table<ingredientes> ingredientes = db.GetTable<ingredientes>();

            ingredientes i = new ingredientes();

            i.ingrediente = Ingrediente;
            ingredientes.InsertOnSubmit(i);
            ingredientes.Context.SubmitChanges();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void cadastrarReceitas(NameValueCollection formReceitas)
    {
        try
        {
            DataContext db = new DataContext(GetString());
            Table<receitas> receitas = db.GetTable<receitas>();

            receitas r = new receitas();

            foreach (string key in formReceitas)
            {
                if (key.Contains("txtReceita"))
                {
                    r.receita = formReceitas[key];
                }
                else if (key.Contains("DropDownCategoria"))
                {
                    r.tipo_receita = Convert.ToInt32(formReceitas[key]);
                }
                else if (key.Contains("txtPreparo"))
                {
                    r.preparo = formReceitas[key];
                }
                else if (key.Contains("DropDownIngredienteHidden"))
                {
                    System.Diagnostics.Debug.WriteLine(formReceitas[key]);
                }
                r.pessoa = 1;
                r.data_postagem = Convert.ToDateTime(DateTime.Now.ToString());
            }


            receitas.InsertOnSubmit(r);
            receitas.Context.SubmitChanges();
            int id = r.id;

            Table<ingredientesReceitas> ingredientesReceitas = db.GetTable<ingredientesReceitas>();

            ingredientesReceitas newIr = new ingredientesReceitas();
            ingredientesReceitas ir = new ingredientesReceitas();
            newIr.id_receita = id;
            ir.id_receita = id;

            string lastId = "";
            int numero;
            int numeroAntigo = 0;
            int number;
            foreach (string key in formReceitas)
             {
                lastId = key.Substring(key.Length - 1, 1);

                bool result = Int32.TryParse(lastId, out number);
                if (result == true)
                {
                    numero = Convert.ToInt32(lastId);
                    if (numeroAntigo == 0)
                    {
                        numeroAntigo = numero;
                    }
                    if (numero == numeroAntigo)
                    {
                        System.Diagnostics.Debug.WriteLine("numero == numeroAntigo!");

                        if (key.Contains("DropDownIngrediente"))
                        {
                            newIr.id_ingrediente = Convert.ToInt32(formReceitas[key]);
                        }
                        else if (key.Contains("txtQtd"))
                        {
                            newIr.qtd = Convert.ToInt32(formReceitas[key]);
                        }
                        else if (key.Contains("DropDownUM"))
                        {
                            newIr.id_unidade = Convert.ToInt32(formReceitas[key]);
                        }
                    } else
                    {
                        ingredientesReceitas.InsertOnSubmit(newIr);
                        ingredientesReceitas.Context.SubmitChanges();

                        newIr = new ingredientesReceitas();
                        newIr.id_receita = id;


                        if (key.Contains("DropDownIngrediente"))
                        {
                            newIr.id_ingrediente = Convert.ToInt32(formReceitas[key]);
                        }
                        else if (key.Contains("txtQtd"))
                        {
                            newIr.qtd = Convert.ToInt32(formReceitas[key]);
                        }
                        else if (key.Contains("DropDownUM"))
                        {
                            newIr.id_unidade = Convert.ToInt32(formReceitas[key]);
                        }
                    }
                    numeroAntigo = numero;
                } else
                {
                    if (key.Contains("DropDownIngrediente") && !key.Contains("Hidden"))
                    {
                        ir.id_ingrediente = Convert.ToInt32(formReceitas[key]);
                    }
                    else if (key.Contains("txtQtd") && !key.Contains("Hidden"))
                    {
                        ir.qtd = Convert.ToInt32(formReceitas[key]);
                    }
                    else if (key.Contains("DropDownUM") && !key.Contains("Hidden"))
                    {
                        ir.id_unidade = Convert.ToInt32(formReceitas[key]);
                    }
                }
             }

            if (newIr.id_unidade != 0)
            {
                ingredientesReceitas.InsertOnSubmit(newIr);
                ingredientesReceitas.Context.SubmitChanges();
            }
            
            ingredientesReceitas.InsertOnSubmit(ir);
            ingredientesReceitas.Context.SubmitChanges();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



}