<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ChildPage.aspx.cs" Inherits="ChildPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Login</h2>
			</div>
		</div>
	</div>
	</section>
    <br />
    <br />
    <br />

    <div class="container">
         <div class="col-md-12" style="margin-bottom: 75px; margin-top: -45px;">
                        <div class="col-md-2">
                            <asp:Button ID="btnAdd" CssClass="btn btn-default" runat="server" Text="Add Child" OnClick="btnAdd_Click"  />
                        </div>
                        <div class="col-md-offset-3 col-md-4">
                            <asp:TextBox ID="txtSearch" CssClass="form-control" placeholder="Search.." runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnSearch" CssClass="btn btn-default" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>
         <div style="margin-left: 3%;">
             <asp:Panel ID="Panel1" runat="server">
                 <asp:GridView ID="GridView1" runat="server" class="table table-striped" style="width: 85%" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
                     <Columns>
                         <asp:BoundField DataField="CID" HeaderText="CID"> </asp:BoundField>
                         <asp:BoundField DataField="FirstName" HeaderText="FirstName"></asp:BoundField>
                         <asp:BoundField DataField="LastName" HeaderText="LastName"></asp:BoundField>
                         <asp:BoundField DataField="DOB" HeaderText="DOB"></asp:BoundField>
                         <asp:BoundField DataField="Gender" HeaderText="Gender"></asp:BoundField>
                         <asp:BoundField DataField="Class" HeaderText="Class"></asp:BoundField>
                         
                         <asp:TemplateField HeaderText="Photo">
                             <ItemTemplate>
                                 <asp:Image ID="Image1" runat="server" Height="104px" Width="118px" 
                                     ImageUrl='<%#"~/ChildImages/"+Eval("Photo") %>'

                                     />
                             </ItemTemplate>
                         </asp:TemplateField>
                         
                         
                         <asp:TemplateField HeaderText="EDIT">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImgBtnSelect" ToolTip="EDIT" ImageUrl="~/Images/images.jpg" CommandArgument='<%# Eval("CID") %>' runat="server" OnClick="ImgBtnSelect_Click"  />
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="DELETE">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImgBtnDelete" ToolTip="DELETE" ImageUrl="~/Images/cancel-icon.png" CommandArgument='<%# Eval("CID") %>' runat="server" OnClick="ImgBtnDelete_Click" />
                             </ItemTemplate>
                         </asp:TemplateField>
                         
                         
                     </Columns>
                 </asp:GridView>
             </asp:Panel>
             <asp:Panel ID="Panel2" runat="server">
                 
            <div class="col-md-12">
                    <h4>
                        <asp:Label ID="lblAddChild" runat="server" Text="Add Child"></asp:Label>
                    </h4>
                    <div class="col-md-12">
                        <div class="col-md-2">
                            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                        </div>
                        <div class="col-md-7">
                            <asp:TextBox ID="txtFirstName" placeholder="Enter First Name" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" ControlToValidate="txtFirstName" ForeColor="Red" ValidationGroup="a" runat="server" ErrorMessage="First Name Required"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                <div class="col-md-12">
                        <div class="col-md-2">
                            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                        </div>
                        <div class="col-md-7">
                            <asp:TextBox ID="txtLastName" placeholder="Last Name" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" ControlToValidate="txtLastName" ForeColor="Red" ValidationGroup="a" runat="server" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>
                        </div>
                   </div>
                 <div class="col-md-12">
                        <div class="col-md-2">
                            <asp:Label ID="lblDOB" runat="server" Text="Date Of Birth"></asp:Label>
                        </div>
                        <div class="col-md-7">
                            <asp:TextBox ID="txtDOB" placeholder="Date of Birth" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" ControlToValidate="txtDOB" ForeColor="Red" ValidationGroup="a" runat="server" ErrorMessage="Date of Birth Required"></asp:RequiredFieldValidator>
                        </div>
                   </div>
                  <div class="col-md-12">
                        <div class="col-md-2">
                            <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                        </div>
                        <div class="col-md-7">
                          <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server">
                              <asp:ListItem>Male</asp:ListItem>
                              <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" ControlToValidate="ddlGender" InitialValue="0" ValidationGroup="a" ForeColor="Red" runat="server" ErrorMessage="Date of Birth Required"></asp:RequiredFieldValidator>
                        </div>
                   </div>
                  <div class="col-md-12">
                        <div class="col-md-2">
                            <asp:Label ID="lblClass" runat="server" Text="Class"></asp:Label>
                        </div>
                        <div class="col-md-7">
                          <asp:DropDownList ID="ddlClass" CssClass="form-control" runat="server">
                              <asp:ListItem>LKG</asp:ListItem>
                              <asp:ListItem>UKG</asp:ListItem>
                              <asp:ListItem>One</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorClass" ControlToValidate="ddlClass" InitialValue="0" ValidationGroup="a" ForeColor="Red" runat="server" ErrorMessage="Date of Birth Required"></asp:RequiredFieldValidator>
                        </div>
                   </div>

                   <div class="col-md-12">
                        <div class="col-md-2">
                            <asp:Label ID="lblImage" runat="server" Text="Image"></asp:Label>
                        </div>
                        <div class="col-md-7">
                            <asp:FileUpload ID="FileUploadImage" CssClass="form-control" runat="server" />
                            <asp:Label ID="lblImageName" runat="server" Text=""></asp:Label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorImage" runat="server" ControlToValidate="fileuploadImage" ValidationGroup="a" ForeColor="Red" ErrorMessage="Only .jpg,.png,.jpeg,.gif Files are allowed" Font-Bold="True" Font-Size="Medium" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <asp:Label ID="ltlMsg" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-12">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-1">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success" ValidationGroup="a" runat="server" Text="Save" OnClick="btnSubmit_Click" />
                        </div>
                        
                    </div>
                </div>
             </asp:Panel>
         </div>

    </div>



</asp:Content>

