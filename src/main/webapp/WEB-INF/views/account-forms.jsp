<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/styles.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
    integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
      <!-- Sidebar scroll-->
      <jsp:include page="aside.jsp"></jsp:include>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <header class="app-header">
        <jsp:include page="header.jsp"></jsp:include>
      </header>
      <!--  Header End -->
      <div class="container-fluid">
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title fw-semibold mb-4">ACCOUNT MANAGEMENT</h5>
              <div class="card">
                <div class="card-body">
                  <form:form modelAttribute="acc" method="post" action="/saveAccount">
					    <div class="mb-3">
					        <label for="id" class="form-label">User ID : ${acc.userID}</label>
					        <form:input type="hidden" class="form-control" path="userID" id="id" placeholder="PS25732" />
					       
					    </div>
					    <div class="mb-3">
					        <label for="fullname" class="form-label">Fullname</label>
					        <form:input type="text" class="form-control" path="fullname" id="fullname" placeholder="Johny Kim" />
					        <form:errors path="fullname" cssClass="text-danger"/>
					    </div>
					    <div class="mb-3">
					        <label for="email" class="form-label">Email</label>
					        <form:input type="text" class="form-control" path="email" id="email" placeholder="abc@gmail.com" />
					        <form:errors path="email" cssClass="text-danger"/>
					        <span class="text-danger">${msg}</span>
					    </div>
					    <div class="mb-3">
					        <label for="phoneNum" class="form-label">Phone Number</label>
					        <form:input type="text" class="form-control" path="phoneNum" id="phoneNum" placeholder="03289698785" />
					        <form:errors path="phoneNum" cssClass="text-danger"/>
					    </div>
					    <div class="mb-3">
					        <label for="address" class="form-label">Address</label>
					        <form:input type="text" class="form-control" path="address" id="address" placeholder="Ho Chi Minh city" />
					        <form:errors path="address" cssClass="text-danger"/>
					    </div>
					    <div class="mb-3">
					        <label for="birthday" class="form-label">Birthday</label>
					        <form:input type="date" class="form-control" path="birthday" id="birthday" value="${currentDate}"  />
					        <form:errors path="birthday" cssClass="text-danger"/>
					    </div>
					    <div class="mb-3 d-flex justify-content-start">
					        <label class="form-label">Role:</label>
					        <div class="form-check ">
					            <form:radiobutton path="role" id="admin" value="true" />
					            <label class="form-check-label" for="admin">Admin</label>
					        </div>
					        <div class="form-check ">
					            <form:radiobutton path="role" id="customer" value="false" />
					            <label class="form-check-label" for="customer">Customer</label>
					        </div>
					    </div>
					    <button type="submit" class="btn btn-primary" formaction="/dashboard/account/CU">Save</button>
					    <button type="submit" class="btn btn-danger"  formaction="/dashboard/account/delete/${acc.userID}">Delete</button>
					    <button type="submit" class="btn btn-success" formaction="/dashboard/account">Reset</button>
					</form:form>

                </div>
              </div>

            </div>
          </div>
        </div>
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title fw-semibold mb-4">ACCOUNT LIST</h5>
              <div class="card">
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table text-nowrap mb-0 align-middle">
                      <thead class="text-dark fs-4">
                        <tr>
                          <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Id</h6>
                          </th>
                          <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Fullname</h6>
                          </th>
                          <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Email</h6>
                          </th>
                
                          <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">PhoneNum</h6>
                          </th>
                          <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Role</h6>
                          </th>
                          <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Actions</h6>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="item" items="${listUser}">
                        <tr>
                        
                          
                          <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-1">${item.userID}</h6>
							                        
                          </td>
                          
                              <td class="border-bottom-0">
                            <p class="mb-0 fw-normal">${item.fullname}</p>
                          </td>
                          
                          
                          <td class="border-bottom-0">
                            <p class="mb-0 fw-normal">${item.email}</p>
                          </td>
                          
               
                          
                              <td class="border-bottom-0">
                            <p class="mb-0 fw-normal">${item.phoneNum}</p>
                          </td>
                          
                          
                             <td class="border-bottom-0">
                            <p class="mb-0 fw-normal">${item.role ? 'Admin' : 'Customers'}</p>
                          </td>
                          
                          <td class="border-bottom-0">
                            <a href="/dashboard/account/edit/${item.userID}" class="btn btn-outline-primary fw-semibold mb-0 fs-4">Edit</a>
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
  <script src="/libs/jquery/dist/jquery.min.js"></script>
  <script src="/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/js/sidebarmenu.js"></script>
  <script src="/js/app.min.js"></script>
  <script src="/libs/simplebar/dist/simplebar.js"></script>
  
</body>

</html>