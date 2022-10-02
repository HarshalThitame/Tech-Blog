<%-- 
    Document   : index.jsp
    Created on : 08-Sep-2022, 12:42:25 PM
    Author     : harshal
--%>

<%@page import="java.util.List"%>
<%@page import="com.techblogs.entities.Post"%>
<%@page import="com.techblogs.entities.User"%>
<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="com.techblogs.dao.PostDao"%>
<%@page import="com.techblogs.dao.LikeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 90%, 75% 100%, 50% 90%, 25% 100%, 0 90%);
            }
            .p-text{
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* number of lines to show */
                -webkit-box-orient: vertical;

            }


        </style>
    </head>
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp"%>


        <!--banner-->
        <div class="container-fluid p-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div  class="container">
                    <h3 class="display-3">Welcome to Tech Blog</h3>
                    <p>
                        Welcome to technical blog, world of technology.
                        A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output.[citation needed] Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.
                    </p>
                    <%                        if (user == null) {
                    %>
                    <a href="Register_Page.jsp" class="btn btn-outline-light btn-lg"><i class='fa fa-arrow-circle-o-right'></i>  Start ! it's free</a>

                    <a href="Login_Page.jsp" id="loginuser" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> &nbsp;Login</a>
                    <%
                    } else {
                    %>
                    <a href="Profile.jsp" class="btn btn-outline-light btn-lg "><i class='fa fa-arrow-circle-o-right'></i>  Start ! it's free</a>


                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <!--cards-->
        <div class="container">

            <div class="row">
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
                                        PostDao post = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> li = post.getAllCategories();
                                        for (Category c : li) {
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
                    url: "Load_Post_Home.jsp",
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
