<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="CadastroIngredientes.aspx.cs" Inherits="CadastroIngredientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    CADASTRO DE INGREDIENTES
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <form runat="server">
    <table style="width: 100%">
        <tr>
            <td style="width: 240px">
                <asp:Label ID="Label1" runat="server" Text="Ingrediente:"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 240px">
                <asp:TextBox ID="txtIngrediente" runat="server" Width="315px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 240px">
                <asp:Button ID="btnCadastrar" runat="server" OnClick="btnCadastrar_Click" Text="Cadastrar" CssClass="botao" Width="138px" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>

