<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="/css/styles.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
    integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
</head>
<body>
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    
    <jsp:include page="aside.jsp"></jsp:include>
    
     <div class="body-wrapper">
     
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="indexdb.jsp"></jsp:include>
    </div>
    </div>


<script src="/libs/jquery/dist/jquery.min.js"></script>
  <script src="/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/js/sidebarmenu.js"></script>
  <script src="/js/app.min.js"></script>
  <script src="/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="/libs/simplebar/dist/simplebar.js"></script>
  <script src="/js/dashboard.js"></script>
</body>
</html>