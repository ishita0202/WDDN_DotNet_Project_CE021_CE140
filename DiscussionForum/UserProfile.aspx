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

        .quecontainer {
           
        }
        .userfooter{
           
        }
        .testing {
            
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
                     </div>
                     <h4><asp:Label ID="fullname" runat="server" Text="Ishita Chauhan"></asp:Label></h4>
                     <h4><asp:Label ID="university" runat="server" Text="Dharmsinh Desai University"></asp:Label></h4>
                     <h4><asp:Label ID="email" runat="server" Text="ishitachauhan0202@gmail.com"></asp:Label></h4>
                <div class="testing"> 
                  <div class="userfooter">
                    <button id="img_btn" class="edit_btn" title="Edit Image"  runat="server"   onserverclick="img_change" ><i class="fas fa-camera-retro edit_icon"></i></button>
                     <button id="edit_btn" class="edit_btn" title="Edit Profile" runat="server"  onserverclick="edit_profile" ><i class="fas fa-user-edit edit_icon"></i></button>
                 
                  </div>
                </div>
             </div>
               
         </div>
           

            



        </div>
    </form>
    
      
</body>



</html>
