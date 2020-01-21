<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="selected_menu.aspx.cs" Inherits="PartiesOrganization3.Client.selected_menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <asp:DataList ID="d1" runat="server">
            <HeaderTemplate>
                <table  class="table table-bordered " style="position: absolute; top: 30vw; left: 55vw; width:70vw; transform: translate(-50%, -50%); background-color: rgba(0,0,0,0.5) !important;">
                    <thead style="font-size: 1.5vw; color: white">
                        <tr>
                            <th scope="col">Numer posiłku</th>
                            <th scope="col">Danie</th>
                            <th scope="col">Usuń</th>
                        </tr>
                    </thead>
                    <tbody style="font-size: 1vw; color: white">
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("meals_number") %></td>
                    <td><%#Eval("dishes_name") %></td>
                    <td><a href="delete_meal.aspx?id=<%#Eval("menu_id") %>" style="color:gold">Usuń danie</a></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:DataList>
</asp:Content>
