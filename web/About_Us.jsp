<%-- 
    Document   : About_Us
    Created on : 18-Sep-2022, 7:35:40 PM
    Author     : harshal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            
            body{
                background-image: url('https://www.idfreshfood.com/wp-content/uploads/2017/09/contact_us_2.jpg') ;
                background-repeat: no-repeat;
                background-size: auto;


            }
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 90%, 75% 100%, 50% 90%, 25% 100%, 0 90%);
            }

        </style>
    </head>
    <body>




        <div class="bgimg">
            <%@include file="normal_navbar.jsp" %>

            <div class="container mt-4">
                <div class="card">
                    <div class="card-header text-center primary-background text-white">
                        <h2>Contact Us</h2>
                    </div>
                    <div class="card-body">
                        <div class="form-group pmd-textfield pmd-textfield-floating-label my-4">
                            <input id="" class="form-control py-3" type="text" placeholder="Enter name" required>
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label my-4">
                            <input id="" class="form-control py-3" type="text" placeholder="Enter Email ID" required>
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label my-4">
                            <textarea id="" name="message" rows="5" cols="10" class="form-control py-3" placeholder="Enter your message here...."></textarea>
                        </div>
                    </div>
                    <div class="card-footer text-center bg-secondary">
                        <button class="btn btn-outline-light btn-lg" name="submit"> <i class="fa fa-send-o"></i> Send</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer bg-dark my-4 text-white py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card bg-dark">
                            <div class="card-header text-center">
                                <h3>About</h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3 text-center my-2">
                                        <i class="fa fa-location-arrow"></i>
                                    </div>
                                    <div class="col-md-9 my-2">
                                        <a class="text-white" href="https://maps.app.goo.gl/t2BobYMyuCYAMmibA" target="_blank" rel="noopener noreferrer">Sawargaon tal, Sangamner, Ahmednagar, Maharashtra, India 422605</a>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-center my-2">
                                        <i class="fa fa-phone"></i>
                                    </div>
                                    <div class="col-md-9 my-2">
                                        <p>+91 9623023477</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-center">
                                        <i class="fa fa-envelope"></i>
                                    </div>
                                    <div class="col-md-9">
                                        <a class="text-white" href = "mailto: hthitame@gmail.com">hthitame@gmail.com</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card bg-dark">
                            <div class="card-header text-center">
                                <h3>Social</h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3 text-center mb-2">
                                        <i class="fa fa-facebook-official"></i>
                                    </div>
                                    <div class="col-md-9 text-white mb-2">
                                        <a  class="text-white" href="https://www.facebook.com" target="_blank" rel="noopener noreferrer">Facebook</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-center my-2">
                                        <i class="fa fa-instagram"></i>
                                    </div>
                                    <div class="col-md-9 my-2">
                                        <a class="text-white" href="https://www.instagram.com" target="_blank" rel="noopener noreferrer">Instagram</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-center my-2">
                                        <i class="fa fa-linkedin"></i>
                                    </div>
                                    <div class="col-md-9 my-2">
                                        <a class="text-white" href="https://www.linkedin.com" target="_blank" rel="noopener noreferrer">Linked In</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-center mt-2">
                                        <i class="fa fa-github"></i>
                                    </div>
                                    <div class="col-md-9 mt-2">
                                        <a class="text-white" href="https://www.github.com" target="_blank" rel="noopener noreferrer">Git Hub</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer"></div>
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

                $(".admin-navbar").hide();
                $(".cat").hide();
                $(".newpost").hide();



            });
        </script>
    </body>
</html>
