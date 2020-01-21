<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="PartiesOrganization3.Admin.products1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="col-lg-8" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: rgba(0,0,0,0.5) !important;">
        <label class="card-title" style="font-family: 'Srisakdi'; font-size: 3vw; color: white;"><b>Produkty</b></label>
        <div class="card-body">
            <asp:Repeater ID="r1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered" id="example" style="background-color: rgba(0,0,0,0.5) !important;">
                        <thead style="font-size: 1.5vw; color: white">
                            <tr style="background-color: rgba(0,0,0,0.5) !important;">
                                <th scope="col">Nazwa</th>
                                <th scope="col">Cena</th>
                                <th scope="col">Waga</th>
                                <th scope="col">Edycja</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 1vw; color: white">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr style="background-color: rgba(0,0,0,0.5) !important;">
                        <td><%#Eval("products_name") %></td>
                        <td><%#Eval("price") %> zł</td>
                        <td><%#Eval("PRODUCTS_WEIGHT") %> g/szt</td>
                        <td><a href="edit_product.aspx?id=<%#Eval("product_id") %>" style="color: gold">Edytuj produkt</a></td>
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

