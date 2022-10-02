<%@page import="com.techblogs.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.techblogs.entities.Post"%>
<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="com.techblogs.dao.PostDao"%>
<%@page import="com.techblogs.dao.LikeDao"%>


<div class="row">
    <%

        User u = (User) session.getAttribute("currentUser");
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

    <%            return;
        }
        for (Post p : posts) {
    %>
    <div class="col-md-3 mt-4">
        <div class="card baseBlock" style="min-height: 500px;">
            <img class="card-img-top" style="height: 200px;background-size: cover" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p class="p-text"><%= p.getpContent()%></p>
            </div>
            <div class="card-footer primary-background text-center" >
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

                %>
                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= u.getId()%>)" class="btn btn-outline-light btn-sm "><i class="far fa-thumbs-up"></i><span class="like-counter"> <%= ld.countLikeOnPost(p.getPid())%></span></a>
                <a href="Show_Blog_Page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="far fa-comment-alt"></i><span> 20</span></a>
            </div>
        </div>
    </div>
    <%
        }
    %>

</div>