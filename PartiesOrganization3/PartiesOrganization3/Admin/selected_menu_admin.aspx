<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="selected_menu_admin.aspx.cs" Inherits="PartiesOrganization3.Admin.selected_menu_admin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="col-lg-10" style="position: absolute; top: 50%; left: 57%; transform: translate(-50%, -50%); background-color: rgba(0,0,0,0.5) !important;">
        <label class="card-title" style="font-family: 'Srisakdi'; font-size: 3vw; color: white;"><b>Wybrane menu</b></label>
        <div class="card-body">
            <asp:Repeater ID="r1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered" id="example" style="background-color: rgba(0,0,0,0.5) !important;">
                        <thead style="font-size: 1.5vw; color: white">
                            <tr style="background-color: rgba(0,0,0,0.5) !important;">
                                <th scope="col">Numer posiłku</th>
                                <th scope="col">Danie</th>
                                <th scope="col">Usuń</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 1vw; color: white">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr style="background-color: rgba(0,0,0,0.5) !important;">
                        <td><%#Eval("meals_number") %></td>
                        <td><%#Eval("dishes_name") %></td>
                        <td><a href="delete_meal.aspx?id=<%#Eval("menu_id") %>" style="color: gold">Usuń danie</a></td>
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
