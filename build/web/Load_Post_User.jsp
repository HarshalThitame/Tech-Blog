<%@page import="com.techblogs.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.techblogs.entities.Post"%>
<%@page import="com.techblogs.helper.ConnectionProvider"%>
<%@page import="com.techblogs.dao.PostDao"%>
<%@page import="com.techblogs.dao.LikeDao"%>


<div class="row">
    <%

        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int uid = Integer.parseInt(request.getParameter("uid"));
        List<Post> posts = null;

        posts = d.getPostByUserID(uid);
//            out.println(posts);

        for (Post p : posts) {
    %>
    <div class="col-md-4 mt-4">
        <div class="card baseBlock" style="min-height: 350px;">
            <div class="card-header bg-secondary text-white">
                <small class="mr-2">Title : </small>
                <b><%= p.getpTitle()%></b>
            </div>
            <div class="card-body">
                <small class="mr-2">Content : </small>

                <p class="p-text"><%= p.getpContent()%></p>
            </div>
            <div class="card-footer bg-secondary text-white" >

                <a href="Show_Blog_Page.jsp?post_id=<%= p.getPid()%>" class="float-left btn btn-outline-light btn-sm">Read More...</a>
                <!--<button name="updatebtn" value="<%= p.getPid()%>" class="btn btn-success btn-sm" data-toggle="modal" data-target="#posteditmodal">Update</button>-->
                <button id="" onclick="deletebtn(<%= p.getPid()%>)" class="float-right btn btn-danger btn-sm deletepost" >Delete</button>
            </div>
        </div>
    </div>
    <%
        }
    %>

</div>

