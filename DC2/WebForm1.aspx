<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DC2.WebForm1" %>

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
                    <td>ID</td>
                    <td>
                        <asp:TextBox ID="textbox5" runat="server"></asp:TextBox>
                        
                        <br />
                      
                    </td>
                </tr>
                <tr>
                    <td>firstname *</td>
                    <td>
                        <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="firstname"  ErrorMessage="* Enter the firstname" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>

                <tr>
                    <td>lastname *</td>
                    <td>
                        <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lastname"  ErrorMessage="* Enter the lastname" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>

                <tr>
                    <td>city *</td>
                    <td>
                        <asp:TextBox ID="city" runat="server"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="city"  runat="server" ErrorMessage="* Enter the city" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>                


                
                <tr>
                    <br />
                    <td colspan="2" align="center">
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_click"/>
                        <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                        <asp:Button ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
                        <asp:Button ID="Button4" runat="server" Text="view" OnClick="Button4_Click" />
                    </td>
                </tr>
            </table>

             <br />
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Visible="False">
                     <Columns>
                         <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                         <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                         <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                         <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                     </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Table1]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
