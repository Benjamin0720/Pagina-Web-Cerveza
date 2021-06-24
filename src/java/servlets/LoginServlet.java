/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import DAO.CategoriaLocal;
import DAO.CervezaDAOLocal;
import DAO.PerfilUsuarioDAOLocal;
import DAO.UsuarioDAOLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;

/**
 *
 * @author benja
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @EJB
    private CervezaDAOLocal cervezaDAO;

    @EJB
    private CategoriaLocal categoriaDAO;

    @EJB
    private PerfilUsuarioDAOLocal perfilUsurioDAO;

    @EJB
    private UsuarioDAOLocal manteUsu;

    
    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String opcion = request.getParameter("btnLogin");
            switch (opcion) {
                case "Ingresar":
                    try {
                    String correo = request.getParameter("txtCorreo");
                    String pass = request.getParameter("txtPass");
                    Usuario usu = manteUsu.buscar(correo);
                    if(usu!=null) {
                        if(usu.getPass().equals(pass)) {
                            switch (usu.getPerfil().getId()) {
                                case 1:
                                    request.getSession().setAttribute("nombre", usu);
//                                    response.sendRedirect("administrador.jsp");
                                    request.getRequestDispatcher("welcomeJSF.jsp").forward(request, response);
                                    break;
                                case 2:
                                    request.setAttribute("cerveza", cervezaDAO.mostrar());
                                    request.setAttribute("categoria", categoriaDAO.mostrar());
                                    
                                    request.getSession().setAttribute("nombre", usu);
//                                    response.sendRedirect("administrador.jsp");
                                    request.getRequestDispatcher("administrador.jsp").forward(request, response);
                                    break;
                                case 3:
                                    request.setAttribute("cerveza", cervezaDAO.mostrar());
                                    request.setAttribute("categoria", categoriaDAO.mostrar());
                                    
                                    request.getSession().setAttribute("nombre", usu);
//                                    response.sendRedirect("cliente.jsp");
                                    request.getRequestDispatcher("cliente.jsp").forward(request, response);
                                    break;
                                default:
                                    //request.getSession().setAttribute("nombre", usu);
                                //response.sendRedirect("error.jsp?mensaje=Pagina en proceso de construccion");
                            }
                        }else{
                      response.sendRedirect("error.jsp?mensaje=Contrasena mal ingresada");
                        }
                    }else{
                        response.sendRedirect("error.jsp?mensaje=Correo no registrado");
                    }
            }catch (Exception ex) {
                    response.sendRedirect("error.jsp?mensaje=" +ex);
            }
            break;
                default:
            request.getSession().setAttribute("nombre", null);
            response.sendRedirect("login.jsp");
        }
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
