<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.dao.UserDao" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="java.util.List" %>
<%@page import="java.io.File" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Post" %>


<%@page errorPage="Error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<%
   int postId = Integer.parseInt(request.getParameter("postId")); 

    PostDao d=new PostDao(ConnectionProvider.getConnection());
     Post p=d.getPostByPostId(postId);
%>

<!-- Modal -->
<div class="modal fade" id="openPostModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <!-- Modal content structure here -->
    <div class="modal-dialog ">
        <!-- Modal content goes here -->
        <!-- For example: -->
        <div class="modal-content">
            <div class="modal-header secondary-background text-white">
                <h4 class="post-title"><%=p.getpTitle()%></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <img src="blog_pics/<%=p.getpPic()%>" class="card-img-top my-2" alt="...">
                <div class="row my-3 row-user">
                    <div class="col-md-8 ">
                        <%
                            UserDao ud= new UserDao(ConnectionProvider.getConnection());
                            
                        %>
                        <p class="post-user-info"> <a href="#!"><%=ud.getUserByPostId(p.getUserId()).getName() %></a>  Has Posted</p>
                    </div>
                    <div class="col-md-4">
                        <p class="post-date"><%= p.getpDate().toLocaleString() %></p>
                    </div>
                </div>

                <p class="post-content"><%=p.getpContent()%></p>
                <br>
                <br><!-- comment -->
                <div class="post-code">
                    <pre><%=p.getpCode()%></pre>
                </div>
            </div>
            <div class="modal-footer secondary-background">
                <div class="row w-100">
                    <div class="col-md-8">
                        <%
                            LikeDao ldo=new LikeDao(ConnectionProvider.getConnection());
                        %>
                        <a href="#!" onclick="doLike(<%= p.getPid()%>, <%= p.getUserId() %>, $(this).find('.like_counter'))" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like_counter"><%=ldo.countLikeOnPost(p.getPid()) %></span></i></a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
                    </div>
                    <div class="col-md-4 text-right">
                        <button  type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <!-- Add other modal buttons if needed -->
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

             
