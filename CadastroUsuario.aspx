<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="CadastroUsuario.aspx.cs" Inherits="CadastroUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    CADASTRE-SE
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <form runat="server">
    <table style="width: 100%">
        <tr>
            <td style="width: 222px">
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" Select="new (nome, cpf, email, senha, nivel)" TableName="pessoa">
                </asp:LinqDataSource>
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <asp:Label ID="Label3" runat="server" Text="Nome Completo:"></asp:Label>
            </td>
             
        </tr>
                <tr>
            <td style="width: 222px">
                <asp:TextBox ID="txtNome" runat="server" CssClass="input" Width="294px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Campo obrigatório!" Font-Bold="True" ForeColor="#ED488C"></asp:RequiredFieldValidator>
            </td>
        <tr>
            <td style="width: 222px">
                <asp:Label ID="Label4" runat="server" Text="CPF:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 222px">
                <asp:TextBox ID="txtCPF" runat="server" Width="292px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCPF" runat="server" ControlToValidate="txtCPF" ErrorMessage="Campo obrigatório" Font-Bold="True" ForeColor="#ED488C"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 222px">
                <asp:Label ID="Label5" runat="server" Text="E-mail:"></asp:Label>
            </td>
            <tr>
            <td style="width: 222px">
                <asp:TextBox ID="txtEmail" runat="server" Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo obrigatório!" Font-Bold="True" ForeColor="#ED488C"></asp:RequiredFieldValidator>
            </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="#E8488C" Text="Será o seu login de acesso!" Font-Size="Small"></asp:Label>
                </td>
        </tr>
        <tr>
            <td style="width: 222px; height: 16px;">
                <asp:Label ID="Label6" runat="server" Text="Senha:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 222px">
                <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="288px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSenha" runat="server" ControlToValidate="txtSenha" ErrorMessage="Campo obrigatório!" Font-Bold="True" ForeColor="#ED488C"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 222px">
                <asp:Label ID="Label7" runat="server" Text="Nível de conhecimento:"></asp:Label>
            </td>
        </tr>
        <tr><td style="width: 222px">
                <asp:DropDownList ID="txtNivel" runat="server" CssClass="select" Width="286px">
                    <asp:ListItem Value="1">Iniciante</asp:ListItem>
                    <asp:ListItem Value="2">Intermediário</asp:ListItem>
                    <asp:ListItem Value="3">Avançado</asp:ListItem>
                    <asp:ListItem Value="4">Profissional</asp:ListItem>
                </asp:DropDownList>
            </td></tr>
        <tr>
            <td style="width: 222px">
                <asp:Button ID="Cadastrar" runat="server" Text="Cadastrar" OnClick="Cadastrar_Click" CssClass="botao" Width="142px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>


