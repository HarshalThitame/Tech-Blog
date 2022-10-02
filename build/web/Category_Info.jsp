<%-- 
    Document   : User_Info
    Created on : 13-Sep-2022, 5:28:48 PM
    Author     : harshal
--%>

<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.techblogs.dao.UserDao"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                background: url(img/bg3.jpg );
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <div class="container">
            <div class="text-center my-4">
                <h4>Category Information</h4>
            </div>
            <table class="table">
                <thead>
                    <tr class="bg-dark text-white">
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Action</th>

                    </tr>
                </thead>
                <tbody>
                    <% PostDao post = new PostDao(ConnectionProvider.getConnection());
                        List<Category> catlist = post.getAllCategories();
                        for (Category c : catlist) {
                    %>
                    <tr>

                        <th scope="row"><%= c.getCid()%></th>
                        <td><%= c.getName()%></td>
                        <td><%= c.getDescription()%></td>
                        <td><button id="" onclick="deletebtn(<%= c.getCid()%>)" class=" btn btn-danger btn-sm deletepost" >Delete</button>

                            <%
                                }
                            %>
                    </tr>
                </tbody>
            </table>
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


                            });
        </script>
        <script>

            function deletebtn(catid)
            {
                //    console.log(pid+ " , "+uid);


                const d = {
                    catid: catid
                }

                $.ajax({
                    url: "CategoryDeleteServlet",
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
    </body>
</html>
