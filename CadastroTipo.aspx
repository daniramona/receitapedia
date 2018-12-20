<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="CadastroTipo.aspx.cs" Inherits="CadastroTipo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    Cadastro de tipos DE RECEITAS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    Digite o tipo de receita que deseja cadastrar. Exemplo: <b>doces finos, bolos, tortas, etc.</b>
    <form runat="server">
        <table style="width: 100%">
            <tr>
                <td style="width: 254px">
                    <asp:Label ID="Label1" runat="server" Text="Tipo de receita:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 254px">
                    <asp:TextBox ID="txtTipo" runat="server" Style="margin-left: 0px" Width="333px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="botao" OnClick="btnCadastrar_Click" Width="134px" />
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td style="width: 211px">
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>



