<%-- 
    Document   : index
    Created on : 05-Dec-2021, 11:32:22 am
    Author     : ANUPRIYA
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 70% 92%, 30% 92%, 0 100%);
            }

            .more-text{
                display: none;
            }

            .text.show-more .more-text{
                display: inline;
            }
            .text.show-more .dot{
                display: none;
            }
            /*2nd*/
            .more-text1{
                display: none;
            }

            .text1.show-more1 .more-text1{
                display: inline;
            }
            .text1.show-more1 .dot1{
                display: none;
            }
            /*3rd*/
            .more-text2{
                display: none;
            }

            .text2.show-more2 .more-text2{
                display: inline;
            }
            .text2.show-more2 .dot2{
                display: none;
            }
            /*4th*/
            .more-text3{
                display: none;
            }

            .text3.show-more3 .more-text3{
                display: inline;
            }
            .text3.show-more3 .dot3{
                display: none;
            }
            /*5th*/
            .more-text4{
                display: none;
            }

            .text4.show-more4 .more-text4{
                display: inline;
            }
            .text4.show-more4 .dot4{
                display: none;
            }
            /*6th*/
            .more-text5{
                display: none;
            }

            .text5.show-more5 .more-text5{
                display: inline;
            }
            .text5.show-more5 .dot5{
                display: none;
            }
            /*..............*/
        </style>
        <title>TechBlog || The Coding Hub</title>
    </head>
    <body>
        <!--<navbar>-->
        <%@include file="normal_navbar.jsp" %>
        <!--<navbar>-->

        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome, to TechBlog</h3>

                    <p>Welcome To Technical Blog, Hub of Tech Geeks
                        A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. 
                        Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.
                    </p>
                    <p>Most programming languages consist of instructions for computers.
                        The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions. </p>

                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start! it's Free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
        </div>

        <!--cards-->
        <div class="container">
            <!--cards 1st row-->
            <div class="row mb-2">
                <!--//card -1-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text text">Java is a programming language and a platform. Java is a high level, robust, object-oriented <span class="dot">....</span> <span class="more-text">  and secure programming language.

                                    Java was developed by Sun Microsystems (which is now the subsidiary of Oracle) in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak. Since Oak was already a registered company, so James Gosling and his team changed the name from Oak to Java.
                                    There are many devices where Java is currently used. Some of them are as follows:

                                    Desktop Applications such as acrobat reader, media player, antivirus, etc.
                                    Web Applications such as irctc.co.in, javatpoint.com, etc.
                                    Enterprise Applications such as banking applications,
                                    Mobile,
                                    Embedded System etc.
                                </span>

                            </p>
                            <button class="btn btn-primary text-white read-more-btn">read more..</button>
                        </div>
                    </div>
                </div>
                <!--card-1-->
                <!--card-2-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text text1">Python is an interpreted high-level general-purpose programming language. Its design philosophy  <span class="dot1">....</span> <span class="more-text1">  
                                    emphasizes code readability with its use of significant indentation. Its language constructs as well as its object-oriented approach aim to
                                    help programmers write clear, logical code for small and large-scale projects.
                                    Python is dynamically-typed and garbage-collected. It supports multiple programming paradigms, 
                                    object-oriented and functional programming. It is often described as a "batteries included" language due to its comprehensive standard library.
                                    Guido van Rossum began working on Python in the late 1980s.Python is meant to be an easily readable language. 
                                    Its formatting is visually uncluttered.
                                   
                                    
                                </span>

                            </p>
                            <button class="btn btn-primary text-white read-more-btn1">read more..</button>
                        </div>
                    </div>
                </div>

                <!--card-2-->
                <!--card-3-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">FrontEnd Development</h5>
                            <p class="card-text text2">Front-end web development is the development of the graphical user interface of a website, through the   <span class="dot2">....</span> <span class="more-text2"> 
                                    
                                     use of  HTML,CSS, and JavaScript, so that users can view and interact with that website.Hyper Text Markup Language is the backbone of any website development process, 
                                    
                                     Hypertext means that text has links, termed hyperlinks, embedded in it.
                                     Cascading Style Sheets (CSS) controls the presentation aspect of the site and allows your site to have its own unique look.
                                     JavaScript is an event-based imperative programming language 
                                     JavaScript code can use the Document Object Model (DOM), provided by the HTML standard, to manipulate a web page in response to events, like user input.

                                    
                                </span>

                            </p>
                            <button class="btn btn-primary text-white read-more-btn2">read more..</button>
                        </div>
                    </div>
                </div>
                <!--card-3-->

            </div>
            <!--cards 1st row-->
            <!--cards---2nd row-->
            <div class="row">
                <!--//card -1-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">BackEnd Development</h5>
                            <p class="card-text text3">Back-end Development refers to the server-side development. It focuses on databases, scripting, website <span class="dot3">....</span> <span class="more-text3"> 
                                    architecture. ... Code written by back-end developers helps browsers to communicate with database information. Example: 
                                    Most common example of Backend programming is when you are reading an article on the blog.
                                    The backend usually consists of three parts: a server, an application, and a database. 
                                    If you book a flight or buy concert tickets, you usually open a website and interact with the frontend.
                                    Examples of backend processes include: processing an incoming webpage request. running a script (PHP, ASP, JSP, etc.) to generate HTML. 
                                    accessing data, such as an article, from a database using an SQL queries.
                                    
                                </span>

                            </p>
                            <button class="btn btn-primary text-white read-more-btn3">read more..</button>
                        </div>
                    </div>
                </div>
                <!--card-1-->
                <!--card-2-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Machine Leaarning</h5>
                            <p class="card-text text4">Machine learning (ML) is the study of computer algorithms that can improve automatically through experience  <span class="dot4">....</span> <span class="more-text4">
                                    and by the use of data. It is seen as a part of artificial intelligence.
                                    Machine learning algorithms build a model based on sample data, known as training data, in order to make predictions
                                    without being explicitly programmed to do so.Machine learning algorithms are used in a wide variety of applications, 
                                    speech recognition etc. where it is difficultto develop conventional algorithms to perform the needed tasks.
                                    Some implementations of machine learning use data and neural networks in a way that mimics the working of a biological brain.
                                    machine learning is also referred to as predictive analytics.

                                </span>

                            </p>
                            <button class="btn btn-primary text-white read-more-btn4">read more..</button>
                        </div>
                    </div>
                </div>
                <!--card-2-->
                <!--card-3-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Android Development</h5>
                            <p class="card-text text5">Android software development is the process by which applications are created for devices running   <span class="dot5">....</span> <span class="more-text5">  
                                    the Android operating system. Google states that[3] "Android apps can be written using Kotlin, Java, and C++ languages" using the Android software development kit (SDK),
                                    while using other languages is also possible. All non-Java virtual machine (JVM) languages, such as Go, 
                                    JavaScript, C, C++ or assembly, need the help of JVM language code, that may be supplied by tools, likely with restricted API support. 
                                    Some programming languages and tools allow cross-platform app support (i.e. for both Android and iOS). 
                                     The Android software development kit (SDK) includes a comprehensive set of development tools.
                                </span>

                            </p>
                            <button class="btn btn-primary text-white read-more-btn5">read more..</button>
                        </div>
                    </div>
                </div>
                <!--card-3-->

            </div>

            <!--cards---2nd row-->

        </div>

        <!--cards-->


        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>

            const readMoreBtn = document.querySelector('.read-more-btn');
            const text = document.querySelector('.text');

            readMoreBtn.addEventListener('click', (e) => {
                text.classList.toggle('show-more');

                if (readMoreBtn.innerText === 'read more..') {
                    readMoreBtn.innerText = 'read less..';
                } else {
                    readMoreBtn.innerText = 'read more..';
                }
            })

        </script>
        <script>

            const readMoreBtn1 = document.querySelector('.read-more-btn1');
            const text1 = document.querySelector('.text1');

            readMoreBtn1.addEventListener('click', (e) => {
                text1.classList.toggle('show-more1');

                if (readMoreBtn1.innerText === 'read more..') {
                    readMoreBtn1.innerText = 'read less..';
                } else {
                    readMoreBtn1.innerText = 'read more..';
                }
            })

        </script>
        <script>

            const readMoreBtn2 = document.querySelector('.read-more-btn2');
            const text2 = document.querySelector('.text2');

            readMoreBtn2.addEventListener('click', (e) => {
                text2.classList.toggle('show-more2');

                if (readMoreBtn2.innerText === 'read more..') {
                    readMoreBtn2.innerText = 'read less..';
                } else {
                    readMoreBtn2.innerText = 'read more..';
                }
            })

        </script>
        <script>

            const readMoreBtn3 = document.querySelector('.read-more-btn3');
            const text3 = document.querySelector('.text3');

            readMoreBtn3.addEventListener('click', (e) => {
                text3.classList.toggle('show-more3');

                if (readMoreBtn3.innerText === 'read more..') {
                    readMoreBtn3.innerText = 'read less..';
                } else {
                    readMoreBtn3.innerText = 'read more..';
                }
            })

        </script>
        <script>

            const readMoreBtn4 = document.querySelector('.read-more-btn4');
            const text4 = document.querySelector('.text4');

            readMoreBtn4.addEventListener('click', (e) => {
                text4.classList.toggle('show-more4');

                if (readMoreBtn4.innerText === 'read more..') {
                    readMoreBtn4.innerText = 'read less..';
                } else {
                    readMoreBtn4.innerText = 'read more..';
                }
            })

        </script>
        <script>

            const readMoreBtn5 = document.querySelector('.read-more-btn5');
            const text5 = document.querySelector('.text5');

            readMoreBtn5.addEventListener('click', (e) => {
                text5.classList.toggle('show-more5');

                if (readMoreBtn5.innerText === 'read more..') {
                    readMoreBtn5.innerText = 'read less..';
                } else {
                    readMoreBtn5.innerText = 'read more..';
                }
            })

        </script>


    </body>
</html>
