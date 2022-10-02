<%-- 
    Document   : Register_Page
    Created on : 08-Sep-2022, 9:02:13 PM
    Author     : harshal
--%>

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
        <title>Register Page</title>
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


        <main class="primary-background banner-background" style="padding-bottom: 80px;" >
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card baseBlock">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-3x fa-user-circle"></span>
                                <br>
                                Register Here
                            </div>
                            <div class="card-body">
                                <form id="regform" action="RegisterServlet" method="post">


                                    <div class="form-group">
                                        <label for="user_name">User Name</label>
                                        <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                                    </div>


                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>


                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>


                                    <div class="form-group">
                                        <label for="gender">Select Gender</label>
                                        <br>
                                        <input type="radio" name="user_gender" value="Male"> Male
                                        <input type="radio" name="user_gender" value="Female"> Female
                                    </div>


                                    <div class="form-group">
                                        <textarea name="about" class="form-control" id="" rows="2" placeholder="Tell us something about yourself !!"></textarea>
                                    </div>


                                    <div class="form-check">
                                        <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms and conditions !</label>
                                    </div>
                                    <br>

                                    <div id="loader" class="container text-center" style="display: none">
                                        <span class="fa fa-refresh fa-spin fa-3x"></span>
                                        <h4>Please wait...</h4>
                                    </div>
                                    <br>
                                    <button type="submit" id="btnsubmit" class="btn btn-primary">Submit</button>

                                </form>
                            </div>
                             <div class="card-footer text-center">
                                 <h3 class="blockquote mb-0">Already have an account ? <a href="Login_Page.jsp">Log In</a></h3> 
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


        <script>
            $(document).ready(function ()
            {

                $(".admin-navbar").hide();


            });
        </script>

        <script>
            $(document).ready(function ()
            {
                console.log("page is ready..")
                document.getElementById("cat-dis").style.display = "none";


                $("#regform").on('submit', function (event)
                {
                    event.preventDefault();

//                    var f = $(this).serialize();
                    let f = new FormData(this);

                    $("#btnsubmit").hide();
                    $("#loader").show();

                    $.ajax({
                        url: "RegisterServlet",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {

                            $("#btnsubmit").show();
                            $("#loader").hide();

                            if (data.trim() === 'done')
                            {
                                console.log(data);
                                swal("Successfully Registered !", "We are Redirecting to Login page...!", "success")
                                        .then((value) => {
                                            window.location = "Login_Page.jsp";
                                        });
                            } else
                            {
                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#btnsubmit").show();
                            $("#loader").hide();
                            swal("Something Went Wrong, try again...!!!");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
    </body>
</html>
