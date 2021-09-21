<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DiscussionForum.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <title>
    </title>
         
        <style>
            
            * {
                margin:0;
                padding:0;
            }
            .active{  
             overflow: hidden;
             background-color:darkslateblue;
              display: flex;
              width: 100%;
              height: 10vh;
              z-index: 3;
              align-items:center;
              justify-content:space-evenly;
            }

            .nav {
              display: inline-block;
              color: white;
              text-align: center;
              padding: 1.4vw 1.6vw;
              text-decoration: none;
              font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
              font-size:x-large;
              
             

            }
             .nav:hover {
                 background-color: rgb(40 31 91);
                }
            .navitem {
               
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
        </style>

</head>
<body>
  
    <form id="form1" runat="server">
     

      <div class="active">
          <div>

            <img alt="loginImg" class="auto-style1" src="images/logo.png"  />

          </div>
            
          <div class="navitem">
          <asp:BulletedList ID="BulletedList1" runat="server" >
                
                 <asp:ListItem Value="http://www.cohowinery.com" class="nav">Home</asp:ListItem>
                 <asp:ListItem Value="http://www.cohowinery.com" class="nav">Post</asp:ListItem>
                 <asp:ListItem Value="http://www.cohowinery.com" class="nav">Profile</asp:ListItem>
          </asp:BulletedList>
          </div>

          <div class="search_pos">

              <asp:TextBox ID="TextBox1" runat="server" class="search" placeholder="Search here..."></asp:TextBox>
              <button class="bsearch"><i class="fas fa-search search_button"></i></button>
            
          </div>
      </div>

        
        


        </form>
     </body>
</html>
