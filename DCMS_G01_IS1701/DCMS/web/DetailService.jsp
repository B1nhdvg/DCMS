<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Detail</title>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            /* Service Details */
            header {
                background-color: #007bff;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            h1 {
                margin: 0;
                font-size: 28px;
                padding-bottom: 10px;
                border-bottom: 1px solid #ccc;
            }

            main {
                padding: 20px;
            }

            .service-details {
                display: flex;
                align-items: center;
                background-color: #f8f8f8;
                border-radius: 4px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
            }

            .service-image {
                width: 400px;
                height: 400px;
                object-fit: cover;
                border-radius: 4px;
            }

            .service-description {
                flex: 1;
            }

            .service-description p {
                margin: 0 0 10px;
                font-size: 16px;
                line-height: 1.6;
            }

            .service-description strong {
                font-weight: bold;
            }

            .service-cost {
                font-size: 24px;
                font-weight: bold;
                margin-top: 20px;
            }

        </style>

    </head>
    <body>
        <jsp:include page="Navbar.jsp" />
        <header><h1>Detail of Service</h1></header>
        <main>
            <div class="container mt-5">
                <div class="row">

                    <div class="col-md-6">
                        <div class="mb-3">
                            <img class="service-image" src="${service.image}" alt="Service Image">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h2>${service.name}</h2>
                            <p  class="form-control"><strong>Description</strong>: ${service.description}</p>
                            <p  class="service-cost">Price: ${service.cost} USD</p>
                        </div>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                        <button type="button" onclick="location.href = 'pagingservice'" class="btn btn-secondary">Back</button>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
