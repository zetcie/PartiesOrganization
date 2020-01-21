<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="reservations.aspx.cs" Inherits="PartiesOrganization3.Admin.reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="col-lg-10" style="position: absolute; top: 50%; left: 57%; transform: translate(-50%, -50%); background-color: rgba(0,0,0,0.5) !important;">
        <label class="card-title" style="font-family: 'Srisakdi'; font-size: 3vw; color: white;"><b>Rezerwacje</b></label>
        <div class="card-body">
            <asp:Repeater ID="r1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered" id="example" style="background-color: rgba(0,0,0,0.5) !important;">
                        <thead style="font-size: 1.5vw; color: white">
                            <tr style="background-color: rgba(0,0,0,0.5) !important;">
                                <th scope="col">Data</th>
                                <th scope="col">Ilość gości</th>
                                <th scope="col">Sala</th>
                                <th scope="col">Klient</th>
                                <th scope="col">Koszt całkowity </th>
                                <th scope="col">Menu</th>
                                <th scope="col">Usuń rezerwację</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 1vw; color: white">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr style="background-color: rgba(0,0,0,0.5) !important;">
                        <td><%#Eval("date_of_party") %></td>
                        <td><%#Eval("places") %></td>
                        <td><%#Eval("name") %></td>
                        <td><%#Eval("firstname") %>  <%#Eval("lastname") %></td>
                        <td><%#Eval("final_costs") %> zł</td>
                        <td><a href="selected_menu_admin.aspx?id=<%#Eval("booking_id") %>" style="color: gold">Podgląd</a></td>
                        <td><a href="delete_reservation_admin.aspx?id=<%#Eval("booking_id") %>" style="color: gold">-</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
        </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#example').DataTable({
                "pagingType": "full_numbers"
            });
        });
    </script>
</asp:Content>
