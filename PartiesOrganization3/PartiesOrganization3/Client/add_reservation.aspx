<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="add_reservation.aspx.cs" Inherits="PartiesOrganization3.Client.add_reservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="centered" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <div class="container" style="height: 100%; align-content: center;">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 43vw; margin-top: auto; margin-bottom: auto; width: 400px; background-color: rgba(0,0,0,0.5) !important;">
                    <div class="card-header" style="color: white;">
                        <h3 style="font-family: 'Srisakdi'; font-size: 3vw; color: white;">Dodaj rezerwację</h3>
                    </div>
                    <div class="card-body">
                        <form id="f1" runat="server" method="post" novalidate="novalidate">
                            <div class="form-group">
                                <asp:DropDownList class="form-control" ID="hall" DataTextField="NAME" DataValueField="hall_ID" runat="server" OnSelectedIndexChanged="Selection_Change" AutoPostBack="True"></asp:DropDownList>
                                <br />
                                <asp:Label ID="max_places" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="size" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="places" placeholder="Ilość miejsc" runat="server"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Podaj ilość miejsc." Style="color: orange;" ControlToValidate="places" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="places" Style="color: orange;" ErrorMessage="Wprowadź liczbę." Display="Dynamic" />
                                <asp:RangeValidator ID="RangeValidator1" runat="server" Style="color:orange" ErrorMessage="Ta sala nie zmieści tylu gości." ControlToValidate="places" MinimumValue="0" MaximumValue="500" Type="Integer" Display="Dynamic"></asp:RangeValidator> 
                                <asp:RangeValidator ID="RangeValidator2" runat="server" Style="color:orange" ErrorMessage="Ta sala nie zmieści tylu gości." ControlToValidate="places" MinimumValue="0" MaximumValue="500" Type="Integer" Display="Dynamic"></asp:RangeValidator> 
                            </div>
                            <div class="form-group">
                                <asp:Calendar ID="date_of_party" OnDayRender="Calendar1DayRender" runat="server" ></asp:Calendar>
                                <br />
                                <b><span style="color: Red">Czerwony </span></b><span>- Termin zajęty </span>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="b2" runat="server" class="btn float-right login_btn justify-content-center links " Style="color: black; background-color: #FFC312; width: 100px;" Text="Dodaj" OnClick="b2_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
