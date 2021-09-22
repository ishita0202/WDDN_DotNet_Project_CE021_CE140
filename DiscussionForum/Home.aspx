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

            .main_container {
                display:flex;
                justify-content:space-between;
              

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
            .container {
                margin-top:8%;
                margin-left:2%;
                padding-top:1%;
                float:left;
                display:flex;
                flex-direction:column;
                align-items:center;
                border:1px solid black;
                box-shadow: 5px 8px 6px 6px #888888;
                border-radius:5%;
               position:fixed;
                height:50vh;
                width:20vw;

            }
            .userdetails {
                margin-top:4%;
                text-align:center;
            }

            .img_card {
                border-radius:50%;
                width:8vw;
                height:16vh;

            }
            .user_dec {
             margin:2%;
            }
            .Card_Button {
               width:101%;
               height:7vh;
               background-color:darkslateblue;
               color:white;
               font-weight:500;
               padding:1%;
               font-size:large;
               cursor:pointer;
               margin-top:auto;
               
               border-radius: 0px 0px 17px 17px;
               
              z-index:999999999;
            }
                .Card_Button:hover {
                     background-color: rgb(40 31 91);
            }
            .post_container {
                   
                 margin-top:10%;
               
                
                 margin-right:10%;
                 margin-left:30%;
                  display:flex;
                  flex-direction:column;
            }

            .que_post {
               
                display:flex; 
                margin-right:10%;
                height:5vh;
               
            }
            .que_btn {
              background-color:white;
                border:none;
              margin-left:3%;
                cursor:pointer;
            }
            .que_input {
                  
                    padding:1%;
                    border-radius:0.4vw;
                    font-weight:300;
                    width:50vw;
                   
            }
            .q_icon {
              color:darkslateblue;
              font-size:x-large;
               
            }
            .category {
                margin-right:1%;
                border:2px solid black;
               border-radius:0.4vw;
              
            }
            .list_cat {
             
            }
            
            .post_main {
                margin-top:5%;
                width:87%;
                border:1px solid black;
                padding:2%;
                border-radius:13px;
                
            }
            .post_user{
                display:flex;
                flex-direction:column;
                margin-left:2%;
                 padding:0.5%;
                 
            }
            .post_header {
                display:flex;
                margin-bottom:1%
            }
            .post_body {
                margin-top:3%;
                margin-bottom:3%;
                
            }
            .post_footer {
               margin-top:1.5%;
               justify-content:space-between;
               align-items:center;
               display:flex;
               


            }
            .post_img {
                  width:3vw;
                  height:6vh;
                  border-radius:50%;
            }

            .ans_button {
                font-size:large;

            }
            .post_btn {
                border:none;
                background-color:white;
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

     <div class="main_container">

        <div class="container">
            <img alt="loginImg" class="img_card" src="images/1.jpg"  />
            <div class="userdetails">
                <h1 class="user_dec">Vrundan Shah</h1>
                <h2 class="user_dec">Dharmsinh Desai University</h2>
            </div>

             <button id="cardbutton" class="Card_Button">View Profile</button>
       </div>


<div class="post_container">

        <div class="que_post">
      
            <asp:DropDownList class="category" ID="que_category" runat="server">

                 <asp:ListItem Value="Choose Category" class="list_cat" Selected="True">Choose Category</asp:ListItem>
                 <asp:ListItem Value="Education" class="list_cat">Education</asp:ListItem>
                 <asp:ListItem Value="Sports" class="list_cat">Sports</asp:ListItem>
                 <asp:ListItem Value="Games" class="list_cat">Games</asp:ListItem>
                 <asp:ListItem Value="Music" class="list_cat">Music</asp:ListItem>
                 <asp:ListItem Value="Health" class="list_cat">Health & Fitness</asp:ListItem>
                 <asp:ListItem Value="Business" class="list_cat">Business</asp:ListItem>
                 <asp:ListItem Value="Food" class="list_cat">Food</asp:ListItem>
                 <asp:ListItem Value="Science" class="list_cat">Science and Tech</asp:ListItem>
                 <asp:ListItem Value="Fashion" class="list_cat">Fashion & style</asp:ListItem>
                <asp:ListItem Value="Travel" class="list_cat">Travel</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="question" runat="server"  class="que_input" placeholder="Add Question"></asp:TextBox>
           
            <button id="que_btn" class="que_btn" title="POST" ><i class="fas fa-pen q_icon"></i></button>
       </div>



          <div class="post_main">
              <div class="post_header">
                  <img alt="loginImg" class="post_img" src="images/1.jpg"  />
                  <div class="post_user">
                    <h3>Vrundan</h3>
                    <p>Dharmsinh Desai University</p>
                  </div>
                
                </div>
              <hr/>
               <div class="post_body">
                    <h2>abdcacvodgjiodgjeridogjdgjre9jbolxcbm jof?</h2>
               </div>
              
               <div class="post_footer">
               <button class="post_btn"><i class="fas fa-edit ans_button"></i> &nbsp;Add Answer</button>
               
                <button class="post_btn"><i class="fas fa-eye ans_button"></i> &nbsp;View Answer</button>

               </div>
          </div>


        <div class="post_main">
              <div class="post_header">
                  <img alt="loginImg" class="post_img" src="images/1.jpg"  />
                  <div class="post_user">
                    <h3>Vrundan</h3>
                    <p>Dharmsinh Desai University</p>
                  </div>
                
                </div>
              <hr/>
               <div class="post_body">
                    <h2>abdcacvodgjiodgjeridogjdgjre9jbolxcbm jof?</h2>
               </div>
              
               <div class="post_footer">
               <button class="post_btn"><i class="fas fa-edit ans_button"></i> &nbsp;Add Answer</button>
               
                <button class="post_btn"><i class="fas fa-eye ans_button"></i> &nbsp;View Answer</button>

               </div>
          </div>

      <div class="post_main">
              <div class="post_header">
                  <img alt="loginImg" class="post_img" src="images/1.jpg"  />
                  <div class="post_user">
                    <h3>Vrundan</h3>
                    <p>Dharmsinh Desai University</p>
                  </div>
                
                </div>
              <hr/>
               <div class="post_body">
                    <h2>abdcacvodgjiodgjeridogjdgjre9jbolxcbm jof?</h2>
               </div>
              
               <div class="post_footer">
               <button class="post_btn"><i class="fas fa-edit ans_button"></i> &nbsp;Add Answer</button>
               
                <button class="post_btn"><i class="fas fa-eye ans_button"></i> &nbsp;View Answer</button>

               </div>
          </div>
     
</div>
       

         </div>

        </form>
     </body>
</html>
