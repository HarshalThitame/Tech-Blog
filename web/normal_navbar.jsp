<%@page import="com.techblogs.entities.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblogs.entities.Category"%>
<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="com.techblogs.entities.User"%>
<%@page import="com.techblogs.dao.PostDao"%>
<%
    User user = (User) session.getAttribute("currentUser");

    Admin asession = (Admin) session.getAttribute("currentAdmin");

%>
<nav id="" class="user-navbar navbar navbar-expand-lg navbar-dark primary-background border-bottom border-dark">
    <a class="navbar-brand" href="index.jsp"><i class="fa fa-eercast fa-spin" style="font-size: 30px;"></i> Tech Blog</a> 
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="Profile.jsp"><i class="fa fa-home" style="font-size:18px;"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown active cat">
                <a class="nav-link dropdown-toggle" id="cat-dis" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-indent" style="font-size:18px;"></i>    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item c-link"   href="#!" onclick="getPosts(0, this)"> All Posts</a>

                    <%                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> list = postd.getAllCategories();
                        for (Category c : list) {
                    %>


                    <a class="dropdown-item c-link"  href="#!" onclick="getPosts(<%= c.getCid()%>, this)"><%= c.getName()%></a>

                    <%
                        }
                    %>
                </div>
            </li>
            

            <%
                if (user == null) {
            %>
            <li class="nav-item active">
                <a class="nav-link" href="Login_Page.jsp">
                    <span class="fa fa-user-circle"></span> &nbsp;Log in
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="Register_Page.jsp">
                    <span class="fa fa-user-plus"></span> &nbsp;Sign Up
                </a>
            </li>
            <%
            } else {
            %>
            <li class="nav-item active" >
                <a class="nav-link " href="UserProfile.jsp">
                    <span class="fa fa-user"></span> &nbsp;User Profile
                </a>
            </li>
            <li class="nav-item active newpost">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">
                    <i class="fa fa-plus-square-o" style="font-size: 20px;"></i>
                    New Post
                </a>
            </li>

            <%
                }
            %>
            
            <li class="nav-item active">
                <a class="nav-link" href="About_Us.jsp">
                    <i class="fa fa-phone" style="font-size:18px;"></i>
                    About Us
                </a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            
            <%
                if (user != null) {
            %>
            <a href="Profile.jsp" id="loginuser" class="btn text-white "> <span class="fa fa-user-circle fa-spin"></span> &nbsp;<%= user.getName()%></a>
            <a class="btn text-white" href="LogoutServlet">
                <span class="fa fa-sign-out"></span> &nbsp;Log out
            </a>
            <%

                }
            %>
        </form>
    </div>
</nav>

<!--end of user nav bar-->  









<!--admin nav bar-->  
<nav class="navbar navbar-expand-lg navbar-dark bg-dark border-bottom border-dark admin-navbar ">
    <a class="navbar-brand" href="Admin.jsp"><i class="fa fa-universal-access fa-spin" style="font-size: 30px" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;
Admin Panel</a> 
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="Admin.jsp"><i class="fa fa-home"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li id="" class=" nav-item dropdown active admincat">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-indent"></i>    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item c-link"  href="#!" onclick="getPosts(0, this)"> All Posts</a>

                    <%
                        ArrayList<Category> list1 = postd.getAllCategories();
                        for (Category c : list1) {
                    %>


                    <a class="dropdown-item c-link"  href="#!" onclick="getPosts(<%= c.getCid()%>, this)"><%= c.getName()%></a>


                    <%
                        }
                    %>
                </div>
            </li>
            <li class="nav-item active newcat">
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#add-cat-modal">
                    <i class="fa fa-plus-square-o"></i>
                    Add Category
                </a>
            </li>   
            <li class="nav-item active user">
                <a class="nav-link" href="User_Info.jsp">
                    <i class="fa fa-address-card-o"></i>
                    Users
                </a>
            </li>
            <li class="nav-item active usercat">
                <a class="nav-link" href="Category_Info.jsp">
                    <i class="fa fa-ioxhost"></i>
                    Category
                </a>
            </li>



        </ul>
        <form class="form-inline my-2 my-lg-0">
            <!--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>-->
            <%
                if (user != null) {
            %>
            <a href="Profile.jsp" id="loginuser" class="btn text-white "> <span class="fa fa-codiepie fa-spin"></span> &nbsp;<%= user.getName()%></a>
            <a class="btn text-white" href="LogoutServlet">
                <span class="fa fa-sign-out-alt"></span> &nbsp;Log out
            </a>
            <%
            } else if (asession != null) {
            %>
            <a href="Admin.jsp" id="loginadmin" class="btn text-white "> <span class="fa fa-life-saver fa-spin"></span> &nbsp;<%= asession.getaName()%></a>
            <a class="btn text-white" href="Logout_Admin">
                <span class="fa fa-sign-out-alt"></span> &nbsp;Log out
            </a>
            <%
                }
            %>
        </form>
    </div>
</nav>


<!--end f admin nav bar-->