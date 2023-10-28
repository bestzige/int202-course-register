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
        Course List
    </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 dark:bg-gray-900 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
<div class="flex flex-col min-h-screen justify-center items-center">
    <h1 class="text-3xl font-bold text-center text-gray-900 dark:text-white">
        Course List
    </h1>

    <form class="flex items-center justify-center w-full mx-auto space-x-3"
          action="course-list" method="post">
        <label for="semester">
            <button class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">
                Semester
            </button>
        </label>
        <select id="semester" name="semester"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <c:forEach items="${applicationScope.semesters}" var="semester" varStatus="vs">
                <c:if test="${semester != null}">
                    <option value="${vs.index}" ${vs.index == selectedSemester ? 'selected' : ''}>
                            ${semester}
                    </option>
                </c:if>
            </c:forEach>
        </select>

        <button type="submit"
                class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
            Search
        </button>
        <a href="index.jsp">
            <button type="button"
                    class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">
                Back
            </button>
        </a>
    </form>

    <c:if test="${subjects != null}">
        <div class="relative overflow-x-auto w-full shadow-lg rounded-lg">
            <form action="register-course" method="post" class="flex flex-col space-y-4">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" class="px-6 py-3">
                            #
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Subject ID
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Subject Name
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Credit
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Action
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <input type="hidden" name="semester" value="${selectedSemester}">
                    <c:forEach items="${subjects}" var="subject" varStatus="vs">
                        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                            <td class="px-6 py-4">
                                    ${vs.count}
                            </td>
                            <td class="px-6 py-4">
                                    ${subject.subjectId}
                            </td>
                            <th scope="row"
                                class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    ${subject.title}
                            </th>
                            <td class="px-6 py-4">
                                    ${subject.credit}
                            </td>
                            <td class="px-6 py-4">
                                <input name="registeredSubjects"
                                       type="checkbox"
                                    ${registeredSubjects.contains(subject) ? 'checked' : ''}
                                       value="${subject.subjectId}"
                                       class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button type="submit"
                        class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded w-full">
                    Register
                </button>
            </form>
        </div>
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
