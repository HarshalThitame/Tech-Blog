<%-- 
    Document   : profile
    Created on : 09-Sep-2022, 11:55:00 AM
    Author     : harshal
--%>

<%@page import="com.techblogs.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="com.techblogs.dao.PostDao"%>
<%@page import="com.techblogs.entities.Message"%>
<%@page import="com.techblogs.entities.User"%>
<%@page errorPage="Error_Page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login_Page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 90%, 75% 100%, 50% 90%, 25% 100%, 0 90%);
            }
            body{
                background: url(img/bg1.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .p-text{
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 3; /* number of lines to show */
                -webkit-box-orient: vertical;
            }
        </style>
    </head>
    <body>


        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background" >
            <a class="navbar-brand" href="index.jsp"><i class="fa fa-chrome fa-spin" style="font-size: 30px;"></i>    Tech Blog</a> 
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><i class="fa fa-home" style="font-size:18px;"></i> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-indent" style="font-size:18px;"></i>    Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item c-link"  href="#!" onclick="getPosts(0, this)"> All Posts</a>

                            <%
                                PostDao post = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> al = post.getAllCategories();
                                for (Category c : al) {
                            %>


                            <a class="dropdown-item c-link"  href="#!" onclick="getPosts(<%= c.getCid()%>, this)"><%= c.getName()%></a>

                            <%
                                }
                            %>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="About_Us.jsp">
                            <i class="fa fa-phone" style="font-size:18px;"></i>
                            Contact
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">
                            <i class="fa fa-plus-square-o" style="font-size: 20px;"></i>
                            New Post
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="UserProfile.jsp">
                            <i class="fa fa-user" style="font-size: 20px;"></i>
                            User Profile
                        </a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item active">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-model">
                            <span class="fa fa-user-circle"></span> &nbsp;<%= user.getName()%>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="LogoutServlet">
                            <span class="fa fa-sign-out"></span> &nbsp;Log out
                        </a>
                    </li>
                </ul>

            </div>
        </nav>
        <!--end of navbar-->

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--main body of the page-->

        <main>
            <div class="container" style="  max-width: 1500px;">
                <div class="row mt-4">

<!--                    first col
                    <div class="col-md-3" style="position: fixed;">

                        Categories
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            get Categories
                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();

                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"> <%= cc.getName()%></a>

                            <%
                                }
                            %>
                        </div>
                    </div>-->

                    <!--second col-->
                    <div class="col-md-12">

                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class=" mt-4">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--end main body of the page-->


        <!--profile modal-->
        <!-- Modal -->
        <div class="modal fade " id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-center text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 150px;"/>
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>


                            <!--details-->
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%=user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%=user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About : </th>
                                            <td><%=user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%=user.getDateTime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile Edit-->
                            <div id="profile-edit" style="display: none">
                                <h3 class="mt-2">Please edit carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Id</td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender</td>
                                            <td><%=user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <td>About</td>
                                            <td>
                                                <textarea class="form-control" name="user_about"><%= user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Profile Pic</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" required>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button class="btn btn-outline-primary ">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile modal-->

        <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>
                            </div>    
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" rows="5" placeholder="Enter your content..."></textarea>
                            </div>    
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" rows="5" placeholder="Enter your program(if any)..."></textarea>
                            </div> 
                            <div class="form-group">
                                <label>Select image</label>
                                <br>
                                <input name="pic" type="file"/>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--end of post modal-->

        <!--javscript-->

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
             $(document).ready(function ()
            {
                console.log("page is ready..");
                
                $(".admin-navbar").hide();
                
               
            });
        </script>
        <script>
                                $(document).ready(function () {

                                    let editStatus = false;

                                    $('#edit-profile-btn').click(function () {
                                        if (editStatus == false)
                                        {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else
                                        {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");

                                        }
                                    });
                                });
        </script>

        <!--add post js-->

        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted

                    event.preventDefault();
                    console.log("submiteed");
                    let form = new FormData(this);

                    //now requesting to server

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Published !", "Successfully Posted !!!", "success")
                                    .then((value) => {
                                        location.reload();
                                    });


                            } else
                            {
                                swal("Sorry!", "Something went wrong !!!", "Error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Sorry!", "Something went wrong !!!", "Error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>


        <!--loading post--> 
        <script>

            function  getPosts(catId, temp) {
                $('#loader').show();
                $('#post-container').hide();

                $(".c-link").removeClass('active')

                $.ajax({
                    url: "Load_Post.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    }
                })
            }

            $(document).ready(function (e) {
//                alert("loading")

                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef);
            })
        </script>
        <script>

            function  getPosts(catId, temp) {
                $('#loader').show();
                $('#post-container').hide();

                $(".c-link").removeClass('active')

                $.ajax({
                    url: "Load_Post.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    }
                })
            }

            $(document).ready(function (e) {
//                alert("loading")

                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef);
            })
        </script>
    </body>
</html>
