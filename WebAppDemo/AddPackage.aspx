<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPackage.aspx.cs" Inherits="WebAppDemo.AddPackage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href ="css/FormCss.css" rel="stylesheet" />  
    <script type="text/javascript">
        function refreshAndClose() {
            window.opener.location.reload(true);
            window.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>     
        <div id="ApplicationForm">
            <h1>Create Shipment Form</h1>
            <table class="ShipmentForm">
                <tr>
                    <td>
                        <label id="lblPackageName">Package Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPackageName" runat="server"></asp:TextBox>
                    </td>
                 </tr>
                <tr>
                    <td>
                        <label id="lblCreatingDate">CreatingDate</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCreatingDate" runat="server"></asp:TextBox>
                        <ajax:CalendarExtender ID="CalendarExtenderCreatingDate" runat="server" Format="yyyy-MM-dd HH:mm:ss" PopupButtonID="ImageCalendar" TargetControlID="txtCreatingDate" />
                        <asp:Image ID="ImageCalendar" runat="server" Height="20px" ImageUrl="images/calendar.png" Width="20px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblClosingDate">ClosingDate</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtClosingDate" runat="server"></asp:TextBox>
                        <ajax:CalendarExtender ID="CalendarExtenderClosingDate" runat="server" Format="yyyy-MM-dd HH:mm:ss" PopupButtonID="ImageCalendar2" TargetControlID="txtClosingDate" />
                        <asp:Image ID="ImageCalendar2" runat="server" Height="20px" ImageUrl="images/calendar.png" Width="20px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblOpened">Opened</label>
                    </td>
                    <td>
                        <asp:CheckBox ID="openedCheckBox" runat="server" AutoPostBack="true"  />

                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblCity">City</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="submitBtn" Text="Accept"  runat="server" OnClick="submitBtn_OnClick"/>
            <asp:Button ID="cancelBtn" Text="Cancel" runat="server" />
        </div>    
    </form>
</body>
</html>
