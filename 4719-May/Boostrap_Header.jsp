<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="mdk-drawer js-mdk-drawer"
             id="default-drawer">
            <div class="mdk-drawer__content ">
                <div class="sidebar sidebar-left sidebar-dark bg-dark o-hidden"
                     data-perfect-scrollbar>
                    <div class="sidebar-p-y">
                        <!-- APPLICATIONS menu -->
                        <c:if test="${sessionScope.userSeisson ==null}">
                            <div class="sidebar-heading">APPLICATIONS</div>
                            <ul class="sidebar-menu sm-active-button-bg">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="Login">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons fas fa-sign-in-alt"></i> Sign in
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="VerifyUser">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons fas fa-user-plus"></i> Sign up
                                    </a>
                                </li>
                            </ul>
                        </c:if>

                        <!--Student-->
                        <c:if test="${sessionScope.userSeisson.role_id ==0}">
                            <div class="sidebar-heading">Student</div>
                            <ul class="sidebar-menu sm-active-button-bg">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="QuizResult.jsp">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dvr</i> Take an Exam
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="QuizResult.jsp">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">poll</i> Exam Results
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="LibraryServlet?Action=Recent">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i> My Quiz
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="LogOut">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">lock_open</i> Logout
                                    </a>
                                </li>
                            </ul>
                        </c:if>

                        <c:if test="${sessionScope.userSeisson.role_id ==1}">
                            <div class="sidebar-heading">Instructor</div>
                            <ul class="sidebar-menu sm-active-button-bg">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="#">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">edit</i> Quiz Manager
                                    </a>
                                </li>

                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="PracticesList.jsp">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons fas fa-search-dollar"></i> Statement
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="LogOut">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">lock_open</i> Logout
                                    </a>
                                </li>
                            </ul>
                        </c:if>

                        <c:if test="${sessionScope.userSeisson.role_id ==2}">
                            <div class="sidebar-heading">Teacher</div>
                            <ul class="sidebar-menu sm-active-button-bg">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="CreateQuiz.jsp">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">edit</i> Create Quiz
                                    </a>
                                </li>
<!--                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="EditQuiz.jsp">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">edit</i> Edit Quiz
                                    </a>
                                </li>-->
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button"
                                       href="LogOut">
                                        <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">lock_open</i> Logout
                                    </a>
                                </li>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
