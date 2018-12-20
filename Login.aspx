<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <form runat="server" id="formLogin">
    <table style="width: 100%">
        <tr>
            <td style="width: 301px">
                <asp:Label ID="Label1" runat="server" Text="E-mail:"></asp:Label>
            </td>
        </tr>

        <tr>
            <td style="width: 301px">
                <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td style="width: 301px">
                <asp:Label ID="Label2" runat="server" Text="Senha:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 301px">
                <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CheckBox id="chkLembrarSenha" text="Lembrar Senha" runat="server" style="padding-top: 25px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        
        <tr>
            <td style="width: 301px; height: 42px;">
                <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="botao" OnClick="OnLogin" Width="112px" />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CadastroUsuario.aspx">Faça seu cadastro!</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="width: 301px; height: 24px;">
                <br /><br />
            </td>
        </tr>
    </table>
</form>
</asp:Content>


