<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="PartiesOrganization3.Admin.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="col-lg-10" style="position: absolute; top: 50%; left: 57%; transform: translate(-50%, -50%); background-color: rgba(0,0,0,0.5) !important;">
        <label class="card-title" style="font-family: 'Srisakdi'; font-size: 3vw; color: white;"><b>Klienci</b></label>
        <div class="card-body">
            <asp:Repeater ID="r1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered" id="example" style="background-color: rgba(0,0,0,0.5) !important;">
                        <thead style="font-size: 1.5vw; color: white">
                            <tr style="background-color: rgba(0,0,0,0.5) !important;">
                                <th scope="col">Imię</th>
                                <th scope="col">Nazwisko</th>
                                <th scope="col">Email</th>
                                <th scope="col">Numer telefonu</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 1vw; color: white">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr style="background-color: rgba(0,0,0,0.5) !important;">
                        <td><%#Eval("firstname") %></td>
                        <td><%#Eval("lastname") %></td>
                        <td><%#Eval("email") %></td>
                        <td><%#Eval("phone") %></td>
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
