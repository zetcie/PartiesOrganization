<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="clients_reservations.aspx.cs" Inherits="PartiesOrganization3.Client.clients_reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <asp:DataList ID="d1" runat="server">
        <HeaderTemplate>
            <table class="table table-bordered " style="position: absolute; top: 30%; left: 55vw; width: 70vw; transform: translate(-50%, -50%); background-color: rgba(0,0,0,0.5) !important;">
                <thead style="font-size: 1.5vw; color: white">
                    <tr>
                        <th scope="col">Data przyjęcia</th>
                        <th scope="col">Ilość miejsc</th>
                        <th scope="col">Sala</th>
                        <th scope="col">Koszt całkowity </th>
                        <th scope="col">Menu</th>
                        <th scope="col">Dodaj danie</th>
                        <th scope="col">Usuń rezerwację</th>
                    </tr>
                </thead>
                <tbody style="font-size: 1vw; color: white">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%#Eval("date_of_party") %></td>
                <td><%#Eval("places") %></td>
                <td><%#Eval("name") %></td>
                <td><%#Eval("final_costs") %> zł</td>
                <td><a href="selected_menu.aspx?id=<%#Eval("booking_id") %>" style="color: gold">Podgląd</a></td>
                <td><a href="add_new_dish.aspx?id=<%#Eval("booking_id") %>" style="color: gold">+</a></td>
                <td><a href="delete_reservation.aspx?id=<%#Eval("booking_id") %>" style="color: gold">Usuń rezerwację</a></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
                </table>
        </FooterTemplate>
    </asp:DataList>
</asp:Content>
