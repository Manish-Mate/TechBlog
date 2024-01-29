<%-- 
    Document   : Error_page
    Created on : 15-Dec-2023, 6:52:00 pm
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something Went wrong</title>
         <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/mystyle.css" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>
    </head>
    <body>
        
        <div class="text-center">
                 <img src="img/error2.png" class="img-fluid " style="width: 400px; height: 400px;"/>
                 <br>
                 <%= exception%>
                 <h3>Sorry! Something Went Wrong</h3>
                 <a href="index.jsp" class="btn btn-lg text-white secondary-background mt-3">Home</a>
        </div>
        
    </body>
</html>
