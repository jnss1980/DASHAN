<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LandProject.aspx.cs" Inherits="LandProject" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>DASHAN Land Project</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/df.css" rel="stylesheet" />
    <script type="text/javascript" src="js/Land.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</head>
<body onclick="MyEvent()" onkeydown="MyEvent()" onkeyup="MyEvent()" onchange="MyEvent()">
    <form id="form1" runat="server">
        <div class="wrapper">
            <header class="header">
                <div style="text-align: center;">
                    <h5>DASHAN Land Project</h5>
                </div>
            </header>
            <!-- .header-->

            <div class="middle">
                <div class="container">
                    <main class="content">
                    <asp:HiddenField ID="Hidlat" runat="server" />
                    <asp:HiddenField ID="Hidlng" runat="server" />
                    <asp:HiddenField ID="HidAddress" runat="server" />
                    <fieldset>
                        <legend></legend>
                        <span id="status" class="success">checking...</span>
                        <div id="mapcanvas" style="width: 900px; height: 500px;"></div>
                        <br />
                        <div class="sexyborder">
                            <table border="1" class="fancytable" width="100%" align="center">
                                <tr class="headerrow">
                                    <td colspan="4">開發概算</td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        土<label>地總坪數：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:TextBox ID="txtOverall" runat="server" Text=""></asp:TextBox>
                                    </td>
                                    <td class="Tag1">
                                        <label>規畫戶數：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:TextBox ID="txtPlanning" runat="server" Text=""></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        單<label>戶均坪：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labBoth" runat="server" Text=""></asp:Label>
                                        <asp:HiddenField ID="HidBoth" runat="server" Value="" />
                                    </td>
                                    <td class="Tag1">
                                        <label>單坪均價：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:TextBox ID="txtSingle_floor_price" runat="server" Text=""></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>土地成本：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labland_profits" runat="server" Text=""></asp:Label>
                                        <asp:HiddenField ID="Hidland_profits" Value="" runat="server" />
                                    </td>

                                    <td class="Tag1">
                                        <label>土地利潤%：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:TextBox ID="txtSingle_floor" runat="server" Text=""></asp:TextBox>
                                    </td>
                                </tr>

                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>土地利潤金額：</label>
                                    </td>
                                    <td class="Tag2" colspan="3">
                                        <asp:Label ID="labLand_costs" runat="server" Text=""></asp:Label>
                                        <asp:HiddenField ID="HidLand_costs" runat="server" Value="" />
                                    </td>
                                </tr>


                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>單戶建坪：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:TextBox ID="txtFloor_space" runat="server" Text=""></asp:TextBox>
                                    </td>
                                    <td class="Tag1">
                                        <label>建築單坪成本：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:TextBox ID="txtSinglefloor" runat="server" Text=""></asp:TextBox>
                                    </td>
                                </tr>

                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>管銷%：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:TextBox ID="txtManagement" runat="server" Text=""></asp:TextBox>
                                    </td>
                                    <td class="Tag1">
                                        <label>建物成本：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labBuilding_costs" runat="server" Text=""></asp:Label>
                                        <asp:HiddenField ID="HidBuilding_costs" runat="server" Value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Tag1">單戶成本：</td>
                                    <td class="Tag2" colspan="3">
                                        <asp:Label ID="labSingle_family_costs" runat="server" Text=""></asp:Label>
                                        <asp:HiddenField ID="HidSingle_family_costs" runat="server" Value="" />
                                    </td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">單戶成本(管銷)：</td>
                                    <td class="Tag2" colspan="3">
                                        <asp:Label ID="labSingle_family_costs2" runat="server" Text=""></asp:Label>
                                        <asp:HiddenField ID="HidSingle_family_costs2" runat="server" Value="" />
                                    </td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">單戶成本(管銷+土地利率)：</td>
                                    <td class="Tag2" colspan="3">
                                        <asp:Label ID="labMaori_groups_Chu" runat="server" Text=""></asp:Label>
                                        <asp:HiddenField ID="HidMaori_groups_Chu" runat="server" Value="" />
                                    </td>
                                </tr>
                            </table>
                            <table border="0" width="100%">
                                <tr>
                                    <td align="Center">
                                        <asp:Button ID="btnSave" runat="server" Text="儲存記錄" Height="34px" OnClick="btnSave_Click" Width="190px"></asp:Button></td>
                                </tr>
                            </table>
                        </div>
                    </fieldset>
                </main>
                    <!-- .content -->
                </div>
                <!-- .container-->

                <aside class="left-sidebar">
                    <strong>
                        <asp:TreeView ID="TreeView1" runat="server" MaxDataBindDepth="2"></asp:TreeView>
                    </strong>
                </aside>
                <!-- .left-sidebar -->

            </div>
            <!-- .middle-->

        </div>
        <!-- .wrapper -->

        <%-- <footer class="footer">
            <div style="text-align: right;">
                <h1>Product By Rochen</h1>
            </div>
        </footer>--%>
        <!-- .footer -->
    </form>
    <script type="text/javascript" src="js/GMap.js"></script>
</body>
</html>
