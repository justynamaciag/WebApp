<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddShipment.aspx.cs" Inherits="WebAppDemo.AddShipment" %>
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
                        <label id="lblShipName">Shipment Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtShipName" runat="server"></asp:TextBox>
                    </td>
                 </tr>
                <tr>
                    <td>
                        <label id="lblAddress">Address</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblCreatingDate">Creating Date</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCreatingDate" runat="server"></asp:TextBox>
                        <ajax:CalendarExtender ID="CalendarExtenderCreatingDate" runat="server" Format="yyyy-MM-dd HH:mm:ss" PopupButtonID="ImageCalendar" TargetControlID="txtCreatingDate" />
                        <asp:Image ID="ImageCalendar" runat="server" Height="20px" ImageUrl="images/calendar.png" Width="20px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblLoads">Loads</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLoads" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="submitBtn" Text="Accept"  runat="server" OnClick="submitBtn_OnClick"/>
            <asp:Button ID="cancelBtn" Text="Cancel" runat="server" />
        
        </div>
    </form>
</body>
</html>
