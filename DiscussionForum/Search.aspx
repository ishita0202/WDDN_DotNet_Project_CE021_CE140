<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="DiscussionForum.Search" EnableEventValidation="false"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    
    <style>
        .container {
            align-items:center;
            display:flex;
            flex-direction:column;
            
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
            
            
            .save_btn {
                border:none;
                background-color:white;
                cursor:pointer;
               
                float:right;
               
               
            }


            .que_img {
               object-fit:contain;
               height:60vh;
                
                 
            }
            .que_img_pos {
              align-content:center; 
              margin-top:2%;


             }

              .post_btn {
                border:none;
                background-color:white;
                cursor:pointer;
                margin-left:2%;
                margin-right:12%;
            }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
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
        </div>
    </form>
</body>
</html>
