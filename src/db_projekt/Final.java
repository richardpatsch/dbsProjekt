package db_projekt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Final
 */
@WebServlet("/Final")
public class Final extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Final() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession session = request.getSession(true);
		KontaktpersonBean kb = (KontaktpersonBean) session.getAttribute("currentKbSelection");
		AnflugschneisenBean ab = (AnflugschneisenBean) session.getAttribute("currentSchneise");
		
		System.out.println(kb);
		System.out.println(ab);
		
		if (kb != null && ab != null) {
			BuchungsBean b = new BuchungsBean();
			b.setSVId(kb.getSVId());
			b.setSchneisennummer(ab.getSchneisennummer());
			b.setBuchungsnummer(Integer.valueOf(request.getParameter("buchungsnummer")));
			b.setBuchungsdatum(request.getParameter("buchungsdatum"));
			b.setBeginnzeit(request.getParameter("beginnzeit"));
			b.setEndzeit(request.getParameter("endzeit"));
			
			BuchungsDAO.save(b);
			response.sendRedirect("private/buchung/index.jsp");
		}
	}

}
