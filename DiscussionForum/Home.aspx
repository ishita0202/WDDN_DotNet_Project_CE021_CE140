<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DiscussionForum.Home" EnableEventValidation="false" %>

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
                 object-fit:cover;
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
                align-items:center;
                height:5vh;
                text-align:center;
               
            }
            .que_btn {
              background-color:darkslateblue;
              color:white;
                border:none;
                margin-left:3%;
                cursor:pointer;
                padding:1%;
                border-radius:5px;
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
               padding:1%;
              
            }
            .list_cat {
             
            }
            
            .post_main {
                margin-top:5%;
                width:40vw;
                border:1px solid black;
                padding:2%;
                border-radius:13px;
                margin-left:10%;
               
                
               
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
                max-height:50vh;
        
                overflow:hidden;
                object-fit:contain;
                
            }
            .post_footer {
               margin-top:1.5%;
                display:inline;
               align-items:center;
            
               


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
                margin-left:2%;
                margin-right:12%;
            }
            .save_btn {
                border:none;
                background-color:white;
                cursor:pointer;
               
                float:right;
               
               
            }
            .search_con {
                border:1px solid black;
                padding:2%;
                border-radius:10px;
                width:87%;
                margin-top:1.5%;
                box-shadow:4px 6px 4px 4px #888888;
                background-color:gainsboro;
            }
            .que_btn:hover {
                background-color: rgb(40 31 91);
                
            }

            .file-upload {
              cursor: pointer;      
            }

            .file-upload input {
              top: 0;
              left: 0;
              margin: 0;
           
              opacity: 0;
             
            }
            .upload {
              margin-top:2%;
              margin-left:5%;
              display:flex;
              justify-content:space-evenly;
              margin-right:2%;
            }


            .que_img {
               object-fit:contain;
               height:60vh;
                
                 
            }
            .que_img_pos {
              align-content:center; 
              margin-top:2%;


             }

            .error_post {
                 margin-left:25%;
              
            }
            
        </style>


      
</head>
<body>
  
    <form id="form1" runat="server">
     

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

     <div class="main_container">

        <div class="container">
            
            <asp:Image ID="avatar" runat="server"  class="img_card"  />
             <div class="userdetails">
                <h1 class="user_dec"><asp:Label ID="username1" runat="server" Text=""></asp:Label></h1>
                <h2 class="user_dec"><asp:Label ID="university1" runat="server" Text=""></asp:Label></h2>
            </div>

            
            <asp:Button ID="cardbutton"    class="Card_Button"    runat="server" Text="View Profile"   OnClick="cardbutton_Click" />
       </div>


      <div class="post_container">
             <div class="search_con">
                 <asp:Label ID="error_post"  class="error_post" runat="server" Text="" Visible="false"></asp:Label>
                  <div class="que_post">
      
                        <asp:DropDownList class="category" ID="que_category" runat="server"  DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category">     
                           
                        </asp:DropDownList>  
                      

                   <asp:TextBox ID="question" runat="server"  class="que_input" placeholder="Add Question"></asp:TextBox>   
                  
                                   
            </div>
               <div class="upload">
                   <label class="file-upload" >
                      <i class="fas fa-camera q_icon"></i>
                      <asp:FileUpload ID="myfile" runat="server" />
                    </label>
                    <button id="que_btn" runat="server" onserverclick="que_btn_ServerClick" class="que_btn" title="POST" >POST</button>
               </div>

      </div>




          
           <asp:DataList ID="DataList1" runat="server"  OnItemCommand="DataList1_ItemCommand" >
               <ItemStyle Height="20" Width="20">
               </ItemStyle>
               
               <ItemTemplate>
                      
            <div class="post_main">
              <div class="post_header">
                  <img alt="loginImg" class="post_img" src="<%#Eval("userimg") %>"></img>
                  <div class="post_user">
                    <h3><asp:Label ID="username" runat="server" Text="">  <%#Eval("uname") %>  </asp:Label></h3>
                    <p><asp:Label ID="university" runat="server" Text=""> <%#Eval("university") %></asp:Label></p>
                  </div>
                
                </div>
                 <hr/>
               <div class="post_body">
                    <h2> <%#Eval("question") %></h2>
                   <asp:Label ID="qid" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                  <div class="que_img_pos">               
                   <img visibility="<%# Eval("queimg") !=DBNull.Value ? "true":"false" %>" id="que_img"  src="<%# Eval("queimg") %>" class="que_img"  ></img>
                  </div>
                   

               </div>
              
               <div class="post_footer">
                <i class="fas fa-edit ans_button"></i> <asp:Button class="post_btn" id="addans"  runat="server" text="Add Answer" CommandName="addans" />
              
                <i class="fas fa-eye ans_button"></i>  <asp:Button class="post_btn" id="viewans"  runat="server" text="View Answer" CommandName="viewans" />
                
                <asp:Button class="save_btn" id="savepost"  runat="server" text="Save" CommandName="savepost" />
           <%--    <button class="post_btn" id="savepost" runat="server"  onserverclick="savepost"><i class="fas fa-bookmark ans_button"></i> </button>--%>
               </div>
          </div>


               </ItemTemplate>
             </asp:DataList>
             
             <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiscussionForumConnectionString %>" SelectCommand="SELECT * FROM [QuestionBank]"></asp:SqlDataSource>--%>


         </div>   


       

         </div>

        </form>
     </body>
</html>
