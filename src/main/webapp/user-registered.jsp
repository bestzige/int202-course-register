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
        Course Registration
    </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 dark:bg-gray-900 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
<div class="flex flex-col min-h-screen justify-center items-center">
    <c:if test="${message != null}">
        <h1 class="text-red-500 text-center text-xl font-bold">
                ${message}
        </h1>

        <a href="course-list"
           class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded mx-auto flex mt-2">
            <button type="button">
                Let's enroll
            </button>
        </a>
    </c:if>

    <c:if test="${message == null}">
        <h1 class="text-3xl font-bold text-center text-gray-900 dark:text-white">
            Course Registration
        </h1>

        <c:forEach items="${sessionScope.courseRegistered.history}" var="entry">

            <h2 class="mb-2 text-lg font-semibold text-gray-900 dark:text-white mt-2">
                Course: ${applicationScope.semesters[entry.key]}
            </h2>
            <ul class="max-w-md space-y-1 text-gray-500 list-disc dark:text-gray-400">
                <c:forEach items="${entry.value}" var="subject" varStatus="vs">
                    <li>${vs.count}) ${subject.subjectId} ${subject.title} ${subject.credit}</li>
                </c:forEach>
            </ul>

        </c:forEach>

        <a href="index.jsp"
           class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded mx-auto flex mt-2">
            <button type="button">
                Back to home
            </button>
        </a>
    </c:if>
</div>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Cherry+Bomb+One&family=Itim&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

    * {
        font-family: 'Kanit', sans-serif;
    }
</style>
</body>
</html>
