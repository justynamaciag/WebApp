<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" MasterPageFile="~/Site1.Master"  Inherits="WebAppDemo.WebForm1" %>




<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">

    <title>Packages</title>
    <meta charset="utf-8"/>

    <script type="text/javascript">
        function divexpandcollapse(divname) {
                    
                    var div = document.getElementById(divname);
                    var img = document.getElementById('img' + divname);

                    if (div.style.display == "none") {
                        div.style.display = "block";
                        img.src = "Images/minus.png";
                    }
                    else {
                        div.style.display = "none";
                        img.src = "Images/plus.png";
                    }
        }
    </script>
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

    

</asp:Content>

<asp:Content Id="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-size: x-large; font-weight: bold">      

        <br />
        <br />
        <br />
        
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                <asp:GridView ID="GridView1" OnPageIndexChanging="PageIndexChanging" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" ForeColor="#333333" AllowPaging="True" Height="200px" Width="786px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" OnRowDataBound="GridView1_OnRowDataBound" CellPadding="0" HorizontalAlign="Center" BackColor="Black" BorderColor="Black" Font-Names="AngsanaUPC" Font-Size="X-Large" Font-Strikeout="False">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                                
                                                <EditRowStyle BackColor="#99CCFF" Wrap="True" HorizontalAlign="Center" />
                                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                                <FooterStyle BackColor="#99CCFF" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#CCCCFF" Font-Bold="True" ForeColor="White" BorderColor="Black" HorizontalAlign="Center" VerticalAlign="Top" Wrap="False" />
                                                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                                                <PagerStyle BackColor="#CCCCFF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="White" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#99CCFF" Wrap="True" HorizontalAlign="Center" />
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#99CCFF" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#CCCCFF" Font-Bold="True" ForeColor="White" BorderColor="Black" HorizontalAlign="Center" VerticalAlign="Top" Wrap="False" />
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#CCCCFF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                
            </ContentTemplate>
        </asp:UpdatePanel>     
        
    </div>
    <br />
    <br />
    <br />
    <br />

    

  </asp:Content>

    
