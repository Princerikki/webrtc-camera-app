<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Website with Transitions</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            overflow-x: hidden;
        }

        /* Header with Parallax Effect */
        header {
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                        url('https://source.unsplash.com/random/1920x1080?nature') no-repeat center center;
            background-size: cover;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header-content {
            transform: translateY(0);
            transition: transform 0.5s ease-out;
            opacity: 1;
            transition: opacity 1s ease;
        }

        .header-content.hidden {
            transform: translateY(-50px);
            opacity: 0;
        }

        h1 {
            font-size: 4rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            transition: all 0.3s ease;
        }

        h1:hover {
            transform: scale(1.05);
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.7);
        }

        .subtitle {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        /* Navigation */
        nav {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            z-index: 1000;
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        nav.scrolled {
            background-color: rgba(40, 40, 40, 0.95);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .logo:hover {
            color: #4CAF50;
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin-left: 2rem;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            position: relative;
            transition: all 0.3s ease;
            padding: 0.5rem 0;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #4CAF50;
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .nav-links a:hover {
            color: #4CAF50;
        }

        .hamburger {
            display: none;
            cursor: pointer;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
        }

        /* Main Content */
        main {
            max-width: 1200px;
            margin: 0 auto;
            padding: 4rem 5%;
        }

        section {
            margin-bottom: 6rem;
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s ease-out, transform 0.6s ease-out;
        }

        section.visible {
            opacity: 1;
            transform: translateY(0);
        }

        h2 {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            color: #222;
            position: relative;
            display: inline-block;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 4px;
            background-color: #4CAF50;
            transition: width 0.3s ease;
        }

        h2:hover::after {
            width: 100%;
        }

        p {
            line-height: 1.6;
            margin-bottom: 1.5rem;
            font-size: 1.1rem;
        }

        /* Features Grid */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .feature-card {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            transform: scale(0.95);
            opacity: 0;
        }

        .feature-card.visible {
            transform: scale(1);
            opacity: 1;
        }

        .feature-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: #4CAF50;
            margin-bottom: 1.5rem;
        }

        .feature-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #333;
        }

        /* Gallery with Hover Effects */
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-top: 3rem;
        }

        .gallery-item {
            position: relative;
            border-radius: 8px;
            overflow: hidden;
            height: 250px;
            transition: all 0.3s ease;
            transform: scale(0.98);
            opacity: 0;
        }

        .gallery-item.visible {
            transform: scale(1);
            opacity: 1;
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .gallery-item:hover img {
            transform: scale(1.1);
        }

        .gallery-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: opacity 0.3s ease;
            color: white;
            padding: 1rem;
            text-align: center;
        }

        .gallery-item:hover .gallery-overlay {
            opacity: 1;
        }

        .gallery-title {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            transform: translateY(20px);
            transition: transform 0.3s ease;
        }

        .gallery-item:hover .gallery-title {
            transform: translateY(0);
        }

        .gallery-desc {
            transform: translateY(20px);
            transition: transform 0.3s ease 0.1s;
            opacity: 0.9;
        }

        .gallery-item:hover .gallery-desc {
            transform: translateY(0);
        }

        /* Testimonials Slider */
        .testimonials {
            position: relative;
            margin-top: 3rem;
            padding: 2rem 0;
            overflow: hidden;
        }

        .testimonial-slider {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .testimonial {
            min-width: 100%;
            padding: 2rem;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: all 0.3s ease;
        }

        .testimonial-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 1rem;
            border: 3px solid #4CAF50;
        }

        .testimonial-quote {
            font-style: italic;
            margin-bottom: 1rem;
            line-height: 1.6;
        }

        .testimonial-author {
            font-weight: bold;
            color: #4CAF50;
        }

        .slider-nav {
            display: flex;
            justify-content: center;
            margin-top: 2rem;
        }

        .slider-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #ddd;
            margin: 0 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .slider-dot.active {
            background: #4CAF50;
            transform: scale(1.2);
        }

        /* Contact Form */
        .contact-form {
            max-width: 600px;
            margin: 3rem auto 0;
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        input, textarea {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
        }

        textarea {
            min-height: 150px;
            resize: vertical;
        }

        .submit-btn {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 1rem 2rem;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .submit-btn:hover {
            background: #3e8e41;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        /* Footer */
        footer {
            background: #222;
            color: white;
            padding: 4rem 5% 2rem;
            text-align: center;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            text-align: left;
        }

        .footer-column h3 {
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
            position: relative;
            display: inline-block;
        }

        .footer-column h3::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 40px;
            height: 3px;
            background: #4CAF50;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 0.8rem;
        }

        .footer-links a {
            color: #bbb;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .footer-links a:hover {
            color: #4CAF50;
            padding-left: 5px;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .social-links a {
            color: white;
            background: #333;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            background: #4CAF50;
            transform: translateY(-3px);
        }

        .copyright {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 1px solid #444;
            color: #999;
            font-size: 0.9rem;
        }

        /* Back to Top Button */
        .back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background: #4CAF50;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            cursor: pointer;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
            z-index: 999;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .back-to-top.visible {
            opacity: 1;
            visibility: visible;
        }

        .back-to-top:hover {
            background: #3e8e41;
            transform: translateY(-5px);
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }

            .subtitle {
                font-size: 1.2rem;
            }

            .nav-links {
                position: fixed;
                top: 70px;
                left: -100%;
                width: 100%;
                height: calc(100vh - 70px);
                background: rgba(0, 0, 0, 0.9);
                flex-direction: column;
                align-items: center;
                padding-top: 2rem;
                transition: all 0.5s ease;
            }

            .nav-links.active {
                left: 0;
            }

            .nav-links li {
                margin: 1rem 0;
            }

            .hamburger {
                display: block;
            }

            .features {
                grid-template-columns: 1fr;
            }
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { 
                opacity: 0;
                transform: translateY(50px);
            }
            to { 
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-fadeIn {
            animation: fadeIn 1s ease forwards;
        }

        .animate-slideUp {
            animation: slideUp 0.8s ease forwards;
        }

        /* Loading Animation */
        .loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            transition: opacity 0.5s ease, visibility 0.5s ease;
        }

        .loader.hidden {
            opacity: 0;
            visibility: hidden;
        }

        .loader-circle {
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #4CAF50;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <!-- Loading Screen -->
    <div class="loader">
        <div class="loader-circle"></div>
    </div>

    <!-- Navigation -->
    <nav id="navbar">
        <div class="nav-container">
            <a href="#" class="logo">DynamicSite</a>
            <button class="hamburger">
                <i class="fas fa-bars"></i>
            </button>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#gallery">Gallery</a></li>
                <li><a href="#testimonials">Testimonials</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Header -->
    <header id="home">
        <div class="header-content">
            <h1 class="animate-slideUp">Welcome to Our Dynamic Website</h1>
            <p class="subtitle animate-slideUp" style="animation-delay: 0.2s">Experience stunning transitions and animations</p>
            <a href="#features" class="submit-btn animate-slideUp" style="animation-delay: 0.4s">Explore More</a>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <!-- Features Section -->
        <section id="features">
            <h2>Our Amazing Features</h2>
            <p>Discover what makes our website stand out from the crowd with these incredible features.</p>
            
            <div class="features">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-bolt"></i>
                    </div>
                    <h3 class="feature-title">Fast Performance</h3>
                    <p>Optimized for speed with lazy loading and efficient animations to ensure smooth user experience.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-mobile-alt"></i>
                    </div>
                    <h3 class="feature-title">Responsive Design</h3>
                    <p>Looks great on any device from desktop to mobile with adaptive layouts and touch-friendly elements.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-paint-brush"></i>
                    </div>
                    <h3 class="feature-title">Beautiful Animations</h3>
                    <p>Engaging transitions and micro-interactions that delight users without compromising performance.</p>
                </div>
            </div>
        </section>

        <!-- Gallery Section -->
        <section id="gallery">
            <h2>Photo Gallery</h2>
            <p>Check out our stunning collection of images with hover effects and smooth transitions.</p>
            
            <div class="gallery">
                <div class="gallery-item">
                    <img src="https://source.unsplash.com/random/600x400?nature" alt="Nature">
                    <div class="gallery-overlay">
                        <h3 class="gallery-title">Nature Beauty</h3>
                        <p class="gallery-desc">Explore the wonders of the natural world</p>
                    </div>
                </div>
                
                <div class="gallery-item">
                    <img src="https://source.unsplash.com/random/600x400?city" alt="City">
                    <div class="gallery-overlay">
                        <h3 class="gallery-title">Urban Life</h3>
                        <p class="gallery-desc">The vibrant energy of city living</p>
                    </div>
                </div>
                
                <div class="gallery-item">
                    <img src="https://source.unsplash.com/random/600x400?technology" alt="Technology">
                    <div class="gallery-overlay">
                        <h3 class="gallery-title">Modern Tech</h3>
                        <p class="gallery-desc">Innovation at your fingertips</p>
                    </div>
                </div>
                
                <div class="gallery-item">
                    <img src="https://source.unsplash.com/random/600x400?food" alt="Food">
                    <div class="gallery-overlay">
                        <h3 class="gallery-title">Delicious Cuisine</h3>
                        <p class="gallery-desc">A feast for your senses</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section id="testimonials">
            <h2>What Our Clients Say</h2>
            <p>Hear from our satisfied customers about their experiences with our services.</p>
            
            <div class="testimonials">
                <div class="testimonial-slider">
                    <div class="testimonial">
                        <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Client" class="testimonial-avatar">
                        <p class="testimonial-quote">"This website is absolutely stunning! The transitions are smooth and the overall experience is fantastic. Highly recommended!"</p>
                        <p class="testimonial-author">- Sarah Johnson</p>
                    </div>
                    
                    <div class="testimonial">
                        <img src="https://randomuser.me/api/portraits/men/45.jpg" alt="Client" class="testimonial-avatar">
                        <p class="testimonial-quote">"I've never seen such attention to detail in web design. The animations make the site feel alive and engaging."</p>
                        <p class="testimonial-author">- Michael Chen</p>
                    </div>
                    
                    <div class="testimonial">
                        <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Client" class="testimonial-avatar">
                        <p class="testimonial-quote">"The mobile experience is flawless. Everything adapts perfectly to my phone and the performance is incredible."</p>
                        <p class="testimonial-author">- Emily Rodriguez</p>
                    </div>
                </div>
                
                <div class="slider-nav">
                    <div class="slider-dot active" data-index="0"></div>
                    <div class="slider-dot" data-index="1"></div>
                    <div class="slider-dot" data-index="2"></div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact">
            <h2>Get In Touch</h2>
            <p>Have questions or want to work with us? Send us a message and we'll get back to you soon.</p>
            
            <form class="contact-form">
                <div class="form-group">
                    <label for="name">Your Name</label>
                    <input type="text" id="name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" required>
                </div>
                
                <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" id="subject" required>
                </div>
                
                <div class="form-group">
                    <label for="message">Your Message</label>
                    <textarea id="message" required></textarea>
                </div>
                
                <button type="submit" class="submit-btn">Send Message</button>
            </form>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-column">
                <h3>About Us</h3>
                <p>We create beautiful, dynamic websites with engaging animations and transitions that captivate your audience.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#features">Features</a></li>
                    <li><a href="#gallery">Gallery</a></li>
                    <li><a href="#testimonials">Testimonials</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>
            
            <div class="footer-column">
                <h3>Contact Info</h3>
                <ul class="footer-links">
                    <li><i class="fas fa-map-marker-alt"></i> 123 Web Street, Design City</li>
                    <li><i class="fas fa-phone"></i> (123) 456-7890</li>
                    <li><i class="fas fa-envelope"></i> info@dynamicsite.com</li>
                </ul>
            </div>
        </div>
        
        <div class="copyright">
            <p>&copy; 2023 DynamicSite. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Back to Top Button -->
    <div class="back-to-top">
        <i class="fas fa-arrow-up"></i>
    </div>

    <!-- JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Simulate loading delay
            setTimeout(function() {
                document.querySelector('.loader').classList.add('hidden');
            }, 1500);

            // Mobile menu toggle
            const hamburger = document.querySelector('.hamburger');
            const navLinks = document.querySelector('.nav-links');
            
            hamburger.addEventListener('click', function() {
                navLinks.classList.toggle('active');
                hamburger.innerHTML = navLinks.classList.contains('active') ? 
                    '<i class="fas fa-times"></i>' : '<i class="fas fa-bars"></i>';
            });

            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    // Close mobile menu if open
                    if (navLinks.classList.contains('active')) {
                        navLinks.classList.remove('active');
                        hamburger.innerHTML = '<i class="fas fa-bars"></i>';
                    }
                    
                    const targetId = this.getAttribute('href');
                    const targetElement = document.querySelector(targetId);
                    
                    if (targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - 80,
                            behavior: 'smooth'
                        });
                    }
                });
            });

            // Navbar scroll effect
            const navbar = document.getElementById('navbar');
            const headerContent = document.querySelector('.header-content');
            
            window.addEventListener('scroll', function() {
                if (window.scrollY > 100) {
                    navbar.classList.add('scrolled');
                    headerContent.classList.add('hidden');
                } else {
                    navbar.classList.remove('scrolled');
                    headerContent.classList.remove('hidden');
                }
                
                // Back to top button visibility
                const backToTop = document.querySelector('.back-to-top');
                if (window.scrollY > 300) {
                    backToTop.classList.add('visible');
                } else {
                    backToTop.classList.remove('visible');
                }
            });

            // Back to top button
            document.querySelector('.back-to-top').addEventListener('click', function() {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });

            // Testimonial slider
            const slider = document.querySelector('.testimonial-slider');
            const dots = document.querySelectorAll('.slider-dot');
            let currentSlide = 0;
            const slideCount = document.querySelectorAll('.testimonial').length;
            
            function goToSlide(index) {
                slider.style.transform = `translateX(-${index * 100}%)`;
                dots.forEach(dot => dot.classList.remove('active'));
                dots[index].classList.add('active');
                currentSlide = index;
            }
            
            dots.forEach(dot => {
                dot.addEventListener('click', function() {
                    const slideIndex = parseInt(this.getAttribute('data-index'));
                    goToSlide(slideIndex);
                });
            });
            
            // Auto slide change
            setInterval(function() {
                currentSlide = (currentSlide + 1) % slideCount;
                goToSlide(currentSlide);
            }, 5000);

            // Intersection Observer for scroll animations
            const sections = document.querySelectorAll('section');
            const featureCards = document.querySelectorAll('.feature-card');
            const galleryItems = document.querySelectorAll('.gallery-item');
            
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };
            
            const sectionObserver = new IntersectionObserver(function(entries, observer) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                        observer.unobserve(entry.target);
                    }
                });
            }, observerOptions);
            
            sections.forEach(section => {
                sectionObserver.observe(section);
            });
            
            const cardObserver = new IntersectionObserver(function(entries, observer) {
                entries.forEach((entry, index) => {
                    if (entry.isIntersecting) {
                        setTimeout(() => {
                            entry.target.classList.add('visible');
                        }, index * 200);
                        observer.unobserve(entry.target);
                    }
                });
            }, observerOptions);
            
            featureCards.forEach(card => {
                cardObserver.observe(card);
            });
            
            galleryItems.forEach(item => {
                cardObserver.observe(item);
            });

            // Form submission
            const contactForm = document.querySelector('.contact-form');
            contactForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Get form values
                const name = document.getElementById('name').value;
                const email = document.getElementById('email').value;
                const subject = document.getElementById('subject').value;
                const message = document.getElementById('message').value;
                
                // Here you would typically send the data to a server
                console.log('Form submitted:', { name, email, subject, message });
                
                // Show success message
                alert('Thank you for your message! We will get back to you soon.');
                contactForm.reset();
            });
        });
    </script>
</body>
</html>
