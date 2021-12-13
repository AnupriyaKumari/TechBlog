<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%-- 
    Document   : load_posts
    Created on : 11-Dec-2021, 2:32:01 pm
    Author     : ANUPRIYA
--%>
<style>
    .read-more{
        cursor: pointer;
    }
    .more-text{
        display: none;
    }
</style>

<div class="row">

    <%
        User user = (User) session.getAttribute("currentUser");
        //        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cId = Integer.parseInt(request.getParameter("cId"));
        List<Post> post = null;
        if (cId == 0) {
            post = d.getAllPost();

        } else {
            post = d.getPostByCatId(cId);
        }

        if (post.size() == 0) {
            out.println("<h2 class='display-3 text-center' >No Post in this Category..!</h2>");
        }

        for (Post p : post) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <div class="card-body">
                <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="image">   <!-- to show image -->
                <b><%= p.getpTitle()%></b>
                <p>Click on read post button to view the full post content.</p>
                <p class="more-text"><%= p.getpContent()%></p>
                <pre>codes</pre>
                <pre class="more-text"><%= p.getpCode()%></pre>
            </div>
            <div class="card-footer text-center">
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

                %>
                <a href="show_blog_page.jsp?post_id=<%= p.getpId()%>" class="btn btn-outline-primary btn-sm read-more">Read Post...</a>
<!--                        <a href="#" onclick="doLike(<%= p.getpId()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm "><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getpId())%></span></a>
                <a href="#" class="btn btn-outline-primary btn-sm "><i class="fa fa-commenting-o"></i><span>20</span></a>-->
            </div>

        </div>
    </div>


    <%

        }


    %>
</div>

