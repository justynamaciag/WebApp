﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebAppDemo.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Default</title>
    <meta charset="utf-8"/>

    <script type="text/javascript">
        function divexpandcollapse(divname) {
                    
                    var div = document.getElementById(divname);
                    var img = document.getElementById('img' + divname);

                    if (div.style.display == "none") {
                        div.style.display = "block";
                        img.src = "Images/minus.png";
                    } else {

                        div.style.display = "none";
                        img.src = "Images/plus.png";
                    }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

    <div style="font-size: x-large; font-weight: bold">      

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                <asp:GridView ID="GridView1" OnPageIndexChanging="PageIndexChanging" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" ForeColor="#333333" GridLines="None" AllowPaging="True" Height="200px" Width="786px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1"  ShowFooter="True" OnRowDataBound="GridView1_OnRowDataBound" CellPadding="0" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                            <ItemTemplate>
                                <a href="JavaScript:divexpandcollapse('div<%# Eval("PackageName") %>');">
                                <img id="imgdiv<%# Eval("PackageName") %>" width="9px" border="0" src="Images/plus.png" alt="" />
                                </a>
                            </ItemTemplate>
                            <ItemStyle Width="20px" VerticalAlign="Middle"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PackageName" HeaderText="PackageName" SortExpression="PackageName" />
                        <asp:BoundField DataField="CreatingDate" HeaderText="CreatingDate" SortExpression="CreatingDate" />
                        <asp:BoundField DataField="ClosingDate" HeaderText="ClosingDate" SortExpression="ClosingDate" />                 

                        <asp:TemplateField InsertVisible="False" SortExpression="Opened">
                            <HeaderTemplate>                                
                                Opened:
                                <asp:DropDownList ID="ddlOpened" runat="server" OnSelectedIndexChanged="OpenedChanged" AutoPostBack="true" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Opened" Value="true"></asp:ListItem>                            
                                    <asp:ListItem Text="Closed" Value="false"></asp:ListItem>
                                    <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                </asp:DropDownList>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="openedChBox" Checked='<%# Eval("Opened") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  ToolTip="Edit this package attributes" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <tr>
                                    <td colspan="100%">
                                        <div id="div<%# Eval("PackageName") %>" style="overflow: auto; position:relative; display:none; left: 15px; overflow: auto">
                                            <asp:GridView ID="gv_Child" runat="server" Width="95%" AutoGenerateColumns="false" DataKeyNames="PackageName">
                                                <Columns>
                                                    <asp:BoundField DataField="ShipName" HeaderText="ShipName" />
                                                    <asp:BoundField DataField="Address" HeaderText="Address" />
                                                    <asp:BoundField DataField="CreatingDate" HeaderText="CreatingDate" />
                                                    <asp:BoundField DataField="Loads" HeaderText="Loads" />
                                                </Columns>
                                                <HeaderStyle BackColor="#4D92C1" ForeColor="White" />
                                            </asp:GridView>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                
            </ContentTemplate>
        </asp:UpdatePanel>     
        
        <asp:TextBox runat="server" ID="tb" TextChanged="tb_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:TextBox runat="server" ID="t"  AutoPostBack="true"></asp:TextBox>   

    </div>
        <br />

        <script type="text/javascript">
                function Confirm(packageName) {
                    var confirm_value = document.createElement("INPUT");
                    confirm_value.type = "hidden";
                    confirm_value.name = "confirm_value";                    
                    if (confirm("This package is closed! Are you sure to open it?")) {
                        url = "Update.aspx?PacNo=" + packageName;
                        window.location.href = url;
                    } 
                }

        </script>        

    </form>
</body>
</html>