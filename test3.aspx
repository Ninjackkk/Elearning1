<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test3.aspx.cs" Inherits="Elearning1.test3" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Educational Website</title>
<style>
    /* Reset default margin and padding */
    body, html {
        margin: 0;
        padding: 0;
    }

    /* Basic styling for header */
    header {
        background-color: #333;
        color: #fff;
        padding: 10px 0;
        text-align: center;
    }

    /* Navigation links */
    nav {
        margin-top: 10px;
    }

    nav a {
        color: #fff;
        text-decoration: none;
        margin: 0 10px;
    }

    /* Main content section */
    .main-content {
        padding: 20px;
        text-align: center;
    }

    .main-content h1 {
        font-size: 2em;
    }

    .main-content p {
        font-size: 1.2em;
        line-height: 1.6;
    }

    /* Image slider styles */
    .slider {
        max-width: 1000px;
        margin: 20px auto;
        position: relative;
        overflow: hidden;
    }

    .slides {
        display: flex;
        transition: transform 0.5s ease;
    }

    .slide {
        min-width: 100%;
        flex: 0 0 auto;
    }

    /* Footer */
    footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px 0;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>
</head>
<body>

<header>
    <h1>Educational Website</h1>
    <nav>
        <a href="#">Home</a>
        <a href="#">Courses</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
    </nav>
</header>

<section class="main-content">
    <h1>Welcome to our Educational Platform</h1>
    <p>Explore our wide range of courses and enhance your knowledge.</p>

    <!-- Image Slider -->
    <div class="slider">
        <div class="slides">
            <div class="slide"><img src="~/images/slider1.jpg" alt="Slide 1"></div>
            <div class="slide"><img src="file:///C:/Users/usaama/Desktop/Elearning/images/slider2.jpg" alt="Slide 2"></div>
            <div class="slide"><img src="file:///C:/Users/usaama/Desktop/Elearning/images/slider3.jpg" alt="Slide 3"></div>
            <!-- Add more slides as needed -->
    </div>
</section>

<footer>
    <p>&copy; 2024 Educational Website. All rights reserved.</p>
</footer>

<script>
    // JavaScript for image slider functionality
    const slides = document.querySelector('.slides');
    const slideWidth = document.querySelector('.slide').clientWidth;
    let slideIndex = 0;

    function showSlide(index) {
        slides.style.transform = `translateX(-${slideWidth * index}px)`;
    }

    function nextSlide() {
        if (slideIndex < slides.children.length - 1) {
            slideIndex++;
        } else {
            slideIndex = 0;
        }
        showSlide(slideIndex);
    }

    function prevSlide() {
        if (slideIndex > 0) {
            slideIndex--;
        } else {
            slideIndex = slides.children.length - 1;
        }
        showSlide(slideIndex);
    }

    setInterval(nextSlide, 3000); // Auto slide every 3 seconds
</script>

</body>
</html>
