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
            max-width: 200%;
            max-height: 400px;
            object-fit: contain;
        }
    </style>
</head>
<body>
    <jsp:include page="Navbar.jsp" />
    <div class="container mt-5">
        <h1 class="mb-4">Add Service</h1>
        <form action="addservice" method="post">
            <div class="row">
                <div class="col-md-6">
                  
                    <div class="mb-3">
                        <label for="name">Name:</label>
                        <div class="position-relative">
                            <input type="text" name="name" id="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="url">Image URL:</label>
                        <div class="position-relative">
                            <input type="url" name="image" id="image" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="cost">Cost:</label>
                        <div class="position-relative">
                            <input type="text" name="cost" id="cost" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="description">Description:</label>
                        <div class="position-relative">
                            <textarea name="description" id="description" class="form-control" rows="4" maxlength="1000" required></textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="imagePreview">Preview Image:</label>
                        <div class="position-relative">
                            <img id="imagePreview" src="#" alt="Image Preview" class="img-fluid" style="display: none;">
                        </div>
                    </div>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">Create</button>
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Notification</h5>
                                </div> 
                                <div class="modal-body">
                                    Do you want to create this service?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Confirm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" onclick="location.href = 'pagingservice'" class="btn btn-secondary">Cancel</button>
                </div>
            </div>
        </form>
    </div>
    <script>
        // JavaScript code to display the selected image preview
        const imageInput = document.getElementById('image');
        const imagePreview = document.getElementById('imagePreview');

        imageInput.addEventListener('input', () => {
            const imageUrl = imageInput.value;

            if (imageUrl) {
                imagePreview.src = imageUrl;
                imagePreview.style.display = 'block'; // Show the image preview
            } else {
                imagePreview.src = '#';
                imagePreview.style.display = 'none'; // Hide the image preview
            }
        });
    </script>
</body>
</html>
