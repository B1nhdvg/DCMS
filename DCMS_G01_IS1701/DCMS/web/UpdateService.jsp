<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dental Website</title>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <style>
            #imagePreview {
                max-width: 100%;
                max-height: 400px;
                object-fit: contain;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp" />
        <c:if test="${not empty successMessage}">
            <div id="successMessage" class="alert alert-success" role="alert">
                ${successMessage}
            </div>
            <script>
                setTimeout(function () {
                    var successMessage = document.getElementById('successMessage');
                    successMessage.style.display = 'none';
                }, 4000); // 4000 milliseconds = 4 seconds
            </script>
            </c:if>
            <div class="container mt-5">
                <h1 class="mb-4">Update Service</h1>
                <form action="updateservice" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <div class="position-relative">
                                    <input value="${st.id}" type="text" name="id" id="id" class="form-control" required hidden>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label ><strong>Name:</strong></label>
                                <div class="position-relative">
                                    <input value="${st.name}" type="text" name="name" id="name" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label><strong>Image:</strong></label>
                                <div class="position-relative">
                                    <input value="${st.image}" type="text" name="image" id="image" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label ><strong>Cost:</strong></label>
                                <div class="position-relative">
                                    <input value="${st.cost}" type="text" name="cost" id="cost" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label ><strong>Description:</strong></label>
                                <div class="position-relative">
                                    <textarea name="description" id="description" class="form-control" rows="4" maxlength="1000" required>${st.description}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label><strong>Preview Image:</strong></label>
                                <div class="position-relative">
                                    <img id="imagePreview" src="#" alt="Image Preview" class="img-fluid" style="display: none;">
                                </div>
                            </div>
                        </div>
                        <!-- ...remaining code... -->
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                        <button type="submit" class="btn btn-primary me-md-2">Update Service</button>
                        <button type="button" onclick="location.href = 'pagingservice'" class="btn btn-secondary">Back</button>
                    </div>
                </form>
            </div>
        </body>
        <script>
            // JavaScript code to display the selected image preview
            const imageUrlInput = document.getElementById('image');
            const imagePreview = document.getElementById('imagePreview');

            function showImagePreview() {
                const image = imageUrlInput.value;
                if (image) {
                    imagePreview.src = image;
                    imagePreview.style.display = 'block'; // Show the image preview
                } else {
                    imagePreview.src = '#';
                    imagePreview.style.display = 'none'; // Hide the image preview
                }
            }

            // Call the showImagePreview function initially to display the preview
            showImagePreview();

            // Add an event listener to the imageUrlInput to update the preview whenever the input changes
            imageUrlInput.addEventListener('input', showImagePreview);

        </script>
    </html>
