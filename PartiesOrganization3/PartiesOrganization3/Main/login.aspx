<%@ Page Title="" Language="C#" MasterPageFile="~/Main/index.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PartiesOrganization3.Main.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="centered" style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%);">
        <div class="container" style="height: 100%; align-content: center;">
	        <div class="d-flex justify-content-center h-100">
		        <div class="card" style="height: 370px; margin-top: auto; margin-bottom: auto; width: 400px; background-color: rgba(0,0,0,0.5) !important;">
			        <div class="card-header" style="color: white;">
				        <h3 style="font-family: 'Srisakdi'; font-size: 3vw; color: white;">Zaloguj się</h3>
			        </div>
			        <div class="card-body">
				        <form id="f1" runat="server" method="post" novalidate="novalidate">
					        <div class="form-group" >
                                <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
					        </div>
					        <div class="form-group" >
                                <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Hasło" TextMode="Password"></asp:TextBox>
					        </div>
                            <div class="form-group" >
                                <div class="alert alert-warning" id="error" runat="server" style="display:none" role="alert">
                                   Zły email lub hasło
                                </div>
                            </div>
					        <div class="form-group">
                                <asp:Button ID="b2" runat="server" class="btn float-right login_btn justify-content-center links" style="color: black; background-color: #FFC312; width: 100px;" Text="Zaloguj" OnClick="b2_Click"/>
                            </div>
				        </form>
			        </div>
			        <div class="card-footer">
				        <div class="d-flex justify-content-center links"><a href="registration.aspx">Zarejestruj się</a>
				        </div>
			        </div>
		        </div>
	        </div>
        </div>
    </div>
</asp:Content>
