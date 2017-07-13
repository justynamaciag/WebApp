﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="WebAppDemo.Update" ViewStateEncryptionMode="Always" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>&nbsp;<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head runat="server"><title>Update Package</title>
    <meta charset="utf-8"/>    
    <style type="text/css">
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
    </style>
</head>
<body>

    <form id="form1" runat="server" style="font-size: x-large; font-weight: bold; background-color: #FFFFFF; color: #000000; text-align: center">

        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
          

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>   
                <asp:Button ID="btnUpdate" runat="server" BackColor="#A3C1E0" CssClass="auto-style1" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="33px" OnClick="btnUpdate_Click" Text="Save" ToolTip="Save this settings without coming back to packages" Width="122px" />
                <asp:Button ID="btnCancel" runat="server" BackColor="#A3C1E0" CssClass="auto-style1" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="33px" OnClick="btnCancel_Click" Text="Cancel" ToolTip="Coming back to all packages without saving" Width="94px" />
                <asp:Button ID="Button1" runat="server" BackColor="#A3C1E0" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Save and come back" ToolTip="Save this settings and come back to packages" Width="204px"  />                
                <div style="border-style: none; font-style: normal; font-size: x-large; font-weight: bold; color: #000000">
                    Update package attributes<br />
                    <table cellpadding="0" style="width: 617px;">
                        <tr>
                            <td class="auto-style4" dir="rtl" draggable="true" style="border-style: inherit; border-color: #FFFFFF; font-size: medium; font-weight: bold; background-color: #A3C1E0; color: #FFFFFF;" translate="yes">PackageName</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="pacName" runat="server" ReadOnly="true" Width="202px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5" style="font-size: medium; font-weight: bold; background-color: #A3C1E0; color: #FFFFFF;">CreatingDate</td>
                            <td class="auto-style6">
                                <asp:TextBox ID="createDate" runat="server" AutoPostBack="true" Width="201px" />
                                <ajax:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd HH:mm:ss" PopupButtonID="Image2" TargetControlID="createDate" />
                                <asp:Image ID="Image2" runat="server" Height="20px" ImageUrl="images/calendar.png" Width="20px" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="font-size: medium; font-weight: bold; background-color: #A3C1E0; color: #FFFFFF;">ClosingDate</td>
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
                            <td class="auto-style2" style="font-size: medium; font-weight: bold; background-color: #A3C1E0; color: #FFFFFF;">Opened</td>
                            <td class="auto-style4">
                                <asp:CheckBox ID="openedCheckBox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="font-size: medium; font-weight: bold; background-color: #A3C1E0; color: #FFFFFF;">City</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="city" runat="server" Width="199px" AutoPostBack="true" CausesValidation="true"/>
                                <br />
                                <asp:RequiredFieldValidator ID="requiredCityValidator" runat="server" ControlToValidate="city" Display="Dynamic" ErrorMessage='Field city cant be empty' ForeColor="Red" OnServerValidate="customValidator_ServerValidate">
                                </asp:RequiredFieldValidator>
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
        <br />
        <asp:TextBox runat="server" ReadOnly="true" Text="Shipments"></asp:TextBox>        
       
        <asp:UpdatePanel ID="upPanel" runat="server">
            <ContentTemplate>

                <div>
                    <div>
                        <table class="auto-style1">
                            <body>
                                <tr>
                                    <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">Shipment</td>
                                    <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">Address</td>
                                    <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">CreatingDate</td>
                                    <td style="background-color: #A3C1E0; font-size: large; font-weight: bolder; color: #FFFFFF;">Loads</td>
                                </tr>
                            </body>


                            <asp:Repeater ID="rptShipments" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server"
                                                Width="150px" MaxLength="50" ReadOnly="true" Text='<%#Eval("Shipment") %>'>
                                            </asp:TextBox>
                                            
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server"
                                                Width="150px" MaxLength="50" ReadOnly="true" Text='<%#Eval("Address") %>'>
                                            </asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" runat="server"
                                                Width="150px" MaxLength="50" ReadOnly="true" Text='<%#Eval("CreatingDate") %>'>
                                            </asp:TextBox>
                                            
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox4" runat="server"
                                                Width="150px" MaxLength="50" ReadOnly="true" Text='<%#Eval("Loads") %>'>
                                            </asp:TextBox>
                                            
                                        </td>
                                        <td>
                                            <asp:LinkButton Text="Delete" ID="DeleteButtonDB" CommandArgument='<%# Eval("ShipName") %>' OnCommand="DeleteButtonDB" OnClientClick="return confirm('Are you sure you want to delete?');" ToolTip="Delete this shipment from this package" runat="server" BackColor="#A3C1E0" CssClass="auto-style1" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="33px" Width="122px" /></td>
                                        </td>
                                    </tr>

                                </ItemTemplate>

                            </asp:Repeater>
                        </table>
                        <br />
                        <br />

                        <asp:TextBox runat="server" ReadOnly="true" Text="Shipments added"></asp:TextBox>
                    <br />
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

                        <br />
                        <br />

                        <tr>
                            <td>
                                <asp:Button ID="btnAdd" runat="server"
                                    Text="Add new shipment to this package"  ToolTip="Add this shipment to section shipments added" OnClick="btnAdd_Click" BackColor="#A3C1E0" CssClass="auto-style1" Font-Bold="True" ForeColor="White" Height="37px" Width="234px" />

                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="cb1"></asp:DropDownList>
                                
                            </td>

                            <br />
                            <br />

                            <td>
                                <asp:Button ID="btnSaveShip" runat="server"
                                    Text="SaveAddedShipments" OnClick="btnSaveShip_Click"  ToolTip="Save shipments which were added to package" BackColor="#A3C1E0" CssClass="auto-style1" Font-Bold="True" ForeColor="White" Height="50px" Width="234px" />
                            </td>

                        </tr>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <script type="text/javascript">
            function Warning() {
                alert('This settings hasnt been saved! Some fields contain invalid values.');
            }
        </script>

    </form>


</body>
</html>