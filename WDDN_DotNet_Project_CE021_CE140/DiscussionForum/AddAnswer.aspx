<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAnswer.aspx.cs" Inherits="DiscussionForum.AddAnswer" %>

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
        .main {
            display:flex;
            flex-direction:column;
        }
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
        .container {
             display:flex;
             flex-direction:column;
             margin-top:5%;
             align-items:center;
             justify-content:center;
             box-shadow: 5px 8px 6px 6px #888888;
             width:50vw;
             margin-bottom:5%;
             margin-left:25%;
             border-radius:10%;
             
        }
        .queContainer {
            margin-top:2%;
            display:flex;
            flex-direction:column;
            width:40vw;
            object-fit:contain;
           
            
        }
        .post_header {
            display:flex;
            margin:2%;
            width:100%;
            padding:2%;

        }
        .userimg {
             width:3vw;
             height:6vh;
             border-radius:50%;
             
        }
        .user {
            display:flex;
            flex-direction:column;
            margin-left:2%;
            
        }
        .question {
                
                padding:2%;
                max-height:50vh;
                overflow:hidden;
                object-fit:contain;

        }
        .questionimg {
              width:20vw;
              margin-top:5%;   
            
            
        }
        .queimg {
            object-fit:contain;
            height:60vh;
        }
        .ansContainer {
            margin-top:5%;
             padding:2%;
        }
        .ansArea {
            border:1px solid black;
            margin-left:0;
            
        }
        textarea {     
            resize: none; 
            overflow: hidden; 
            min-height: 15vh; 
            max-height: 100vh; 
            width:32vw; 
            padding:3%;
            font-size:large;
        }
        .ansbtn {
            padding:2%;
            background-color:darkslateblue;
            color:white;
            font-size:large;
            border-radius:5px;
            cursor:pointer;
            margin-bottom:3%;
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
        <div class="main">
        <div class="active">
          <div>
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx"><img alt="loginImg" class="auto-style1" src="images/logo.png"  /></asp:HyperLink>
          </div>        
          <div class="navitem">                
                 <asp:DropDownList class="nav" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category">                                   
                 </asp:DropDownList>  
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiscussionForumConnectionString %>" SelectCommand="SELECT [category] FROM [Category]"></asp:SqlDataSource>
                 <button class="bsearch" onserverclick="categorybtn"  runat="server"  ><i class="fas fa-search search_button"></i></button>

          </div>     
          <div class="search_pos">
              <asp:TextBox ID="TextBox1" runat="server" class="search" placeholder="Search here..." ></asp:TextBox>
              <button class="bsearch" onserverclick="search_btn"  runat="server"  ><i class="fas fa-search search_button"></i></button>
             
          </div>
          <asp:Button ID="logout" runat="server" Text="Logout"  class="nav" OnClick="logout_Click"/>

      </div>


        <div class="container">
            <div class="queContainer">
                <div class="post_header">
                    <asp:Image ID="userimg" runat="server" class="userimg" />
                    <div class="user">
                        <asp:Label ID="username" runat="server" Text=""></asp:Label>
                        <asp:Label ID="university" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <hr/>
                <div class="question">
                    <h2><asp:Label ID="que" runat="server" Text="Label"></asp:Label></h2>
                        <div class="questionimg">
                            <asp:Image ID="queimg" class="queimg" runat="server" />

                        </div>


                </div>


            </div>

            <div class="ansContainer">
                <textarea id="Answer" class="ansArea" runat="server" placeholder="WRITE YOUR ANSWER HERE...."></textarea>

           </div>
           
                <asp:Button ID="Addans" runat="server" Text="Add Answer" class="ansbtn" OnClick="Addans_Click"  />


        </div>    

        </div>
    </form>
</body>
</html>
