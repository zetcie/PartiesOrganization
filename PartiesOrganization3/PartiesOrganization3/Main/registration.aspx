<%@ Page Title="Rejestracja" Language="C#" MasterPageFile="~/Main/index.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="PartiesOrganization3.Main.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="centered" style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%);">
        <div class="container" style="height: 100%; align-content: center;">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 610px; margin-top: auto; margin-bottom: auto; width: 400px; background-color: rgba(0,0,0,0.5) !important;">
                    <div class="card-header" style="color: white;">
                        <h3 style="font-family: 'Srisakdi'; font-size: 2.5vw; color: white;">Zarejestruj się</h3>
                    </div>
                    <div class="card-body">
                        <form id="f1" runat="server" method="post" novalidate="novalidate">
                            <div class="form-group">
                                <asp:TextBox ID="firstname" runat="server" class="form-control" placeholder="Imię"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Podaj imię" Style="color: orange;" ControlToValidate="firstname" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="lastname" runat="server" class="form-control" placeholder="Nazwisko"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Podaj nazwisko" Style="color: orange;" ControlToValidate="lastname" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display="Dynamic" ErrorMessage="Zły email" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Podaj email" Style="color: orange;" ControlToValidate="email" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Hasło" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Podaj hasło" Style="color: orange;" ControlToValidate="password" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="submitpassword" runat="server" class="form-control" placeholder="Powtórz hasło" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Podaj hasło" Style="color: orange;" ControlToValidate="submitpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator id="Compare1" ControlToValidate="submitpassword" ControlToCompare="password" Style="color: orange;" ErrorMessage="Hasła nie są takie same" runat="server" Display="Dynamic"/>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="phonenumber" runat="server" class="form-control" placeholder="Numer telefonu"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Podaj numer telefonu" Style="color: orange;" ControlToValidate="phonenumber" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="phonenumber" Style="color: orange;" ErrorMessage="Zły numer" Display="Dynamic"/>
                            </div>
                            <div class="form-group">
                                <div class="alert alert-warning" id="error" runat="server" style="display: none" role="alert">
                                    Podany email jest już używny.
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="alert alert-warning" id="error2" runat="server" style="display: none" role="alert">
                                    Hasła nie są zgodne.
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="b1" runat="server" class="btn float-right login_btn justify-content-center links" Style="color: black; background-color: #FFC312; width: 100px;" Text="Zarejestruj" OnClick="b1_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
