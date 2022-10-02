<%@page import="com.techblogs.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.techblogs.entities.Post"%>
<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="com.techblogs.dao.PostDao"%>
<%@page import="com.techblogs.dao.LikeDao"%>


<div class="row">
    <%

        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {

            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        if (posts.size() == 0) {
    %>
    <img class="card-img" src="img/nopost.png"  alt="alt"/>
 
    <%
            return;
        }
        for (Post p : posts) {
    %>
    <div class="col-md-4 mt-2">
        <div class="card baseBlock">
            <img class="card-img-top" style="height: 200px;background-size: cover" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
            <div class="card-header">
                <b><%= p.getpTitle()%></b>
            </div>
            <div class="card-body">
                <p class="p-text"><%= p.getpContent()%></p>
            </div>
            <div class="card-footer primary-background text-center" >

                <a href="Show_Blog_Page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>

            </div>
        </div>
    </div>
    <%
        }
    %>

</div>