<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestGmap.aspx.cs" Inherits="TestGmap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="js/ajaxGmap.js"></script>
    <script type="text/javascript">
        
        function gx(data) {
            for (var i = 0; i < data.length; i++) {
                document.write(data[i].pid);
            }            
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="BtnTest" runat="server" Text="測試Json" OnClientClick='getAjax("台中市","南屯區",gx);' />
        </div>
        <asp:Label ID="labShow" runat="server"></asp:Label>
    </form>
</body>
</html>
