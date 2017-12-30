<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deadlocking_in_ADO_2.aspx.cs" Inherits="DEADLOCK_ERRORS_ADO.Deadlocking_in_ADO_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btn2" runat="server" Text="Update TableB then TableA" OnClick="btn2_Click" />
            <br />
            <br />
            <asp:Label ID="lblStatus" runat="server" ></asp:Label>
        </div>
    </form>
</body>
</html>
