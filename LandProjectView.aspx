<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LandProjectView.aspx.cs"  Inherits="LandProjectView" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>DASHAN Land Project</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/df.css" rel="stylesheet" />
    <script type="text/javascript" src="js/Land.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" >
        
    </script>
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
                        <div id="mapcanvas" style="width: 800px; height: 500px;"></div>
                        <br />
                        <div class="sexyborder">
                            <table border="1" class="fancytable" width="100%" align="center">
                                <tr class="headerrow">
                                    <td colspan="4">開發概算</td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        評估地點：</td>
                                    <td class="Tag2" colspan="3">
                                         <asp:Label ID="labAddress" runat="server"></asp:Label></td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>總坪數：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labOverall" runat="server"></asp:Label>
                                    </td>
                                    <td class="Tag1">
                                        <label>規畫戶數：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labPlanning" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>均坪：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labBoth" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td class="Tag1">
                                        <label>單坪均價：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labSingle_floor_price" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>土地成本：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labland_profits" runat="server" Text=""></asp:Label>
                                    </td>

                                    <td class="Tag1">
                                        <label>土地利潤%：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labSingle_floor" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>土地利潤金額：</label>
                                    </td>
                                    <td class="Tag2" colspan="3">
                                        <asp:Label ID="labLand_costs" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>


                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>建坪：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labFloor_space" runat="server"></asp:Label>
                                    </td>
                                    <td class="Tag1">
                                        <label>建築單坪成本：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labSinglefloor" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr class="datarowodd">
                                    <td class="Tag1">
                                        <label>管銷%：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labManagement" runat="server"></asp:Label>
                                    </td>
                                    <td class="Tag1">
                                        <label>建物成本：</label>
                                    </td>
                                    <td class="Tag2">
                                        <asp:Label ID="labBuilding_costs" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Tag1">單戶成本：</td>
                                    <td class="Tag2" colspan="3">
                                        <asp:Label ID="labSingle_family_costs" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">單戶成本(含管銷)：</td>
                                    <td class="Tag2" colspan="3">
                                        <asp:Label ID="labSingle_family_costs2" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr class="datarowodd">
                                    <td class="Tag1">基楚毛利：</td>
                                    <td class="Tag2" colspan="3">
                                        <asp:Label ID="labMaori_groups_Chu" runat="server" Text=""></asp:Label>
                                    </td>
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
        <!-- .footer -->
    </form>
    <script type="text/javascript" src="js/GMap.js"></script>
</body>
</html>
