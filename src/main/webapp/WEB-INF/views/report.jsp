<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/report.css" />

    <link rel="stylesheet" href="/css/styles.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
        integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
        crossorigin="anonymous">

</head>

<body>
  <!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
        data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <!-- Sidebar Start -->
        <jsp:include page="aside.jsp"></jsp:include>
        <!--  Sidebar End -->
        <!--  Main wrapper -->
        <div class="body-wrapper">
            <!--  Header Start -->
            <jsp:include page="header.jsp"></jsp:include>
            <!--  Header End -->
      <div class="container-fluid">
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
            <div class="mb-4 d-flex justify-content-between align-items-center">  
            <h5 class="card-title fw-semibold ">REPORT MANAGEMENT</h5>
          
             <a href="/dashboard/report/excel" onclick="excelalert()" >Export to Excel</a>
              
            </div>
           
              <div class="card">
                <div class="card-body">
                  <div class="tabs">
                    <div class="tab-4">
                      <label for="tab4-1">CATEGORY</label>
                      <input id="tab4-1" name="tabs-4" type="radio" checked="checked">
                      <div>
                        <div class="row">
                          <div class="table-responsive">
                            <table class="table text-nowrap mb-0 align-middle">
                              <thead class="text-dark fs-4">
                                <tr>
                                 <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">STT</h6>
                                  </th>
                                  <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Category</h6>
                                  </th>
                                  <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Total</h6>
                                  </th>
                                  <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Quantity </h6>
                                  </th>
                                  
                                </tr>
                              </thead>
                              <tbody>
                              <c:forEach var="item" items="${items}" varStatus="status">
                                <tr>
                                    <td class="border-bottom-0"><h6 class="fw-semibold mb-1">${status.index+1}</h6></td>
                                  <td class="border-bottom-0">
                                      <h6 class="fw-semibold mb-1">${item.groups}</h6>
                                                         
                                  </td>
                                  <td class="border-bottom-0">
                                  <span class="fw-semibold mb-1"><fmt:formatNumber>${item.sum} </fmt:formatNumber> </span> 
                                    
                                  </td>
                                  <td class="border-bottom-0">
                                    <div class="d-flex align-items-center gap-2">
                                      <p class=" fw-semibold mb-1">${item.count}</p>
                                    </div>
                                  </td>
                                  
                                </tr> 
                               </c:forEach>          
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>


                    <div class="tab-4">
                      <label for="tab4-2">TIMING</label>
                      <input id="tab4-2" name="tabs-4" type="radio">
                      <div>
                        <div class="container">
                          <div class="table-responsive">
                            <table class="table text-nowrap mb-0 align-middle">
                              <thead class="text-dark fs-4">
                              <tr>
                              
                                  <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">STT</h6>
                                  </th>
                                  <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Create Date</h6>
                                  </th>
                                  <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Total</h6>
                                  </th>
                                  <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Quantity </h6>
                                  </th>
                                  
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach var="item" items="${itemsByDate}" varStatus="status">
                                <tr>
                                  <td class="border-bottom-0"><h6 class="fw-semibold mb-1">${status.index+1}</h6></td>
                                  <td class="border-bottom-0">
                                      <h6 class="fw-semibold mb-1">${item.groups}</h6>
                                                         
                                  </td>
                                  <td class="border-bottom-0">
                                  <span class="fw-semibold mb-1">${item.sum}</span> 
                                    
                                  </td>
                                  <td class="border-bottom-0">
                                    <div class="d-flex align-items-center gap-2">
                                      <p class=" fw-semibold mb-1">${item.count}</p>
                                    </div>
                                  </td>
                                  
                                </tr> 
                               </c:forEach> 
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title fw-semibold mb-4">PRODUCTS</h5>
              <div class="card">
                <div class="card-body">

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <script src="/libs/jquery/dist/jquery.min.js"></script>
    <script src="/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/sidebarmenu.js"></script>
    <script src="/js/app.min.js"></script>
    <script src="/libs/simplebar/dist/simplebar.js"></script>
	<script>
    function excelalert(){
      alert("Export successfully");
    }
  </script>
</body>

</html>