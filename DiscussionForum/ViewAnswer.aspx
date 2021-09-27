<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAnswer.aspx.cs" Inherits="DiscussionForum.ViewAnswer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>

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
             margin-top:2%;
            display:flex;
            flex-direction:column;
            width:40vw;
            object-fit:contain;
            
           
        }
        .viewans {
             margin-left:5%;
            overflow-wrap:break-word;
        }


    </style>

</head>
<body>
    <form id="form1" runat="server">
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
            <hr/>
            <div class="ansContainer">
                  <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1"    >
                 
               
                       <ItemTemplate>
                             <div class="post_header">
                                <img alt="loginImg" class="userimg" src="<%#Eval("userimg") %>"></img>
                                <div class="user">
                                    <asp:Label ID="username" runat="server" Text=""><%#Eval("uname") %></asp:Label>
                                    <asp:Label ID="university" runat="server" Text=""><%#Eval("university") %></asp:Label>
                                </div>
                            </div>
                           <div>
                               <asp:Label ID="viewans" runat="server" Text="" class="viewans" ><%#Eval("answer")%> </asp:Label>
                          </div>

                              

                       </ItemTemplate>
                     </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiscussionForumConnectionString %>" SelectCommand="SELECT * FROM [Answer]"></asp:SqlDataSource>
           </div>
           
         </div>      


    </form>
</body>
</html>
