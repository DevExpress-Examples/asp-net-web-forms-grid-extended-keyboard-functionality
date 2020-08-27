<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function OnInit(s, e) {
            ASPxClientUtils.AttachEventToElement(
        s.GetMainElement(),
        "keydown",
        function (evt) {
            switch (evt.keyCode) {
                //F2            
                case 113:
                    var key = s.GetFocusedRowIndex();
                    s.StartEditRow(key);
                    break;

                    //Delete        
                case 46:
                    var key = s.GetFocusedRowIndex();
                    s.DeleteRow(key);
                    break;

                    //F3       
                case 114:
                    var key = s.GetFocusedRowIndex();
                    s.AddNewRow(key);
                    break;

                    //ENTER           
                case 13:
                    if (s.IsEditing()) {
                        s.UpdateEdit();
                    }
                    break;

                    //ESC            
                case 27:
                    if (s.IsEditing()) {
                        s.CancelEdit();
                    }
                    break;
            }
        }
    );
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul>
                <li>
            <b>F2</b> - Edit the selected row;</li>
                <li>
           <b>F3</b> - Insert a new row;</li>
                <li>
            <b>Delete</b> - Delete the selected row;</li>
                <li>
<b>Enter</b> - Close Edit Form and save changes;</li>
                <li>
<b>Esc</b> - Close Edit Form without saving.</li>
            </ul>

        <dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="False" DataSourceID="ads"
            KeyFieldName="CategoryID" ClientInstanceName="gridView" KeyboardSupport="True" AccessKey="T">
            <SettingsBehavior AllowFocusedRow="true" ConfirmDelete="true" />
            <ClientSideEvents Init="OnInit" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
            <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"
                DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" InsertCommand="INSERT INTO [Categories] ([CategoryName], [Description]) VALUES (?, ?)"
                UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ? WHERE [CategoryID] = ?"
                OnDeleting="AccessDataSource1_Modifying"
                OnInserting="AccessDataSource1_Modifying"
                OnUpdating="AccessDataSource1_Modifying">
                <DeleteParameters>
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CategoryName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="CategoryName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>
