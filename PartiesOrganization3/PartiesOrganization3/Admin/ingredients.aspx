<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ingredients.aspx.cs" Inherits="PartiesOrganization3.Admin.ingredients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="col-lg-8" style="position: absolute; top: 28vw; left: 50%; transform: translate(-50%, -50%); background-color: rgba(0,0,0,0.5) !important;">
        <label class="card-title" style="font-family: 'Srisakdi'; font-size: 3vw; color: white;"><b>Składniki potrawy</b></label>
        <div class="card-body">
            <asp:Repeater ID="r1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered" id="example" style="background-color: rgba(0,0,0,0.5) !important;">
                        <thead style="font-size: 1.5vw; color: white">
                            <tr style="background-color: rgba(0,0,0,0.5) !important;">
                                <th scope="col">Potrawa</th>
                                <th scope="col">Produkt</th>
                                <th scope="col">Ilość (g)</th>
                                <th scope="col">Edytuj</th>
                                <th scope="col">Usuń</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 1vw; color: white">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr style="background-color: rgba(0,0,0,0.5) !important;">
                        <td><%#Eval("dishes_name") %></td>
                        <td><%#Eval("products_name") %></td>
                        <td><%#Eval("weight") %></td>
                        <td><a href="edit_ingredient.aspx?id=<%#Eval("ingredient_id") %>" style="color: gold">Edytuj ilość</a></td>
                        <td><a href="delete_ingredient.aspx?id=<%#Eval("ingredient_id") %>" style="color: gold">Usuń składnik</a></td>

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

