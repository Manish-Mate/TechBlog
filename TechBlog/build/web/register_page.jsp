<%-- 
    Document   : register_page
    Created on : 14-Dec-2023, 5:02:07 pm
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
       
        <%@include file="Normal_navbar.jsp" %>
        
        <main class="secondary-background  banner-background" style="padding-bottom: 80px;">
            <div class="container">
                
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-2x fa-user-circle"></span>
                                <br>
                                Register Here
                            </div>
                            <div class="card-body">
                                
                                <form id="reg-form" action="RegisterServlet" method="POST">
                                    <div class="form-group">
                                      <label for="user_name">User Name</label>
                                      <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                     
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                      <label for="gender">Select Gender</label>
                                      <br>
                                      <input type="radio"  id="gender" name="gender" value="male">Male
                                      <input type="radio"  id="gender" name="gender" value="female">Female
                                    </div>
                                    <div class="form-group">
                                        
                                        <textarea name="about" class="form-control" id=""  rows="5" placeholder="Enter something about yourself"></textarea> 
                                    </div>
                                    
                                    <div class="form-check">
                                      <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                      <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                    </div>
                                    <br>
                                    <div id="loader" class="container text-center" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <<h4>Please wait...</h4>
                                    </div>
                                    <br>
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </form>
                                
                            </div>
                           
                        </div>
                    </div>
                </div>
                
            </div>
        </main>
        
        
        
        
        
        
        
        
           <!--java script-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" 
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    
        $(document).ready(function(){
            console.log("loaded");
            
             $('#reg-form').on('submit', function(event){
            event.preventDefault();
            
            let form = new FormData(this);
            
            $("#submit-btn").hide();
            $("#loader").show();
            
            
            $.ajax({
                url: "RegisterServlet",
                type: 'POST',
                data: form,
                success: function(data, textStatus, jqXHR){
                    console.log(data);
                    $("#submit-btn").show();
                    $("#loader").hide();
                    if(data.trim()=='done')
                    {
//                    use this website https://sweetalert.js.org/guides/
                     swal({
                            title: "Registered successfully",
                            
                            icon: "success",
                            button: "Login Page",
                          })
                        .then((value) => {
                          window.location="login_page.jsp"
                        });
                    }
                    else if(data.trim()=='error')
                    {
                        swal({
                        title: "Please complete all the fields",
                        icon: "warning",
                        button: "Try Again"
                        });
                    }
                    else{
                       
                     swal({
                        title: data,
                        icon: "info",
                        button: "try again"
                        });
                
                    }
                    
                },
                error: function(jqXHR, textStatus, errorThrown){
                    $("#submit-btn").show();
                    $("#loader").hide();
                  
                     swal({
                        title: "Something Went Wrong",
                        icon: "error",
                        button: "try again"
                        });
                },
                processData: false,
                contentType: false 
            });
        });
        });
    
</script>

    </body>
</html>
