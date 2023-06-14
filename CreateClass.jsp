<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en"
      dir="ltr">
    <head>
        <jsp:useBean id="cDAO" class="dao.CategoryDAO" scope="request"></jsp:useBean>
            <meta charset="UTF-8" />
            <title>Create Class</title>

            <link rel="stylesheet" href="assets/css/createClass.css" type="text/css" />

            <!-- Custom Fonts -->
            <link href="https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500%7CRoboto:400,500&display=swap"
                  rel="stylesheet">

            <!-- Perfect Scrollbar -->
            <link type="text/css"
                  href="assets/vendor/perfect-scrollbar.css"
                  rel="stylesheet">

            <!-- Material Design Icons -->
            <link type="text/css"
                  href="assets/css/material-icons.css"
                  rel="stylesheet">

            <!-- Font Awesome Icons -->
            <link type="text/css"
                  href="assets/css/fontawesome.css"
                  rel="stylesheet">

            <!-- Preloader -->
            <link type="text/css"
                  href="assets/vendor/spinkit.css"
                  rel="stylesheet">

            <!-- App CSS -->
            <link type="text/css"
                  href="assets/css/app.css"
                  rel="stylesheet">
        </head>
    <body>
            <%@include file="Header_All.jsp" %>
        <div class="preloader">
            <div class="sk-chase">
                <div class="sk-chase-dot"></div>
                <div class="sk-chase-dot"></div>
                <div class="sk-chase-dot"></div>
                <div class="sk-chase-dot"></div>
                <div class="sk-chase-dot"></div>
                <div class="sk-chase-dot"></div>
            </div>
        </div>
            <form action="CreateClass" method="post"  style="min-height: 800px;">
            <div class="container_body row">
                <div class="create_new_ID row" name="ID" id="createID"  style="width: 100%;">
                <div class="col-sm-3"></div>
                <div class="col-sm-6 student" id="1"> 
                    <div class="remove-ID-div">
                        <button id="removeRow" type="button" class="" style="float: right; margin-top:20px; margin-right: 20px;">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </div> 
                    <div class="Student-infor row" >
                        <div id="Student-information">
                            <div class="col-sm-11 student-div" id="student">
                                <textarea class="student-description" rows="2" id="stu-des1" placeholder="Student-name"></textarea>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>            
                <div class="col-sm-3"></div>                
            </div>
                    <!--Add new student-->
            <div id="newRow" class="newQue row">
                <!--End of new student-->    
            </div>

            <div class="bton row">
                <!--PHAN BUTTON "ADD-STUDENT" VA "SAVE"-->
                <div class="col-sm-3"></div>
                <div class="col-sm-5 add-more-student-div">
                    <button class="add-more-student btn btn-success" onclick="addQue()" type="button">Add Student</button>
                </div>            
                <div class="col-sm-1 save-quiz-div">
                    <input class="save-quiz btn btn-white" type="submit" onclick="getAll()" value="Save" >
                </div>
                <div class="col-sm-3"></div>
                <!--KET THUC 2 BUTTON-->
            </div>
            <div>
                <input id="HiddenInput" name="ListStudent" value="" type="hidden">
                <input id="HiddenInputOption" name="ListOption" value="" type="hidden">
            </div>

            <--Add quiz -->
                <div class="col-sm-3"></div>
                <div class="col-sm-6 quiz"> 
                    <div name="quiz-information">
                        <div class="quiz-infor row">
                            <div class="col-sm-9 quiz-title-div">
                                <input type="text" name="quiz_title" placeholder="Quiz Title" 
                                       style="border: none; border-bottom: 1px solid gray; width: 100%;" required>
                            </div>
                            <div class="col-sm-11 quiz-description-div" >
                                <textarea name="quiz_description" class="quiz-description" rows='2' placeholder='Add ID quiz'></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3"></div>
            <div class="add_new_quiz row" name="quiz" id="addquiz"  style="width: 100%;">
                <div class="col-sm-3"></div>
                <div class="col-sm-6 quiz" id="1"> 
                    <div class="remove-quiz-div">
                        <button id="removeRow" type="button" class="" style="float: right; margin-top:20px; margin-right: 20px;">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </div> 
                    <div class="question-infor row" >
                        <div id="question-information">
                            <div class="col-sm-11 question-div" id="question">
                                <textarea class="question-description" rows="2" id="ques-des1" placeholder="Quiz"></textarea>
                            </div>
                            <div class="col-sm-12 row option-div">
                                <div id="createOption1" style="width: 100%;">
                                    <div id="innerQue" class="innerQue1 row">
                                        <div class="option-content col-sm-9" id="option-content">
                                            <input type="text" id="answer" class="option-description1" placeholder="option-content"
                                                   style="border: none; border-bottom: 1px solid gray; width: 100%;" >                                
                                        </div>                         
                                        <div class="remove-option-div col-sm-1">                               
                                            <button class="remove-option btn btn-white btn-sm" type="button" id="removeInnerQue"><i class="fas fa-trash-alt"></i></button>
                                        </div>                         
                                    </div>
                                </div>
                                <div class="add-more-option-div col-sm-3">
                                    <button class="add-more-option btn-primary" onclick="addInnerQue('createOption1')" type="button">Add option</button>

                                </div>
                                <div class="col-sm-10"></div>                            
                            </div>
                            <br>

                        </div>
                    </div>
                </div>            
                <div class="col-sm-3"></div>                
            </div>   
                    </div>
                </div>            
                <div class="col-sm-3"></div>                
            </div>
                    <!--Add new quiz-->
            <div id="newRow" class="newQue row">   
            </div>

            <div class="bton row">
                <!--PHAN BUTTON "ADD-QUIZ" VA "SAVE"-->
                <div class="col-sm-3"></div>
                <div class="col-sm-5 add-more-student-div">
                    <button class="add-more-student btn btn-success" onclick="addQue()" type="button">Add Quiz</button>
                </div>            
                <div class="col-sm-1 save-quiz-div">
                    <input class="save-quiz btn btn-white" type="submit" onclick="getAll()" value="Save" >
                </div>
                <div class="col-sm-3"></div>
                <!--KET THUC 2 BUTTON-->
            </div>
            <div>
                <input id="HiddenInput" name="ListStudent" value="" type="hidden">
                <input id="HiddenInputOption" name="ListOption" value="" type="hidden">
            </div>
    </form>

        <%@include file="Footer.jsp" %>
        <%@include file="Boostrap_Header.jsp" %>
        <!-- jQuery -->
        <script src="assets/vendor/jquery.min.js"></script>

        <!-- Bootstrap -->
        <script src="assets/vendor/popper.min.js"></script>
        <script src="assets/vendor/bootstrap.min.js"></script>

        <!-- Perfect Scrollbar -->
        <script src="assets/vendor/perfect-scrollbar.min.js"></script>

        <!-- MDK -->
        <script src="assets/vendor/dom-factory.js"></script>
        <script src="assets/vendor/material-design-kit.js"></script>

        <!-- App JS -->
        <script src="assets/js/app.js"></script>

        <!-- Highlight.js -->
        <script src="assets/js/hljs.js"></script>

        <!--Our js-->
        <script src="assets/js/CreateClass.js"></script>
        <script>
                        var textarea = document.querySelector("Add Student");
                        textarea.addEventListener('keydown', autosize);
                        function autosize() {
                            var el = this;
                            setTimeout(function () {
                                el.style.cssText = 'height:auto; padding:0';
                                el.style.cssText = 'height:' + el.scrollHeight + 'px';
                            }, 0);
                        }
        </script>   
    </body>