<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DiscussionForum.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <title></title>

    <style>
        
        * {
            margin:0;
            padding:0;

        }
        .container {
            margin-top:20%;
            text-align:center;
          
        }
        .login_Button {
            border-radius:1vw;
            font-size:large;
            font-weight:500;
            margin-left: 0px;
            cursor:pointer;
        }
        .login_con {
            margin-top:7%;
        }
        
        .auto-style1 {
            width: 100%;
            height: 100%;
        }
        .login_img {
          display: grid;
          grid-template-columns: 50% 50%;
          width:100vw;
          height:100vh;

        
        }
        .icons {
            font-size:large;
            margin-right:4px;
        }
          
         .input_dec {
            padding:0.5%;
            border-radius:0.4vw;
            font-weight:300;
        }
        
    </style>
</head>
<body>
     <div class="login_img">
        <img alt="loginImg" class="auto-style1" src="images/1.jpg"  />
    <form id="form1" runat="server" >
          
        <div class="container">
            <h1>Login</h1>
            <div class="login_con">
            <asp:Label ID="userLabel" runat="server" Text="Username" > <i class="far fa-user icons" >  </i></asp:Label>
            <asp:TextBox ID="username" runat="server" BorderStyle="Groove" Height="33px" Width="286px" style="margin-left: 0px" class="input_dec" placeholder="Username"></asp:TextBox>
            <br />
            <br/>
        
            <asp:Label ID="PassLabel" runat="server" Text="Passward"> <i class="fas fa-lock icons"></i></asp:Label>
            <asp:TextBox ID="pass" runat="server" BorderStyle="Groove" Height="33px" Width="286px" style="margin-left: 0px" class="input_dec" placeholder="Password"></asp:TextBox>
            <br />
            <br/>
            <asp:Button class="login_Button" ID="loginButton" runat="server" Text="Login" BackColor="#0099FF" BorderColor="Black" Height="51px" ToolTip="Click here to Login" Width="113px"   onClick="loginButton_Click"/>
             <br/>
             <br/>
                  <asp:Label ID="register" runat="server" Text="New User?? " style="font-size:large" ></asp:Label>
                <asp:HyperLink ID="signup" runat="server" style="font-size:large" NavigateUrl="Register.aspx">Sign up</asp:HyperLink>
             </div>
            
          </div>
        </form>
       </div>
   
</body>
</html>
