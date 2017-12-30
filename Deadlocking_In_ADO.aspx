<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deadlocking_In_ADO.aspx.cs" Inherits="DEADLOCK_ERRORS_ADO.Deadlocking_In_ADO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Button ID="btn1" runat="server" Text="Update TableA then TableB" OnClick="btn1_Click" />
             <br />
             <br />
             <asp:Label ID="lblStatus" runat="server" ></asp:Label>
        </div>
    </form>
</body>
</html>
