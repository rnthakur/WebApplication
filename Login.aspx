<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
            width: 152px;
        }
        .auto-style2 {
            width: 152px;
        }
        .auto-style4 {
            width: 369px;
        }
        .auto-style5 {
            text-align: center;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 

    <br />
   <section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Login</h2>
			</div>
		</div>
	</div>
	</section>
	<section id="content">

        <div class="container">
		<div class="row">

    <div>  
    <table align="center" class="auto-style4"  >
        <tr>
            <td class="auto-style1">First Name:</td>
            <td class="text-left">
                <asp:TextBox ID="txtUsername" runat="server" class="form-control"></asp:TextBox><br />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name:</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" class="form-control"></asp:TextBox><br />
            </td>
        </tr>
        
        <tr>
            <td class="auto-style5" colspan="2">
                <asp:Button ID="btnLogin" runat="server" class="btn btn-primary waves-effect waves-dark pull-center" Text="Login" OnClick="btnLogin_Click" /><br />
              
            </td>
        </tr>
        
        <tr>
            <td class="text-center" colspan="2">
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
        
        </table>
        </div>
            </div>
            </div>
     <br /><br />

</asp:Content>

