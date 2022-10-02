<%-- 
    Document   : Login_Page
    Created on : 08-Sep-2022, 7:27:46 PM
    Author     : harshal
--%>

<%@page import="com.techblogs.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User usr = (User) session.getAttribute("currentUser");
    
    Admin as = (Admin) session.getAttribute("currentAdmin");
    
    if (usr != null) {
        response.sendRedirect("Profile.jsp");
    } else if (as != null) {
        response.sendRedirect("Admin.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 90%, 75% 100%, 50% 95%, 24% 100%, 0 90%);
            }
        </style>
    </head>


    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">

                        <div class="card baseBlock ">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p class="my-2">Login Here</p>
                            </div>

                            <%                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass()%>" role="alert">
                                <%= m.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }
                            %>

                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Log in</button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center">
                                <h3 class="blockquote mb-0">Need an account ? <a href="Register_Page.jsp">Sign Up</a></h3> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>






        <!--javscript-->

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            $(document).ready(function ()
            {
                console.log("page is ready..");
                
                $(".admin-navbar").hide();
                document.getElementById("cat-dis").style.display = "none";
                
                
            });
        </script>
    </body>
</html>
