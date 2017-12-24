<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_LookUp_App.aspx.cs" Inherits="Employee_LookUp_App" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Employee ID:</td>
                    <td>
                        <asp:TextBox ID="txtEmpID" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Employee Name: </td>
                    <td>
                        <asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Employee Job Title:</td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Employee Salary($): </td>
                    <td>
                        <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:GridView ID="gridEmployees" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                    </td>
                </tr>

            </table>






        </div>

    </form>
</body>
</html>
