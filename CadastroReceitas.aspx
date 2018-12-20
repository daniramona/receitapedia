<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="CadastroReceitas.aspx.cs" Inherits="CadastroReceitas" %>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
    CADASTRO DE RECEITAS
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <form runat="server">
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Receita:"></asp:Label>
                <asp:TextBox ID="txtReceita" runat="server" CssClass="input" Width="353px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Categoria:"></asp:Label>
                 <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="tipoReceita" Select="new (id, tipoReceita)" TableName="tipoReceitas">
                </asp:LinqDataSource>
                 <asp:DropDownList ID="DropDownCategoria" runat="server" DataSourceID="LinqDataSource3" DataTextField="tipoReceita" DataValueField="id" Width="243px" CssClass="select">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" Text="Modo de Preparo:"></asp:Label>
                <br />
                <textarea name="txtPreparo" style="width: 190%" id="txtPreparo" cols="20" rows="5"></textarea>
            </td>
        </tr>
    </table>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <div style="display: inline-flex" id="ingrediente">
        <div style="width: 269px;">
            <asp:Label ID="Label3" runat="server" Text="Ingrediente"></asp:Label>
            <asp:DropDownList ID="DropDownIngrediente" runat="server" Width="237px" DataSourceID="LinqDataSource4" DataTextField="ingrediente" DataValueField="id" AppendDataBoundItems="True">
                <asp:ListItem Text="--Selecione--" Value="" /> 
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="ingrediente" Select="new (id, ingrediente)" TableName="ingredientes">
            </asp:LinqDataSource>
        </div>
        <div style="width: 124px">
                <asp:Label ID="Label4" runat="server" Text="Quantidade"></asp:Label>
                <asp:TextBox ID="txtQtd" runat="server" Width="85px" CssClass="input"></asp:TextBox>
        </div>
        <div style="width: 132px">
            <asp:Label ID="Label5" runat="server" Text="Medida"></asp:Label>
            <asp:DropDownList ID="DropDownUM" runat="server" Width="96px" DataSourceID="LinqDataSource5" DataTextField="unidade" DataValueField="id_unidade" AppendDataBoundItems="True">
                <asp:ListItem Text="--Selecione--" Value="" /> 
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource5" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="unidade" Select="new (id_unidade, unidade)" TableName="unidadesMedidas">
            </asp:LinqDataSource>
        </div>
        <div>
            <asp:Label ID="Label6" runat="server" Text="Ações" style="padding-bottom: 10px"></asp:Label>
            <a class="botao" onclick="javascript:RemoveTableRow(this)">Remover</a>
        </div>
    </div>

    <div id="conteudo">
    </div>
     
    <div class="hidden" id="hidden" style="padding-top: 10px">
        <div style="width: 269px">
            <asp:Label ID="Label7" runat="server" Text="Ingrediente"></asp:Label>
            <asp:DropDownList ID="DropDownIngredienteHidden" runat="server" Width="237px" DataSourceID="LinqDataSource4" DataTextField="ingrediente" DataValueField="id" AppendDataBoundItems="True">
                <asp:ListItem Text="--Selecione--" Value="" /> 
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" Select="new (id, ingrediente)" TableName="ingredientes" OrderBy="ingrediente">
            </asp:LinqDataSource>
        </div>
        <div style="width: 124px">
            <asp:Label ID="Label8" runat="server" Text="Quantidade"></asp:Label>
            <asp:TextBox ID="txtQtdHidden" runat="server" Width="85px" CssClass="input"></asp:TextBox>
        </div>
        <div style="width: 132px">
            <asp:Label ID="Label9" runat="server" Text="Medida"></asp:Label>
            <asp:DropDownList ID="DropDownUMHidden" runat="server" Width="96px" DataSourceID="LinqDataSource5" DataTextField="unidade" DataValueField="id_unidade" AppendDataBoundItems="True">
                <asp:ListItem Text="--Selecione--" Value="" /> 
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" Select="new (id_unidade, unidade)" TableName="unidadesMedidas" OrderBy="unidade">
            </asp:LinqDataSource>
        </div>
        <div>
            <asp:Label ID="Label10" runat="server" Text="Ações" style="padding-bottom: 10px"></asp:Label>
            <a class="botao" onclick="javascript:RemoveTableRow(this)">Remover</a>
        </div>
    </div>
    <asp:Button type="submit" runat="server" Text="Gravar" CssClass="botao" Width="130px" OnClick="btnCriarReceita_Click" />
    </form>
    <br />
<button ID="btnAddLinha" type="button" onClick="javascript:AddTableRow(this)" class="botao">Adicionar Ingrediente</button>
</asp:Content>






