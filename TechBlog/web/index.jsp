<%-- 
    Document   : index
    Created on : 13-Dec-2023, 10:03:12 pm
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="java.util.ArrayList" %>


<%@page errorPage="Error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");
   

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/mystyle.css" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
             .card-body1 {
        height: 400px; /* Set a fixed height for the cards */
    }
            .post-image {
        height: 200px; /* Adjust the height as per your requirement */
        object-fit: cover; /* Maintain aspect ratio and cover the container */
    }
            .post-title{

/*                font-size:30px;*/
            }
            .post-content{
               
/*                font-size: 25px;*/
            }
            .post-code{
                
            }
            .post-date{
                font-style: italic;
                font-weight:bold;
                
            }
            .post-user-info{
                font-size:20px;
                
            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }
        </style>
    </head>
    <body>

        <!--navbar-->
        
        <%
             if (user == null) {%>
<!--//        response.sendRedirect("login_page.jsp");-->
         <%@include file="Normal_navbar.jsp" %>
          <%  }
            else{
           %>
            <%@include file="profile_navbar.jsp" %>
           <%}%>
        
        
       

        <!--banner-->
        <div class="container-fluid p-0 m-0 ">
            <div class="jumbotron secondary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to Tech Blog </h3>

                    <p>Welcome to technical blog, world of technology
                        A programming language is a way for programmers (developers) to communicate with computers. Programming languages consist of a set of rules that allows string values to be converted into various ways of generating machine code, or, in the case of visual programming languages, graphical elements.
                    </p>
                    <% if(user==null){%>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start! its Free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
                    <% }else{ %>
                    <br><!-- comment -->
                    <br><!-- comment -->
                     <% } %>
                     <br>
                     <br>
                </div>
            </div>

        </div>
        <br>

        <!--main body of page-->
        
        <br>
        <main>
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4 ">
                        <!--list of categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,-1, this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
                                All Posts
                            </a>

                            <%
                                PostDao d=new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1=d.getAllCategories();
                                
                                for(Category cc:list1)
                                {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>,-1, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%    
                                }
                            %>
                        </div>
                    </div>
                    <div class="col-md-8" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-3">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--end main body-->

        <!--java script-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" 
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>


        </script>

        <script>
            function getPosts(catId,uId ,temp) {
                $('#loader').show();
                $('#post-container').hide();
                $(".c-link").removeClass('active');
                $.ajax({
                    url: "load_post.jsp",
                    data: {cid: catId, uid: uId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    }

                });
            }
            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0];
                getPosts(0,-1, allPostRef);
            });

        </script>

    </body>
</html>
