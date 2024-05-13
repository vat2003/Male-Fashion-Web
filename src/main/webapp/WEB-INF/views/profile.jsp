<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Profile Setting</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- STYLE CSS -->
    <link rel="stylesheet" href="/css/profile.css" type="text/css">
    
    <style type="text/css">
    .error{
    color: red
    }
    </style>
</head>

<body>
<div class="wrapper" style="background-image: url('/img/Song-Kang-For-Vogue-Korea-Magazine-March-Issue-Behind-Shooting-Scene-part1-10.jpg');">
    <div class="inner">
        <div class="image-holder">
            <img src="/img/EwHNPugVoAE1_nM.jpg" alt="">
        </div>
        <form:form method="post" modelAttribute="user_profile" action="/asm/account/profile/${user_profile.userID}">
            <h3>PROFILE</h3>
            <input type="hidden" name="userID" value="${user.userID}">
            <div class="form-wrapper">
                <form:input path="fullname" placeholder="Fullname" class="form-control"/>
                <i class="zmdi zmdi-account"></i>
                <form:errors path="fullname" cssClass="error"/>
            </div>
            <div class="form-wrapper">
                <form:input path="address" placeholder="Address" class="form-control"/>
                <i class="fa-solid fa-location-dot"></i>
                <form:errors path="address" cssClass="error"/>
            </div>
            <div class="form-wrapper">
                <form:input path="email" placeholder="Email Address" class="form-control"/>
                <i class="zmdi zmdi-email"></i>
                <form:errors path="email" cssClass="error"/>
            </div>
            <div class="form-wrapper">
                <form:input path="phoneNum" placeholder="Phone Number" class="form-control"/>
                <i class="fa-solid fa-phone"></i>
                <form:errors path="phoneNum" cssClass="error"/>
            </div>
            <div class="form-wrapper">
                <form:input path="birthday" placeholder="Birthday" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date" />
                <!-- <i class="fa-solid fa-cake-candles"></i> -->
               
            </div>
            <div class="form-wrapper">
                <a href="/asm/index" style="text-decoration: none; color: black">Go back to the shop
                <i class="zmdi zmdi-arrow-left"></i>
                </a>
            </div>
            <button type="submit">Update
                <i class="zmdi zmdi-arrow-right"></i>
            </button>
        </form:form>
    </div>
</div>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
