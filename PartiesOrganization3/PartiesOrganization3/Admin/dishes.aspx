<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="dishes.aspx.cs" Inherits="PartiesOrganization3.Admin.dishes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="col-lg-10" style="position: absolute; top: 50%; left: 57%; transform: translate(-50%, -50%); background-color: rgba(0,0,0,0.5) !important;">
        <label class="card-title" style="font-family: 'Srisakdi'; font-size: 3vw; color: white;"><b>Potrawy</b></label>
        <div class="card-body">
            <asp:Repeater ID="r1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered" id="example" style="background-color: rgba(0,0,0,0.5) !important;">
                        <thead style="font-size: 1vw; color: white">
                            <tr style="background-color: rgba(0,0,0,0.5) !important;">
                                <th scope="col">Nazwa</th>
                                <th scope="col">Opis</th>
                                <th scope="col">Wegańskie</th>
                                <th scope="col">Wegetariańskie</th>
                                <th scope="col">Składniki</th>
                                <th scope="col">Edycja</th>
                                <th scope="col">Usuń</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 0.9vw; color: white">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr style="background-color: rgba(0,0,0,0.5) !important;">
                        <td><%#Eval("dishes_name") %></td>
                        <td><%#Eval("description") %></td>
                        <td><%#Eval("vegan") %></td>
                        <td><%#Eval("vegtarian") %></td>
                        <td><a href="ingredients.aspx?id=<%#Eval("dish_id") %>" style="color: gold">Składniki</a></td>
                        <td><a href="edit_dish.aspx?id=<%#Eval("dish_id") %>" style="color: gold">Edytuj potrawę</a></td>
                        <td><a href="delete_dish.aspx?id=<%#Eval("dish_id") %>" style="color: gold">Usuń potrawę</a></td>
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

