<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="DiscussionForum.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


      <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <style>
        
            .active{  
              overflow: hidden;
              background-color:darkslateblue;
              display: flex;
              width: 100%;
              height: 9vh;
              z-index: 3;
              align-items:center;
              justify-content:space-evenly;
              position:fixed;
            }

            .nav {
              display: inline-block;
              color: white;
              text-align: center;
              padding: 1.4vw 1.6vw;
              text-decoration: none;
              font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
              font-size:x-large;
              background-color:darkslateblue;
              border:none;
              
            }
             .nav:hover {
                 background-color: rgb(40 31 91);
               
             }
            .navitem {
               display:flex;
               
            }
            .search {
                padding:2%;
                border-radius:0.4vw;
                font-weight:300;
                width:30vw;
            }

            .search_pos {
                display:flex;
                flex-direction:row;
                align-items:center;
            }
            .search_button {
                color:white;
               
                font-size:x-large;
            }


              .bsearch {
                background-color:darkslateblue;
                border:none;
                margin-left:3%;
                cursor:pointer;

            }

        .container {
             margin-top:12%;
            
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
                     
                 <h1>Update</h1>
                 <br/>
                  <br/>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label1" runat="server" Text=""><i class="far fa-user icons " ></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="fname" runat="server"  BorderStyle="Groove"  placeholder="First Name" class="input_dec"></asp:TextBox>

                 <br />
                 <br />

                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:Label ID="Label2" runat="server" Text=""><i class="far fa-user icons" ></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="lname" runat="server"  BorderStyle="Groove" placeholder="Last Name" class="input_dec"></asp:TextBox>

                 <br />
                 <br />

                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:Label ID="Label3" runat="server" Text=""><i class="fas fa-envelope icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="email" runat="server"  BorderStyle="Groove"  placeholder="Email id" class="input_dec"></asp:TextBox>

                 <br />
                 <br />

                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:Label ID="Label4" runat="server" Text=""><i class="fas fa-phone-alt icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="contact" runat="server"  BorderStyle="Groove" placeholder="Contact number" class="input_dec" ></asp:TextBox>

                 <br />
                 <br />

                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:Label ID="Label7" runat="server" Text=""><i class="fas fa-user-lock icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="username" runat="server"  BorderStyle="Groove" placeholder="Username" class="input_dec" ></asp:TextBox>

                 <br />
                 <br />

                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:Label ID="Label8" runat="server" Text=""><i class="fas fa-university icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="university" runat="server"  BorderStyle="Groove" placeholder="University/Company" class="input_dec" ></asp:TextBox>

                 <br />
                 <br />

                 


                 <asp:Button ID="signup"  class="signup_Button" runat="server" Text="Update"  BackColor="#0099FF" BorderColor="Black" Height="51px" ToolTip="Click here to update" Width="113px"  OnSubmitBehaviour="false" OnClick="update_Click1"/>
                <br/>
                 <br/>


               
                 </div>
                 </div>
                 </form>
             </div>
</body>
</html>
