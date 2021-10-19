<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="DiscussionForum.UserProfile" %>

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
            .main {
                display:flex;
                flex-direction:column;
            }
           .activenav{  
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
            display: flex;
            flex-direction: row;
            align-items: center;
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
            display:flex;
            flex-direction:column;
            align-items:center;            
            margin-top:8%;
            padding:2%;
        }
        .usercontainer {
            border-radius:10px; 
            display:flex;
            box-shadow:5px 6px 4px 4px #808080;
            width:60%;
            align-items:center;
            height:40vh;  
           
        }
        .userDetails {
            margin-left:10%;    
            
        }
        .userImg {
            border-radius:10px;
            height:100%;
            width:40%;
            object-fit:cover;
          
        }
        .edit_icon {
            margin-left:1.5vw;
            font-size:large;
            
        }
        .edit_btn {
            background-color:white;
            border:none;

        }
        .edit_icon:hover {
            color:gray;
           
        }
        .edit_profile {
            display:flex;
            
        }

        .file-upload {
              cursor: pointer;  
              margin-left:10%;
               padding:2%;
            }

        .file-upload input {
              top: 0;
              left: 0;
              margin:0;
              /* Loses tab index in webkit if width is set to 0 */
              opacity: 0;
              filter:alpha(opacity=0);
         }
         .upload {
              margin-top:2%;
              margin-left:5%;
              display:flex;
              justify-content:space-evenly;
              margin-right:2%;
         }

        .img_btn {
            border-radius:5px;
            padding:2%;
            background-color:gainsboro;
        }

         .active{  
              overflow: hidden;
              background-color:darkslateblue;
              display: flex;
              width: 60%;
              height: 5vh;
             
              align-items:center;
              justify-content:space-evenly;
             border-radius:10px;
             margin-top:2%;
         }

         .nav {
              display: inline-block;
              color: white;
              text-align:center;
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

         .post_main {
                margin-top:5%;
                width:40vw;
                border:1px solid black;
                padding:3%;
                border-radius:13px;
            
                align-items:center;
                
               
         }
      
       
         .post_body {
               
                max-height:50vh;
                margin-left:1%;
                margin-right:1%;
                overflow:hidden;
                object-fit:contain;
                padding:3%;
          }
            .post_footer {
               padding-top:2%;
               padding-left:3%;
               padding-right:3%;
             
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
               margin-right:2%;
            }
             .ans_button1 {
                font-size:large;
                 margin-left:20%;
                 margin-right:2%;
            }
            .post_btn {
                border:none;
                background-color:white;
                cursor:pointer;
            }       
            .que_img {
               object-fit:contain;
               height:60vh;
                
                 
            }
            .que_img_pos {
              align-content:center; 
              margin-top:2%;


             }
               .post_img {
                  width:3vw;
                  height:6vh;
                  border-radius:50%;
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
    </style>

    
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
       <div class="activenav">
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
            <div class="usercontainer">
                 <asp:Image ID="userimg"  class="userImg" runat="server" />
                 <div class="userDetails">
                     <div class="edit_profile">
                          <h2><asp:Label ID="username" runat="server" Text="ishita_0202"></asp:Label></h2> 
                          <button id="Button1" class="edit_btn" title="Edit Profile" runat="server"  onserverclick="edit_profile" ><i class="fas fa-user-edit edit_icon"></i></button>       
                     </div>
                      <br/>
                     <h4><asp:Label ID="fullname" runat="server" Text="Ishita Chauhan"></asp:Label></h4><br/>
                     <h4><asp:Label ID="university" runat="server" Text="Dharmsinh Desai University"></asp:Label></h4><br/>
                     <h4><asp:Label ID="email" runat="server" Text="ishitachauhan0202@gmail.com"></asp:Label></h4><br/>
                  <div class="testing"> 
                        <div class="userfooter">           
                            <label class="file-upload" >
                                 <i class="fas fa-camera q_icon"></i>
                                 <asp:FileUpload ID="myfile" runat="server" />
                            </label>
                            <button id="img_btn" class="img_btn" title="Edit Image"  runat="server"   onserverclick="img_change" >Upload Image</button>  
                        </div>
                  </div>
               </div>           
         </div>

         <div class="active">              
              <div class="navitem">
                     <asp:Button ID="question" runat="server" Text="Questions"  class="nav" OnClick="question_Click" />
                   <asp:Button ID="answer" runat="server" Text="Answers"  class="nav" OnClick="answer_Click"/>
                   <asp:Button ID="saved" runat="server" Text="Saved"  class="nav" OnClick="saved_Click" />
              </div>     
         </div>


         
         <asp:DataList ID="DataList1" runat="server"  OnItemCommand="DataList1_ItemCommand" >
            
               <ItemTemplate>
                      
           <div class="post_main">   
                   <div class="post_body">
                       <h2> <%#Eval("question") %></h2>
                       <div class="que_img_pos">               
                            <img visibility="<%# Eval("queimg") !=DBNull.Value ? "true":"false" %>" id="que_img"  src="<%# Eval("queimg") %>" class="que_img"  ></img>
                       </div>
                   </div>
                   <div class="post_footer">
                         <asp:Label ID="qid" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                        <i class="fas fa-eye ans_button"></i>  <asp:Button class="post_btn" id="viewans"  runat="server" text="View Answer" CommandName="viewans" />
                        <i class="fas fa-trash-alt ans_button1"></i><asp:Button class="post_btn" id="delete"  runat="server" text="Delete Question" CommandName="delete" />
                   </div>
            </div>


               </ItemTemplate>
          </asp:DataList>







          <asp:DataList ID="DataList2" runat="server"  onItemCommand="DataList2_ItemCommand" >
            
           <ItemTemplate>
          <div class="post_main" >     
              <div class="post_header">
                  <img alt="loginImg" class="post_img" src="<%#Eval("queuserimg") %>"></img>
                  <div class="post_user">
                    <h3><asp:Label ID="username" runat="server" Text="">  <%#Eval("queuname") %>  </asp:Label></h3>
                    <p><asp:Label ID="university" runat="server" Text=""> <%#Eval("queuniversity") %></asp:Label></p>
                  </div>
                </div>
              <hr/>
                   <div class="post_body">
                       <h2> <%#Eval("question") %></h2>
                       <div class="que_img_pos">               
                            <img visibility="<%# Eval("questionimg") !=DBNull.Value ? "true":"false" %>" id="que1_img"  src="<%# Eval("questionimg") %>" class="que_img"  ></img>
                       </div>
                      
                   </div>
               <h3> <%#Eval("answer") %></h3>
              <div class="post_footer">
                    <asp:Label ID="aid" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                   <i class="fas fa-trash-alt ans_button"></i><asp:Button class="post_btn" id="delete"  runat="server" text="Delete Answer" CommandName="delete" />
              </div>
              </div>

       
            </ItemTemplate>
          </asp:DataList>


           <asp:DataList ID="DataList3" runat="server"    OnItemCommand="DataList3_ItemCommand">
            
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
                   <div class="post_body" >
                       <h2> <%#Eval("question") %></h2>
                       <div class="que_img_pos">               
                            <img visibility="<%# Eval("questionimg") !=DBNull.Value ? "true":"false" %>" id="que2_img"  src="<%# Eval("questionimg") %>" class="que_img"  ></img>
                       </div>

                    </div>
                <div class="post_footer">
                       <asp:Label ID="qid1" runat="server" Text='<%#Eval("questionid") %>' Visible="false"></asp:Label>
                      <i class="fas fa-edit ans_button"></i> <asp:Button class="post_btn" id="addans1"  runat="server" text="Add Answer" CommandName="addans" />
                      <i class="fas fa-eye ans_button1"></i>  <asp:Button class="post_btn" id="viewans1"  runat="server" text="View Answer" CommandName="viewans" />
                   </div>
          </div>
            </ItemTemplate>
          </asp:DataList>


        






      </div>
       </div>

    </form>
    
      
</body>



</html>
