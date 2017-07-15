<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Update.aspx.cs" Inherits="WebAppDemo.Update" ViewStateEncryptionMode="Always" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ContentPlaceHolderID="head" runat="server">

    <title>Update Package</title>
            <p style="background-color: #CCCCFF">

            </p>
          

        &nbsp;<meta charset="utf-8" /><style type="text/css">
                                                                   .auto-style1 {
                                                                   }

                                                                   .auto-style2 {
                                                                       width: 205px;
                                                                   }

                                                                   .auto-style4 {
                                                                       width: 198px;
                                                                   }

                                                                   .auto-style5 {
                                                                       width: 205px;
                                                                       height: 24px;
                                                                   }

                                                                   .auto-style6 {
                                                                       width: 198px;
                                                                       height: 24px;
                                                                   }

                                                                   width: 151px;
                                                                   }
        </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    
    <body>
       
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>   
                <div style="font-style: normal; font-size: x-large; font-weight: bold; color: #000000">
                    Update this package attributes<br />
                    <table cellpadding="0" style="width: 482px; position: relative; clip: rect(auto, auto, auto, auto); top: 2px; left: 208px;">
                        <tr>
                            <td class="auto-style5" style="font-size: medium; font-weight: bold; background-color: #CCCCFF; color: #FFFFFF;">PackageName</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="pacName" runat="server" ReadOnly="true" Width="202px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5" style="font-size: medium; font-weight: bold; background-color: #CCCCFF; color: #FFFFFF;">CreatingDate</td>
                            <td class="auto-style6">
                                <asp:TextBox ID="createDate" runat="server" AutoPostBack="true" Width="201px" />
                                <ajax:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd HH:mm:ss" PopupButtonID="Image2" TargetControlID="createDate" />
                                <asp:Image ID="Image2" runat="server" Height="20px" ImageUrl="images/calendar.png" Width="20px" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="font-size: medium; font-weight: bold; background-color: #CCCCFF; color: #FFFFFF;">ClosingDate</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="closeDate" runat="server" AutoPostBack="true" CausesValidation="true" Width="199px"></asp:TextBox>
                                <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd HH:mm:ss" PopupButtonID="Image1" TargetControlID="closeDate" />
                                <asp:Image ID="Image1" runat="server" Height="20px" ImageUrl="images/calendar.png" Width="20px" />
                                <br />
                                <asp:CustomValidator ID="customValidator1" runat="server" ControlToValidate="closeDate" Display="Dynamic" ErrorMessage="" ForeColor="Red" OnServerValidate="customValidator_ServerValidate">
                                </asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9" style="font-size: medium; font-weight: bold; background-color: #CCCCFF; color: #FFFFFF;">Opened</td>
                            <td class="auto-style10">
                                <asp:CheckBox ID="openedCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="openedCheckBox_CheckedChanged"  />
                                <asp:Textbox ID="openedValidatorTxtBox" runat="server" Text="Changes invalid. Package is closed" Width="232px"></asp:Textbox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="font-size: medium; font-weight: bold; background-color: #CCCCFF; color: #FFFFFF;">City</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="city" runat="server" Width="199px" AutoPostBack="true" CausesValidation="true"/>
                                <br />
                                <asp:CustomValidator ID="requiredCityValidator" runat="server" ControlToValidate="city" Display="Dynamic" ErrorMessage="" ForeColor="Red" OnServerValidate="customValidator_ServerValidate">
                                </asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="1">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
                <asp:Button ID="Button1" runat="server" BackColor="#CCCCFF" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="33px" OnClick="Button1_Click" Text="Save and come back" ToolTip="Save this settings and come back to packages" Width="204px" Font-Names="Arial" Font-Overline="False"  />                
                <asp:Button ID="btnUpdate" runat="server" BackColor="#CCCCFF" CssClass="auto-style1" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="33px" OnClick="btnUpdate_Click" Text="Save" ToolTip="Save this settings without coming back to packages" Width="122px" Font-Names="Arial" />
                <asp:Button ID="btnCancel" runat="server" BackColor="#CCCCFF" CssClass="auto-style5" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="33px" OnClick="btnCancel_Click" Text="Cancel" ToolTip="Coming back to all packages without saving" Width="94px" Font-Names="Arial" />
                <br />
        <br />
        <br />
        <br />        
       
        <asp:UpdatePanel ID="upPanel" runat="server">
            <ContentTemplate>

                <div>
                    <div>
                        Shipments in this package<br />&nbsp;
                        <asp:TextBox ID="printNone" Text="NONE" runat="server" Style="text-align: center" BackColor="White" BorderColor="White" BorderStyle="None" Font-Bold="True" ForeColor="Red" Height="26px" Width="132px" ></asp:TextBox>
                                <asp:Repeater ID="rptShipments" runat="server">
                                    <HeaderTemplate>
                                        <table class="auto-style1">
                                            
                                                <tr>
                                                    <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">Shipment</td>
                                                    <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">Address</td>
                                                    <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">CreatingDate</td>
                                                    <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;" class="auto-style11">Loads</td>
                                                    
                                                </tr>
                            
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" ReadOnly="true" Text='<%#Eval("Shipment") %>' Width="150px">
                                                </asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="50" ReadOnly="true" Text='<%#Eval("Address") %>' Width="150px">
                                                </asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox3" runat="server" MaxLength="50" ReadOnly="true" Text='<%#Eval("CreatingDate") %>' Width="150px">
                                                </asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox4" runat="server" MaxLength="50" ReadOnly="true" Text='<%#Eval("Loads") %>' Width="150px">
                                                </asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="DeleteButtonDB" runat="server" BackColor="#A3C1E0" CommandArgument='<%# Eval("ShipName") %>' CssClass="auto-style1" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="33px" OnClientClick="return confirm('Are you sure you want to delete?');" OnCommand="DeleteButtonDB" Text="Delete" ToolTip="Delete this shipment from this package" Width="122px" />
                                            </td>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </caption>
                        </table>
                        <br />
                        <br />
                        Add new shipment<br />

                         <tr>

                             <td>
                                 <asp:Button ID="btnAdd" runat="server"
                                     Text="Add" ToolTip="Add this shipment to section shipments added" OnClick="btnAdd_Click" BackColor="#A3C1E0" CssClass="auto-style1" Font-Bold="True" ForeColor="White" Height="37px" Width="179px" />

                             </td>
                             <td>
                                 <asp:DropDownList runat="server" ID="cb1"></asp:DropDownList>

                             </td>
                             <br />
                             <br />

                             <td>
                                 <asp:Button ID="btnSaveShip" runat="server"
                                     Text="SaveAddedShipments" OnClick="btnSaveShip_Click" ToolTip="Save shipments which were added to package" BackColor="#A3C1E0" CssClass="auto-style1" Font-Bold="True" ForeColor="White" Height="50px" Width="234px" />
                             </td>

                         </tr>

                        <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemPlaceHolder1"
                            GroupPlaceholderID="groupPlaceHolder1">
                            <LayoutTemplate>
                                <table>
                                    <tr>
                                        <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF">Shipment</td>
                                        <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">Address</td>
                                        <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">CreatingDate</td>
                                        <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">Loads</td>
                                    </tr>
                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="font-weight:100; font-size:medium"><%#Eval("ShipName") %>
                                    </td>


                                    <td style="font-weight:100; font-size:medium"><%#Eval("Address") %>
                                    </td>

                                    <td style="font-weight:100; font-size:medium"><%#Eval("CreatingDate") %>
                                    </td>

                                    <td style="font-weight:100; font-size:medium"><%#Eval("Loads") %>
                                    </td>

                                    <td>
                                        <asp:LinkButton Text="Delete"  ID="DeleteButton" CommandArgument='<%# Eval("ShipName") %>' OnCommand="DeleteButton" runat="server" BackColor="#A3C1E0" CssClass="auto-style1" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="33px" Width="122px" /></td>
                                </tr>

                            </ItemTemplate>
                        </asp:ListView>

                       
                        
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <script type="text/javascript">
            function Warning() {
                alert('This settings hasnt been saved! Some fields contain invalid values.');
            }
        </script>



</body>
    </asp:Content>


