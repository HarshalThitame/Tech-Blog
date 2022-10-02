<%-- 
    Document   : Show_Blog_Page
    Created on : 11-Sep-2022, 8:25:52 PM
    Author     : harshal
--%>

<%@page import="com.techblogs.entities.Admin"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.techblogs.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblogs.entities.Post"%>
<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="com.techblogs.dao.PostDao"%>
<%@page import="com.techblogs.entities.User"%>
<%@page import="com.techblogs.dao.UserDao"%>
<%@page import="com.techblogs.dao.LikeDao"%>
<%@page errorPage="Error_Page.jsp" %>
<%
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Login_Page.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%> || Tech Blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 90%, 75% 100%, 50% 90%, 25% 100%, 0 90%);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
            }
            .row-user{
                border: 1px solid green;
                padding-top: 15px;
                border-radius: 50px;
            }
            body{
                background: url(img/bg1.jpg );
                background-size: cover;
                background-attachment: fixed;
            }
            .post-img{
                max-height: 300px;
                max-width: fit-content;
                background-size: cover;
                background-attachment: fixed;
            }
        </style>

    </head>
    <body>
       

        <!--main content of body-->
        <%@include file="normal_navbar.jsp"%>

        <div class="container">
            <div class="row my-4">
                <div class="col-md-12 ">
                    <div class="card baseBlock">

                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getpTitle()%></h4>
                        </div>

                        <div class="card-body">
                            <div class="text-center">
                                <img class="card-img-top my-4 post-img" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
                            </div>
                            <div class="row my-4 row-user">
                                <div class="col-md-7">
                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>
                                    <p class="post-user-info"><a href="#!"><%= ud.getUserByUserId(p.getUserId()).getName()%> </a> has posted</p>
                                </div>
                                <div class="col-md-5">
                                    <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p> 
                                </div>
                            </div>
                            <hr>
                            <p class="post-content"><%= p.getpContent()%></p>
                            <br>
                            <br>
                            <br>
                            <hr>
                            <div class="post-code">
                                <pre> <%= p.getpCode()%></pre>
                            </div>
                        </div>

                       

                    </div>
                </div>
            </div>
        </div>

     

     

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

                                $(".user-navbar").hide();
                                $(".newcat").hide();
                                $(".usercat").hide();
                                $(".user").hide();
                                $(".admincat").hide();


                            });
        </script>

        


    </body>
</html>
