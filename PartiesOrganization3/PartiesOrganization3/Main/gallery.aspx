<%@ Page Title="" Language="C#" MasterPageFile="~/Main/index.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="PartiesOrganization3.Main.gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div class="centered" style="position: absolute; top: 23vw; left: 50%; transform: translate(-50%, -50%); width:100%;">
        <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                <li data-target="#carousel-example-1z" data-slide-to="2"></li>
                <li data-target="#carousel-example-1z" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="img/hall1.jpg" alt="Second slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="img/hall2.jpg" alt="Second slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="img/hall3.jpg" alt="Third slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="img/hall4.jpg" alt="4 slide" />
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</asp:Content>
