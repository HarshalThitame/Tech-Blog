<%-- 
    Document   : Admin
    Created on : 12-Sep-2022, 11:57:27 PM
    Author     : harshal
--%>

<%@page import="com.techblogs.entities.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblogs.entities.Category"%>
<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="com.techblogs.dao.PostDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Admin admin = (Admin) session.getAttribute("currentAdmin");

    if (admin == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                background: url(img/bg4_2.jpg );
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>

        <main>
            <div class="container" >
                <div class="row mt-4">
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



        <!--add category modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-cat-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-cat-form" action="AddCategoryServlet" method="post">

                            <div class="form-group">
                                <input name="cName" id="cName" required type="text" placeholder="Enter Category Name" class="form-control"/>
                            </div>    
                            <div class="form-group">
                                <textarea name="cDescription" required id="cDescription" class="form-control" rows="5" placeholder="Enter Description..."></textarea>
                            </div>    


                            <div class="container text-center">
                                <button type="submit"  class="btn btn-outline-primary">Add Category</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--end of category modal-->




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


            });
        </script>

        <script>

            function  getPosts(catId, temp) {
                $('#loader').show();
                $('#post-container').hide();

                $(".c-link").removeClass('active')

                $.ajax({
                    url: "Load_Post_Admin.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {

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

        <!--delete post-->
        <script>

            function deletebtn(postid)
            {
//    console.log(pid+ " , "+uid);


                const d = {
                    postid: postid
                }

                $.ajax({
                    url: "PostDeleteServlet",
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        if (data.trim() == 'done')
                        {
                            swal("Deleted !", "Successfully Deleted !!!", "warning")
                                    .then((value) => {
                                        location.reload();
                                    });

                        } else
                        {
                            swal("Sorry!", "Something went wrong !!!", "Error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Sorry!", "Something went wrong !!!", "Error");
                    }

                })
            }
        </script>

        <!--add category js-->

<!--        <script>
            $(document).ready(function ()
            {
                console.log("page is ready..")

                $("#add-cat-form").on('submit', function (event)
                {
                    event.preventDefault();

                    //                    var f = $(this).serialize();
                    let f = new FormData(this);

                    console.log(f);

                    

                    $.ajax({
                        url: "AddCategoryServlet",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success...");
                            $(".loader").hide();
                            $(".form").show();
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
                            console.log(data);

                            swal("Sorry!", "Something went wrong !!!", "Error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>-->


    </body>
</html>
