package servlet;

import dao.CategoryDAO;

import dao.QuestionDAO;
import dao.QuizDAO;
import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

@WebServlet(name = "CreateClass", urlPatterns = {"/CreateClass"})
public class CreateClass extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("userSeisson");
            QuestionDAO qDAO = new QuestionDAO();
            QuizDAO dao = new QuizDAO();
            CategoryDAO cDAO = new CategoryDAO();
            
            UsersDAO userDao = new UsersDAO();

            String quizTitle = request.getParameter("ID");
            String dateNow = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            String quizDescription = request.getParameter("student_description");
            dao.addQuiz(user.getUser_id(), quizTitle, quizDescription, dateNow);
            int lastQuizID = dao.getLastQuizId(user.getUser_id());
            int Checked = 0;
            
            String[] listQuestion = Question.split("@@@##@@@");
            
            String[] listOption = optionOfQuestion.split("@@@##@@@");
            for (int m = 3, i = 5, j = 7, k = 9; i < listOption.length && j < listOption.length
                    && k < listOption.length && m < listOption.length; i += 10, j += 10, k += 10, m += 10) {
                int idQuestion = Integer.parseInt(listOption[m].substring(14, listOption[m].length() - 3));
                int idOption = Integer.parseInt(listOption[i].substring(12, listOption[i].length() - 3));
                String checkedBox = listOption[j].substring(12, listOption[j].length() - 3);

                String optionDescription = listOption[k].substring(22, listOption[k].length() - 3);
                qDAO.addOption(lastQuizID, idQuestion, idOption, optionDescription);
            }
            for (int i=0; i<Category.length;i++) {
                 cDAO.addCategoryForQuiz(lastQuizID, Category[i]);
            }
            dao.addEnrollment(String.valueOf(lastQuizID), user.getUser_id(), dateNow);
            Users updateUserSession = userDao.getUsers(user.getEmail(), user.getPassword());
            session.setAttribute("userSeisson", updateUserSession);
            request.setAttribute("success", "Create quiz successfully!");
            request.getRequestDispatcher("CreateQuiz.jsp").forward(request, response);
    }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("CreateQuiz.jsp").forward(request, response);
        processRequest(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

