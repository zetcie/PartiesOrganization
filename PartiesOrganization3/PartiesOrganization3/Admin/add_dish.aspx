<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="add_dish.aspx.cs" Inherits="PartiesOrganization3.Admin.add_dish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="centered" style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%);">
        <div class="container" style="height: 100%; align-content: center;">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 400px; margin-top: auto; margin-bottom: auto; width: 400px; background-color: rgba(0,0,0,0.5) !important;">
                    <div class="card-header" style="color: white;">
                        <h3 style="font-family: 'Srisakdi'; font-size: 3vw; color: white;">Dodaj potrawę</h3>
                    </div>
                    <div class="card-body">
                        <form id="f1" runat="server" method="post" novalidate="novalidate">
                            <div class="form-group">
                                <asp:TextBox ID="name" runat="server" class="form-control" placeholder="Nazwa"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Podaj nazwę." Style="color: orange;" ControlToValidate="name" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="description" runat="server" class="form-control" placeholder="Opis"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:RadioButton ID="vegan" Text="Wegańska" Checked="False" GroupName="RadioGroup1" runat="server" />
                                <asp:RadioButton ID="vegetarian" Text="Wegetariańska" Checked="False" GroupName="RadioGroup1" runat="server" />
                                <asp:RadioButton ID="meat" Text="Mięsna" Checked="True" GroupName="RadioGroup1" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:Button ID="b2" runat="server" class="btn float-right login_btn justify-content-center links " Style="color: black; background-color: #FFC312; width: 100px;" Text="Dodaj" OnClick="b2_Click" />
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            <a href="dishes.aspx">Potrawy</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
