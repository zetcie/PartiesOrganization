<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="edit_costs.aspx.cs" Inherits="PartiesOrganization3.Admin.edit_costs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="centered" style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%);">
        <div class="container" style="height: 100%; align-content: center;">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 27vw; margin-top: auto; margin-bottom: auto; width: 400px; background-color: rgba(0,0,0,0.5) !important;">
                    <div class="card-header" style="color: white;">
                        <h3 style="font-family: 'Srisakdi'; font-size: 3vw; color: white;">Edytuj koszt</h3>
                    </div>
                    <div class="card-body">
                        <form id="f1" runat="server" method="post" novalidate="novalidate">
                            <div class="form-group">
                                <label class="control-label mb-1">Wybierz ilość posiłków</label>
                                <asp:DropDownList class="form-control" ID="cost" DataTextField="numer_of_meals" DataValueField="cost_ID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="itemSelected"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label mb-1">Wprowadź cenę za 1 osobę</label>
                                <asp:TextBox ID="price" runat="server" class="form-control" placeholder="Cena (zł)"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Currency" ControlToValidate="price" Style="color: orange;" ErrorMessage="Wprowadź liczbę." Display="Dynamic" />
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
    </div>
</asp:Content>
