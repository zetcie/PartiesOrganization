<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="add_new_dish.aspx.cs" Inherits="PartiesOrganization3.Client.add_new_dish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="centered" style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%);">
        <div class="container" style="height: 100%; align-content: center;">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 450px; margin-top: auto; margin-bottom: auto; width: 400px; background-color: rgba(0,0,0,0.5) !important;">
                    <div class="card-header" style="color: white;">
                        <h3 style="font-family: 'Srisakdi'; font-size: 3vw; color:white;">Dodaj danie</h3>
                    </div>
                    <div class="card-body">
                        <form id="f1" runat="server" method="post" novalidate="novalidate">
                            <div class="form-group">
                                <label  class="control-label mb-1">Numer posiłku</label>
                                <asp:DropDownList class="form-control" ID="meals_number" runat="server" DataTextField="kupa">
                                    <asp:ListItem Selected="True" Value="1"> 1 </asp:ListItem>
                                    <asp:ListItem Value="2"> 2 </asp:ListItem>
                                    <asp:ListItem Value="3"> 3 </asp:ListItem>
                                    <asp:ListItem Value="4"> 4 </asp:ListItem>
                                    <asp:ListItem Value="5"> 5 </asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">Potrawa</label>
                                <asp:DropDownList class="form-control" ID="dish" DataTextField="DISHES_NAME" DataValueField="dish_ID" runat="server" OnSelectedIndexChanged="Selection_Change" AutoPostBack="True"> </asp:DropDownList>
                                <asp:Label id="description" runat="server"></asp:Label>
                            </div>
                            
                            <div class="form-group">
                                <asp:Button ID="b2" runat="server" class="btn float-right login_btn justify-content-center links " Style="color: black; background-color: #FFC312; width: 100px;" Text="Dodaj" OnClick="b2_Click" />
                            </div>
                        </form>
                    </div>
                    <div class="card-footer" style="font-size:0.5vw">
                        <div class="d-flex justify-content-center">
                            <label>*Cena przyjęcia zależy od ilości posiłków, a nie od ilości potraw. 
                                <br />
                                *Dania serwowane są na półmiskach - jeden półmisek na maksimum 5 osób.</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
