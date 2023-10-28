<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 28/10/2566
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>
        Welcome to Zige Course
    </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 dark:bg-gray-900 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
<div class="flex flex-col min-h-screen justify-center items-center">
    <h1 class="text-3xl font-bold text-center text-gray-900 dark:text-white">
        Welcome to Zige Course
    </h1>

    <div class="flex flex-col justify-center items-center mt-6">
        <a href="course-list" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
            Course List
        </a>
        <a href="course-registered-history" class="bg-pink-500 hover:bg-pink-700 text-white font-bold py-2 px-4 rounded mt-4">
            Your Course
        </a>
    </div>
</div>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Cherry+Bomb+One&family=Itim&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

    * {
        font-family: 'Kanit', sans-serif;
    }
</style>
</body>
</html>
