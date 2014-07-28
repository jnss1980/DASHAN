<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        @import url(http://fonts.googleapis.com/css?family=Anaheim);

        *
        {
            margin: 0;
            padding: 0;
            outline: none;
            border: none;
            box-sizing: border-box;
        }

            *:before,
            *:after
            {
                box-sizing: border-box;
            }

        html,
        body
        {
            min-height: 100%;
        }

        body
        {
            background-image: radial-gradient(mintcream 0%, lightgray 100%);
        }

        h1
        {
            display: table;
            margin: 5% auto 0;
            text-transform: uppercase;
            font-family: 'Anaheim', sans-serif;
            font-size: 4em;
            font-weight: 400;
            text-shadow: 0 1px white, 0 2px black;
        }

        .container
        {
            margin: 4% auto;
            width: 210px;
            height: 140px;
            position: relative;
            perspective: 1000;
        }

        #carousel
        {
            width: 100%;
            height: 100%;
            position: absolute;
            transform-style: preserve-3d;
            animation: rotation 20s infinite linear;
        }

            #carousel:hover
            {
                animation-play-state: paused;
            }

            #carousel figure
            {
                display: block;
                position: absolute;
                width: 186px;
                height: 116px;
                left: 10px;
                top: 10px;
                background: black;
                overflow: hidden;
                border: solid 5px black;
            }

                #carousel figure:nth-child(1)
                {
                    transform: rotateY(0deg) translateZ(288px);
                }

                #carousel figure:nth-child(2)
                {
                    transform: rotateY(40deg) translateZ(288px);
                }

                #carousel figure:nth-child(3)
                {
                    transform: rotateY(80deg) translateZ(288px);
                }

                #carousel figure:nth-child(4)
                {
                    transform: rotateY(120deg) translateZ(288px);
                }

                #carousel figure:nth-child(5)
                {
                    transform: rotateY(160deg) translateZ(288px);
                }

                #carousel figure:nth-child(6)
                {
                    transform: rotateY(200deg) translateZ(288px);
                }

                #carousel figure:nth-child(7)
                {
                    transform: rotateY(240deg) translateZ(288px);
                }

                #carousel figure:nth-child(8)
                {
                    transform: rotateY(280deg) translateZ(288px);
                }

                #carousel figure:nth-child(9)
                {
                    transform: rotateY(320deg) translateZ(288px);
                }

        img
        {
            -webkit-filter: grayscale(1);
            cursor: pointer;
            transition: all .5s ease;
        }

            img:hover
            {
                -webkit-filter: grayscale(0);
                transform: scale(1.2,1.2);
            }

        @keyframes rotation
        {
            from
            {
                transform: rotateY(0deg);
            }

            to
            {
                transform: rotateY(360deg);
            }
        }

        .auto-style2
        {
            width: 57px;
        }

        .Log
        {
            color: #fff;
            background: #756c6c;
            margin: 0px auto;
            border-radius: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border: #000 1px solid;
            width: 300px;
            height: 120px;
            font-family: 'Microsoft JhengHei';
        }
    </style>
    <script src="js/prefixfree.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Dashan Land Project</h1>
        <div class="container">
            <div id="carousel">
                <figure>
                    <img src="images/1.jpg" alt="">
                </figure>
                <figure>
                    <img src="images/2.jpg" alt="">
                </figure>
                <figure>
                    <img src="images/3.jpg" alt="">
                </figure>
                <figure>
                    <img src="images/4.jpg" alt="">
                </figure>
                <figure>
                    <img src="images/5.jpg" alt="">
                </figure>
                <figure>
                    <img src="images/6.jpg" alt="">
                </figure>
                <figure>
                    <img src="images/7.jpg" alt="">
                </figure>
                <figure>
                    <img src="8.jpg" alt="">
                </figure>
                <figure>
                    <img src="images/9.jpg" alt="">
                </figure>
            </div>
        </div>
        <script src='js/none.js'></script>
        <script src="js/index.js"></script>
        <div style="text-align: center; clear: both">
            <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
            <script src="/follow.js" type="text/javascript"></script>
        </div>

        
        <div class="Log">

            <table border="0">
                <tr>
                    <td class="auto-style2">帳號 </td>
                    <td rowspan="4" width="250">
                        <br />
                        <asp:ImageButton ID="imgLog" runat="server" ImageUrl="~/images/l.png" Height="46px" Width="61px" OnClick="imgLog_Click" />

                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:TextBox ID="UserAccount" runat="server" BorderStyle="Solid" BorderWidth="1" Width="181px"></asp:TextBox></td>

                </tr>
                <tr>
                    <td class="auto-style2">密碼</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:TextBox ID="UserPwd" runat="server" TextMode="Password" BorderStyle="Solid" BorderWidth="1" Width="177px"></asp:TextBox></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
