<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Load_Table_Valued_Parameter_Demo.aspx.cs" Inherits="Table_Valued_Paramaters.Load_Table_Valued_Parameter_Demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnFill" runat="server" Text="Fill Data" OnClick="btnFill_Click" />
            <br />
            <br />
            <table>
                <tr>
                    <td>Employee ID</td>
                    <td><asp:TextBox ID="txtEmpID1" runat="server"></asp:TextBox></td>
               
                    <td>Full Name</td>
                    <td><asp:TextBox ID="txtName1" runat="server"></asp:TextBox></td>
                
                    <td>Job Title:</td>
                    <td><asp:TextBox ID="txtTitle1" runat="server"></asp:TextBox></td>
                
                    <td>Deparment ID</td>
                    <td><asp:TextBox ID="txtDeptID1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Employee ID</td>
                    <td><asp:TextBox ID="txtEmpID2" runat="server"></asp:TextBox></td>
               
                    <td>Full Name</td>
                    <td><asp:TextBox ID="txtName2" runat="server"></asp:TextBox></td>
                
                    <td>Job Title:</td>
                    <td><asp:TextBox ID="txtTitle2" runat="server"></asp:TextBox></td>
                
                    <td>Deparment ID</td>
                    <td><asp:TextBox ID="txtDeptID2" runat="server"></asp:TextBox></td>
                </tr>
                                <tr>
                    <td>Employee ID</td>
                    <td><asp:TextBox ID="txtEmpID3" runat="server"></asp:TextBox></td>
               
                    <td>Full Name</td>
                    <td><asp:TextBox ID="txtName3" runat="server"></asp:TextBox></td>
                
                    <td>Job Title:</td>
                    <td><asp:TextBox ID="txtTitle3" runat="server"></asp:TextBox></td>
                
                    <td>Deparment ID</td>
                    <td><asp:TextBox ID="txtDeptID3" runat="server"></asp:TextBox></td>
                </tr>
                                <tr>
                    <td>Employee ID</td>
                    <td><asp:TextBox ID="txtEmpID4" runat="server"></asp:TextBox></td>
               
                    <td>Full Name</td>
                    <td><asp:TextBox ID="txtName4" runat="server"></asp:TextBox></td>
                
                    <td>Job Title:</td>
                    <td><asp:TextBox ID="txtTitle4" runat="server"></asp:TextBox></td>
                
                    <td>Deparment ID</td>
                    <td><asp:TextBox ID="txtDeptID4" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="btnInsert" runat="server" Text="Insert Employees" OnClick="btnInsert_Click" />
        </div>
    </form>
</body>
</html>
