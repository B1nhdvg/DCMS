<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Page Title</title>

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>


            /* Định dạng cho bảng dữ liệu */
            .table {
                width: 100%;
                border-collapse: collapse;
            }

            .table th,
            .table td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }

            /* Định dạng cho nút chức năng */
            .btn {
                display: inline-block;
                padding: 6px 12px;
                margin-bottom: 0;
                font-size: 14px;
                font-weight: 400;
                line-height: 1.42857143;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
                cursor: pointer;
                user-select: none;
                border: 1px solid transparent;
                border-radius: 4px;
            }

            .btn-primary {
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-danger {
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545;
            }



            .search-form {
                display: flex;
                justify-content: flex-end;
            }

            .input-group {
                display: flex;
                align-items: center;
            }

            .input-group .form-control {
                width: 300px;
                border-top-right-radius: 0;
                border-bottom-right-radius: 0;
            }

            .input-group .btn {
                border-top-left-radius: 0;
                border-bottom-left-radius: 0;
            }

            .btn-primary {
                margin-left: 10px;
            }

            .btn-primary i {
                vertical-align: middle;
            }

            /* Định dạng cho ô input tìm kiếm */
            .input-group {
                display: flex;
                max-width: 500px;
            }


            .form-control {
                flex: 1;
                border-radius: 4px;
                padding: 8px;
                border: 1px solid #ddd;
                width: 200px;
            }

            .form-control::placeholder {
                color: #999;
            }

            .form-control:focus {
                outline: none;
                box-shadow: 0 0 5px #ddd;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: dodgerblue;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
            }

            .search-service {
                display: flex;
                justify-content: center; /* Canh giữa theo chiều ngang */
                align-items: center; /* Canh giữa theo chiều dọc */
                margin-bottom: 20px;
            }


        </style>
        <jsp:useBean id="a" class="DAO.service.serviceDAO" scope="request"></jsp:useBean>
        </head>
        <body>

        <jsp:include page="Navbar.jsp" />


        <div class="search-service">
            <form action="#" method="post" class="search-form">
                <div class="input-group">
                    <input oninput="searchByServiceName(this)" type="text" name="search" class="form-control" placeholder="Type search keyword" value="${param.search}">
                    <input type="submit" value="Search">
                </div>
            </form>
        </div>

        <!--Service Table--> 
        <div class="container mt-4">
            <div class="row">
                <div id="content" class="row">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Ordinal numbers</th>
                                <th>Service Name</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Cost</th> 
                                <c:if test ="${sessionScope.userLogged.roleId == 1}">
                                <th>Functions</th>
                                </c:if>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listS}" var="x" varStatus="status">
                                <tr>
                                    <td>${status.index+1}</td>
                                    <td><a href="detailservice?sid=${x.id}" >${x.name}</a></td>
                                    <td style="width: 300px;
                                        display: -webkit-box;
                                        max-height: 80px;
                                        -webkit-box-orient: vertical;
                                        overflow: hidden;
                                        text-overflow: ellipsis;
                                        white-space: normal;
                                        -webkit-line-clamp: 1;
                                        line-height: 30px;
                                        border: 0px;">${x.description}</td>
                                    <td><img style="width: 100px; height: 100px" src="${x.image}" alt="alt"/></td>
                                    <td>${x.cost} USD</td>            
                                    <c:if test ="${sessionScope.userLogged.roleId == 1}">
                                        <td>
                                        <a href="updateservice?sid=${x.id}" class="btn btn-sm btn-primary">Update</a>
                                        <button type="button" class="btn btn-sm btn-danger" onclick="showDeleteModal(${x.id})">Delete</button>
                                    </td>
                                    </c:if>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                        <nav aria-label="...">
                            <ul class="pagination">
                                <c:forEach begin="1" end="${a.numberPage}" var="i">
                                    <li class="page-item ${aindex==i?"active":""}"><a class="page-link" href="pagingservice?aindex=${i}">${i}</a></li>
                                    </c:forEach>
                            </ul>
                        </nav>
                </div>
            </div>
            <c:if test ="${sessionScope.userLogged.roleId == 1}">
                <a href="addservice" class="btn btn-primary">Create Service</a>
            </c:if>

        </div>
        <!-- Delete Confirmation Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation</h5>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this Service?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" onclick="deleteService()">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
<script>
        var serviceIdToDelete = null;

        function showDeleteModal(serviceId) {
            serviceIdToDelete = serviceId;
            $('#deleteModal').modal('show');
        }

        function deleteService() {
            if (serviceIdToDelete) {
                window.location.href = 'deleteservice?sid=' + serviceIdToDelete;
            }
        }
   
        function searchByServiceName(param) {
            var search = param.value;
            $.ajax({
                url: "/DCMS/searchservice",
                type: "get", //send it through get method
                data: {
                    search: search
                },
                success: function (data) {
                    var row = document.getElementById("content");
                    row.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="lib/twentytwenty/jquery.event.move.js"></script>
    <script src="lib/twentytwenty/jquery.twentytwenty.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</html>
