<%-- 
    Document   : show_blog_page
    Created on : 11-Dec-2021, 5:17:57 pm
    Author     : ANUPRIYA
--%>


<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page errorPage="error_page.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%> || The Coding Hub </title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 70% 92%, 30% 92%, 0 100%);
            }
        </style>
        <style>
            .post-title{
                /*font-weight: 150;*/
                font-size: 30px;
                font-weight: bold;
            }
            .post-content{
                /*font-weight: 250;*/
                font-size: 18px;
            }
            .post-date{
                font-style: italic;
                font-weight: 200;
            }
            .post-user-info{
                font-size: 20px;
                font-weight: bold;
            }
            .row-user{
                border: 2px solid aliceblue;
                padding-top: 15px;
            }
            .card-body{
                background: #f5f5f5;
            }
            .card-header{
                border: 2px solid floralwhite;
            }
            body{
                background: url("img/bg2.jpg");
                background-attachment: fixed;
                background-size: cover;
            }
        </style>
        <!--comment plugin-->

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/bn_IN/sdk.js#xfbml=1&version=v12.0" nonce="mTf3cXrL"></script>
    <!--comment plugin-->

</head>

<body>


    <!--navbar start-->

    <nav class="navbar navbar-expand-lg navbar-dark primary-background ">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-cubes"></span>Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span> The Coding Hub<span class="sr-only">(current)</span></a>
                </li>
                <!--            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>-->

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span> Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language</a>
                        <a class="dropdown-item" href="#">Data Structures</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Projects</a>
                    </div>
                </li>
<!--                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-phone-square"></span> Contact Us</a>
                </li>-->
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> Add Post</a>
                </li>


            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle-o"></span> <%= user.getName()%> </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!--nav bar end-->
    <!--main content of the body start-->

    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card-header">
                    <h4 class="post-title"><%= p.getpTitle()%></h4>
                </div>


                <div class="card-body">
                    <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic()%>" alt="image">

                    <div class="row my-3 row-user">
                        <div class="col-md-8">
                            <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>
                            <p class="post-user-info"> <a href="#"> <%= ud.getUserByUserId(p.getUserId()).getName()%> </a> has posted.</p>
                        </div>

                        <div class="col-md-4">
                            <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                        </div>
                    </div>

                    <p class="post-content"><%= p.getpContent()%></p>
                    <br><!-- comment -->
                    <br>
                    <div class="post-code">

                        <pre><%= p.getpCode()%></pre>
                    </div>
                </div>


                <div class="card-footer primary1-background">
                    <%
                        LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    %>

                    <a href="#" onclick="doLike(<%= p.getpId()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm "><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getpId())%></span></a>
                    <a href="#" class="btn btn-outline-light btn-sm "><i class="fa fa-commenting-o"></i><span>20</span></a>

                </div>

                <div class="card-footer">

                    <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blog_page.jsp?post_id=<%= p.getpId()%>" data-width="" data-numposts="5"></div>

                </div>
            </div>

        </div>
    </div>



    <!--main content of body end-->


    <!--Start of profile modal-->

    <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary1-background text-white text-center">
                    <h5 class="modal-title" id="exampleModalLabel"> TechBLog </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="pics/<%= user.getProfile()%>" class="img-fluid" width="160px;" height="140px;" style="border-radius: 50%;">
                        <br>

                        <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                        <!--//details-->
                        <div id="profile-details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row"> ID :</th>
                                        <td><%= user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row"> Email :</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row"> Gender :</th>
                                        <td><%= user.getGender().toUpperCase()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row"> About :</th>
                                        <td><%= user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row"> Registered on :</th>
                                        <td><%= user.getDateTime().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <!--//details-->

                        <!--profile-edit-->

                        <div id="profile-edit" style="display: none;">
                            <h3 class="mt-2">Now you can edit your details.</h3> 
                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td> ID :</td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td> Name :</td>
                                        <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td> Email :</td>
                                        <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td> Password :</td>
                                        <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td> Gender :</td>
                                        <td> <%= user.getGender().toUpperCase()%> </td>
                                    </tr>
                                    <tr>
                                        <td> About :</td>
                                        <td> 
                                            <textarea rows="3" class="form-control" name="user_about"> <%= user.getAbout()%> </textarea>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td> Update Picture :</td>
                                        <td> 
                                            <input type="file" name="image" class="form-control" >

                                        </td>
                                    </tr>
                                </table>

                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>

                            </form>
                        </div>

                        <!--profile-edit-->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>


    <!--end of profile modal-->


    <!--start of add post modal-->


    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="add-post-form" action="AddPostServlet" method="post">
                        <div class="form-group">
                            <select class="form-control" name="cId">

                                <option selected disabled>---Select Category---</option>       
                                <%
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = postd.getAllCategories();
                                    for (Category c : list) {
                                %>

                                <option value="<%= c.getcId()%>"> <%= c.getName()%>  </option>     

                                <%
                                    }
                                %>

                            </select>
                        </div>


                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <textarea name="pContent" class="form-control" style="height:200px;" placeholder="Enter your Content"></textarea>
                        </div>

                        <div class="form-group">
                            <textarea name="pCode" class="form-control" style="height:200px;" placeholder="Enter your Code(if any)"></textarea>
                        </div>
                        <div class="form-group">
                            <lable>Select Image(if any)</lable>
                            <br>
                            <input type="file" name="pic">
                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary">Post</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!--end of add post modal-->


    <!--javascript-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>     
    <script src="js/myjs.js" type="text/javascript"></script>

    <script>
                        $(document).ready(function () {

                            let editStatus = false;

                            $('#edit-profile-button').click(function () {

                                if (editStatus === false) {
                                    $("#profile-details").hide();
                                    $("#profile-edit").show();
                                    editStatus = true;
                                    $(this).text("Back");
                                } else {
                                    $("#profile-details").show();
                                    $("#profile-edit").hide();
                                    editStatus = false;
                                    $(this).text("Edit");

                                }

                            });
                        });
    </script>
    <!--now add post js-->
    <script>
        $(document).ready(function (e) {
            //
            $("#add-post-form").on("submit", function (e) {
                //this code gets call when form is submitted
                event.preventDefault();
                console.log("you have posted");
                let form = new FormData(this);
                //now requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if (data.trim() === 'done') {
                            swal("Good job!", "Saved your post successfully.", "success");
                        } else {
                            swal("Error!", "Something went wrong!! Try agin...", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>

    <!--js code for like-->
    <script>
        function doLike(pId, uid) {
            console.log(pId + " , " + uid);
            const d = {
                uid: uid,
                pId: pId,
                operation: 'like'
            }
            $.ajax({
                url: "LikeServlet",
                data: d,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() == 'true') {
                        let c = $(".like-counter").html();
                        c++;
                        $('.like-counter').html(c);
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(error);
                }
            })

        }
    </script>


</body>
</html>
