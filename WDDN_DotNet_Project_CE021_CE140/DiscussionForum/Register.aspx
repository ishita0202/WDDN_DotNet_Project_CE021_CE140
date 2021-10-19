<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DiscussionForum.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <style>
         * {
            margin:0;
            padding:0;

        }
        .container {
             margin-top:2%;
            
            text-align:center;
          
        }
        .signup_Button {
                border-radius:1vw;
                font-size:large;
                font-weight:500;
                margin-left: 10%;
                cursor:pointer;
        }
        .signup_con {
            margin-top:2%;
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
            padding:1.5%;
            border-radius:0.4vw;
            font-weight:300;
        }
        </style>
</head>
<body>
    <div class="login_img">
        <img alt="loginImg" class="auto-style1" src="images/1.jpg"  />
    <form id="form1" runat="server">
       
             <div class="container">
                 <div class="signup_con">
                     <asp:Label ID="registererr" runat="server" Visible="false"></asp:Label>
                 <h1>Register</h1>
                 <br/>
                  <br/>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label1" runat="server" Text=""><i class="far fa-user icons " ></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="fname" runat="server"  BorderStyle="Groove"  placeholder="First Name" class="input_dec"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter first name" ControlToValidate="fname"></asp:RequiredFieldValidator>
                 <br />
                 <br />

                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:Label ID="Label2" runat="server" Text=""><i class="far fa-user icons" ></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="lname" runat="server"  BorderStyle="Groove" placeholder="Last Name" class="input_dec"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter last name" ControlToValidate="lname"></asp:RequiredFieldValidator>
                 <br />
                 <br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label3" runat="server" Text=""><i class="fas fa-envelope icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="email" runat="server"  BorderStyle="Groove" Textmode="Email" placeholder="Email id" class="input_dec"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter email" ControlToValidate="email"></asp:RequiredFieldValidator>
                 <br />
                 <br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label4" runat="server" Text=""><i class="fas fa-phone-alt icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="contact" runat="server"  BorderStyle="Groove" placeholder="Contact number" class="input_dec" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter contact" ControlToValidate="contact"></asp:RequiredFieldValidator>
                 <br />
                 <br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label7" runat="server" Text=""><i class="fas fa-user-lock icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="username" runat="server"  BorderStyle="Groove" placeholder="Username" class="input_dec" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter username" ControlToValidate="username"></asp:RequiredFieldValidator>
                 <br />
                 <br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label8" runat="server" Text=""><i class="fas fa-university icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="university" runat="server"  BorderStyle="Groove" placeholder="University/Company" class="input_dec" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter University" ControlToValidate="university"></asp:RequiredFieldValidator>
                 <br />
                 <br />                 
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label5" runat="server" Text=""><i class="fas fa-lock icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="pass" runat="server"  BorderStyle="Groove" Textmode="Password" placeholder="Password" class="input_dec"></asp:TextBox>
            
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter password" ControlToValidate="pass"></asp:RequiredFieldValidator>
                    
                 <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="pass" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                 
                 <br />
                 <br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label6" runat="server" Text=""><i class="fas fa-lock icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="repass" runat="server"  BorderStyle="Groove" Textmode="Password" placeholder="Re-enter Password" class="input_dec"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Confirm password" ControlToValidate="repass"></asp:RequiredFieldValidator>
                 <br/>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="repass" ControlToValidate="pass" ErrorMessage="Password does not match"></asp:CompareValidator>
                 <br />
                 <br />

                 <asp:Button ID="signup"  class="signup_Button" runat="server" Text="Sign up"  BackColor="#0099FF" BorderColor="Black" Height="51px" ToolTip="Click here to signup" Width="113px" style="margin-right:10%" OnClick="signup_Click" />
                <br/>
                 <br/>


                 <asp:Label ID="register" runat="server" Text="Already Have An Account?? " style="font-size:large; margin-left:2%"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" style="font-size:large " NavigateUrl="Login.aspx">Login</asp:HyperLink>
                 </div>
                 </div>
                 </form>
             </div>
        
    
</body>
</html>
