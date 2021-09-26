<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="DiscussionForum.UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <title></title>

    <style>
        .container {
            display:flex;
            flex-direction:column;
            align-items:center;            
            margin-top:2%;
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
              z-index: 3;
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
                padding-bottom:2%;
                border-radius:13px;
                padding-left:2%;
                padding-right:2%;
                align-items:center;
                
               
         }
      
       
         .post_body {
               
                max-height:50vh;
                margin-left:1%;
                overflow:hidden;
                object-fit:contain;
                
          }
            .post_footer {
              
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
            .que_img {
               object-fit:contain;
               height:60vh;
                
                 
            }
            .que_img_pos {
              align-content:center; 
              margin-top:2%;


             }
    </style>

    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="usercontainer">
                 <asp:Image ID="userimg"  class="userImg" runat="server" />
                 <div class="userDetails">
                     <div class="edit_profile">
                          <h2><asp:Label ID="username" runat="server" Text="ishita_0202"></asp:Label></h2> 
                          <button id="Button1" class="edit_btn" title="Edit Profile" runat="server"  onserverclick="edit_profile" ><i class="fas fa-user-edit edit_icon"></i></button>       
                     </div>

                     <h4><asp:Label ID="fullname" runat="server" Text="Ishita Chauhan"></asp:Label></h4>
                     <h4><asp:Label ID="university" runat="server" Text="Dharmsinh Desai University"></asp:Label></h4>
                     <h4><asp:Label ID="email" runat="server" Text="ishitachauhan0202@gmail.com"></asp:Label></h4>
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
                    <asp:BulletedList ID="BulletedList1" runat="server" >
                        <asp:ListItem Value="" class="nav">Questions</asp:ListItem>
                        <asp:ListItem Value="" class="nav">Answers</asp:ListItem>
                        <asp:ListItem Value="" class="nav">Saved</asp:ListItem>
                    </asp:BulletedList>
              </div>     
         </div>


         
         <asp:DataList ID="DataList1" runat="server"   >
            
               <ItemTemplate>
                      
                <div class="post_main">
             
                   <div class="post_body">
                       <h2> <%#Eval("question") %></h2>
                       <div class="que_img_pos">               
                            <img visibility="<%# Eval("queimg") !=DBNull.Value ? "true":"false" %>" id="que_img"  src="<%# Eval("queimg") %>" class="que_img"  ></img>
                       </div>
                   </div>
              
                   <div class="post_footer">
                        <button class="post_btn"><i class="fas fa-eye ans_button"></i> &nbsp;View Answer</button>
                   </div>
                </div>


               </ItemTemplate>
          </asp:DataList>





      </div>


    </form>
    
      
</body>



</html>
