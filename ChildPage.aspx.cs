﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChildPage : System.Web.UI.Page
{
    ChildClass cc = new ChildClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        if (!Page.IsPostBack)
        {
          
            LoadData();
        }
       
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        
        try
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            ltlMsg.Text = string.Empty;
            lblAddChild.Text = "Add Child";
            btnSubmit.Text = "Save";
            ClearFields();
            //LoadCategory();
            //MultiView1.ActiveViewIndex = 1;
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert(" + ex.Message + ");window.location.replace('ChildPage.aspx');", true);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            Panel1.Visible = true;
            DataTable dt = cc.GetChildByName(txtSearch.Text);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert(" + ex.Message + ");window.location.replace('ChildPage.aspx');", true);
        }
    }

    private void ClearFields()
    {

        txtFirstName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        txtDOB.Text = string.Empty;
        ddlGender.SelectedIndex = 0;
        ddlClass.SelectedIndex = 0;


    }
    private void LoadData()
    {
        DataTable dt1 = cc.ViewChild(); ;
        if (dt1.Rows.Count != 0)
        {
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
           //if (txtFirstName.Text != null && txtFirstName.Text != null && txtDOB.Text != null && ddlGender.SelectedIndex != 0 && ddlClass.SelectedIndex != 0)
           // {
                if (FileUploadImage.HasFile)
                {
                    string ext = System.IO.Path.GetExtension(this.FileUploadImage.PostedFile.FileName).ToLower();
                    if (!(ext.Equals(".jpg") || ext.Equals(".png") || ext.Equals(".gif") || ext.Equals(".jpeg")))
                    {
                        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Please choose only .jpg, .png and .gif image types!')", true);
                        return;
                    }
                }
                if (btnSubmit.Text != "Update")
                {
                    if (string.IsNullOrEmpty(this.FileUploadImage.PostedFile.FileName))
                    {
                        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Please upload image')", true);
                        return;
                    }
                    //DataTable dt = _bllMenu.CheckFoodNameInDatabase(txtFoodname.Text);
                    //if (dt.Rows.Count != 0)
                    //{
                    //    ltlMsg.ForeColor = Color.Red;
                    //    ltlMsg.Text = "The Food Name with same name already exists.";
                    //}
                    else
                    {
                        string imageExtension = System.IO.Path.GetExtension(FileUploadImage.FileName).ToLower();
                        cc.SaveChild(txtFirstName.Text, txtLastName.Text, txtDOB.Text, ddlGender.Text, ddlClass.Text, txtFirstName.Text.Replace(" ", ".") + imageExtension);
                        string s = Server.MapPath("~/ChildImages/");
                        FileUploadImage.SaveAs(Path.Combine(s, txtFirstName.Text.Replace(" ", ".") + imageExtension));
                        ltlMsg.ForeColor = Color.Green;
                        ltlMsg.Text = "Child Successfully Added.";
                        ClearFields();
                    Panel2.Visible = false;
                    Panel1.Visible = true;
                        LoadData();

                    }

                }
            //}
            else
            {
                string oldImageName = lblImageName.Text;
                string imageName = lblImageName.Text;

                if (FileUploadImage.HasFile)
                {
                    var name = txtFirstName.Text.Replace(" ", ".");
                    string imageExtension = System.IO.Path.GetExtension(FileUploadImage.FileName).ToLower();
                    imageName = name + imageExtension;
                    int value = Convert.ToInt16(HiddenField1.Value);
                    cc.UpdateChild(value, txtFirstName.Text, txtLastName.Text, txtDOB.Text, ddlGender.Text, ddlClass.Text, txtFirstName.Text.Replace(" ", ".") + imageExtension);
                    string s = Server.MapPath("~/ChildImages/");
                    if (File.Exists(Path.Combine(s, oldImageName)))
                    {
                        File.Delete(Path.Combine(s, oldImageName));
                    }
                    FileUploadImage.SaveAs(Path.Combine(s, imageName));
                    ltlMsg.Text = "Child Successfully Updated.";
                    ClearFields();
                    Panel2.Visible = false;
                    Panel1.Visible = true;
                    LoadData();
                }
                else
                {
                    ltlMsg.Text = "Select Image";
                }

            }


        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert(" + ex.Message + ");window.location.replace('ChildPage.aspx');", true);
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



    protected void ImgBtnSelect_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        try
        {

            int cid = Convert.ToInt32((sender as ImageButton).CommandArgument);
            HiddenField1.Value = cid.ToString();
            DataTable dt = cc.GetChildByCID(Convert.ToInt16(HiddenField1.Value));

            if (dt.Rows.Count != 0)
            {
                txtFirstName.Text = dt.Rows[0]["FirstName"].ToString();
                txtLastName.Text = dt.Rows[0]["LastName"].ToString();
                txtDOB.Text = dt.Rows[0]["DOB"].ToString();
                ddlGender.Text = dt.Rows[0]["Gender"].ToString();
                ddlClass.Text = dt.Rows[0]["Class"].ToString();
            }
            Panel2.Visible = true;
            lblAddChild.Text = "Update Child";
            btnSubmit.Text = "Update";
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert(" + ex.Message + ");window.location.replace('ChildPage.aspx');", true);
        }
    }

    protected void ImgBtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string oldfileName = "";
            int id = Convert.ToInt32((sender as ImageButton).CommandArgument);
            DataTable dtImage = cc.GetChildByCID(Convert.ToInt32(id));
            oldfileName = dtImage.Rows[0]["Photo"].ToString();

            cc.DeleteChild(id);


            File.Delete(Server.MapPath("~/ChildImages/" + oldfileName));
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "confirm('Successfully deleted!')", true);
            LoadData();
            Panel1.Visible = true;

        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert(" + ex.Message + ");window.location.replace('Child.aspx');", true);
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}