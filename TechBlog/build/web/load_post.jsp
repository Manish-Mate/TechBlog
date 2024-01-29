<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import=" java.util.List" %>
<%@page import="java.io.File" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<div class="row">
    <%
    
    //    Thread.sleep(1000);
        PostDao d=new PostDao(ConnectionProvider.getConnection());
    
         int cid = Integer.parseInt(request.getParameter("cid"));
         int uid=Integer.parseInt(request.getParameter("uid"));
//         uid=-1;
            List<Post> posts = null;
            if(uid>=0)
            {
                        if (cid == 0) {
                            posts = d.getAllPosts(uid);
                        } else {
                            posts = d.getPostByCatId(cid,uid);
                        }
            }
            else
            {
                        if (cid == 0) {
                            posts = d.getAllPosts();
                        } else {
                            posts = d.getPostByCatId(cid);
                        }
            }

            if(posts.size()==0){
            out.println("<h3 class='display-3 text-center' style='color: #03a9f4; font-family: Arial, sans-serif; margin-top: 30px;'>No Posts in this Category</h3>");

            return;
        }
        for(Post p:posts)
        {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <div class="card-body card-body1">

                <img src="blog_pics/<%=p.getpPic()%>" class="card-img-top post-image" alt="...">
                <b><%= p.getpTitle()%></b>
                    <p class="post-content">
                        <% String content = p.getpContent(); %>
                        <%= content.length() <= 180 ? content : content.substring(0, 180) + "..." %> <!-- Display content up to 100 characters -->
                        <% if (content.length() > 180) { %> <!-- Only display 'Read More' link if content is longer than 100 characters -->
                            <span class="read-more" style="cursor: pointer; color: blue;" onclick="getId(<%= p.getPid() %>)">Read More</span>
                        <% } %>
                    </p>
<!--                 <pre class="full-post-code" style="display: none;"><%= p.getpCode() %></pre>-->
            </div>
            <div class="card-footer secondary-background">
                 <%
                            LikeDao ldo=new LikeDao(ConnectionProvider.getConnection());
                        %>
                
                <a href="#!" onclick="getId(<%= p.getPid()%>)"  class="btn btn-outline-light btn-sm" >Read More...</a>
                
                <a href="#!" onclick="doLike(<%= p.getPid()%>, <%= p.getUserId() %>, $(this).find('.like_counter'))" class="btn btn-outline-light btn-sm">
                        <i class="fa fa-thumbs-o-up"><span class="like_counter"><%=ldo.countLikeOnPost(p.getPid()) %></span> </i></a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span> </i></a>
            </div>
        </div>
    </div>


    <%
        }
    %>


</div>
<div id="displayPost">

</div>


<!--java script-->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type="text/javascript"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script  src=  https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js "></script>
<script>
    function getId(pid) {
        console.log("Clicked on Read More for post ID: " + pid);
        $.ajax({
            url: "viewPost.jsp",
            data: {postId: pid},
            success: function (data, textStatus, jqXHR) {
                $('#displayPost').html(data);
                // Make sure Bootstrap modal is available here
                $('#openPostModel').modal('show');
            }
        });
    }
</script>


