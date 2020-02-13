<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="edit_product.aspx.cs" Inherits="PartiesOrganization3.Admin.edit_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="centered" style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%);">
        <div class="container" style="height: 100%; align-content: center;">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 370px; margin-top: auto; margin-bottom: auto; width: 400px; background-color: rgba(0,0,0,0.5) !important;">
                    <div class="card-header" style="color: white;">
                        <h3 style="font-family: 'Srisakdi'; font-size: 3vw; color: white;">Edytuj produkt</h3>
                    </div>
                    <div class="card-body">
                        <form id="f1" runat="server" method="post" novalidate="novalidate">
                            <div class="form-group">
                                <asp:TextBox ID="name" runat="server" class="form-control" placeholder="Nazwa"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Podaj nazwę." Style="color: orange;" ControlToValidate="name" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="price" runat="server" class="form-control" placeholder="Cena (zł)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Podaj cenę." Style="color: orange;" ControlToValidate="price" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ControlToValidate="price" Style="color: orange;" ErrorMessage="Wprowadź liczbę." Display="Dynamic" />
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="weight" runat="server" class="form-control" placeholder="Waga (g)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Podaj wagę produktu." Style="color: orange;" ControlToValidate="weight" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="weight" Style="color: orange;" ErrorMessage="Wprowadź liczbę." Display="Dynamic" />
                            </div>
                            <div class="form-group">
                                <asp:Button ID="b2" runat="server" class="btn float-right login_btn justify-content-center links " Style="color: black; background-color: #FFC312; width: 100px;" Text="Zapisz" OnClick="b2_Click" />
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            <a href="products.aspx">Produkty</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
