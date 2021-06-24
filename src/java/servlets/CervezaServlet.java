/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import DAO.CategoriaLocal;
import DAO.CervezaDAOLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cerveza;

/**
 *
 * @author benja
 */
@WebServlet(name = "CervezaServlet", urlPatterns = {"/CervezaServlet"})
public class CervezaServlet extends HttpServlet {

    @EJB
    private CervezaDAOLocal manteCe;

    @EJB
    private CategoriaLocal manteC;
    
    

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
        
        
            String opcion = request.getParameter("accion");
            if(opcion==null){
                opcion="";
            }
            switch (opcion) {
                case "Agregar":
                    try {
                        int id = Integer.parseInt(request.getParameter("txtId"));
                        String nombre = request.getParameter("txtNombre");
                        int precio = Integer.parseInt(request.getParameter("txtPrecio"));
                        String marca = request.getParameter("txtMarca");
                        int stock = Integer.parseInt(request.getParameter("txtStock"));
                        String imagen = request.getParameter("txtImagen");
                        int cate = Integer.parseInt(request.getParameter("cbxCategoria"));
                        Cerveza cerv = new Cerveza(id, nombre, precio, marca, stock, imagen, manteC.buscar(cate));
                        if(manteCe.agregar(cerv)==1) {
//                            response.sendRedirect("administrador.jsp");
                            request.setAttribute("cerveza", manteCe.mostrar());
                        request.setAttribute("categoria", manteC.mostrar());
                        request.getRequestDispatcher("administrador.jsp").forward(request, response);
                        }else{
                            response.sendRedirect("error.jsp?mensaje=No agrego");
                        }
                    } catch (Exception ex) {
                        response.sendRedirect("error.jsp?mensaje=" + ex);
                    }
                    break;
                    case "ModificarA":
                int idM= Integer.parseInt(request.getParameter("id"));
                Cerveza cervM = manteCe.buscar(idM);
                request.setAttribute("cerveza", cervM);
                request.setAttribute("categoria", manteC.mostrar());
                request.getRequestDispatcher("modificar.jsp").forward(request, response);
                break;
                case "Modificar":
                    try {
                        int id = Integer.parseInt(request.getParameter("txtId"));
                        String nombre = request.getParameter("txtNombre");
                        int precio = Integer.parseInt(request.getParameter("txtPrecio"));
                        String marca = request.getParameter("txtMarca");
                        int stock = Integer.parseInt(request.getParameter("txtStock"));
                        String imagen = request.getParameter("txtImagen");
                        int cate = Integer.parseInt(request.getParameter("cbxCategoria"));
                        Cerveza cerv = new Cerveza(id, nombre, precio, marca, stock, imagen, manteC.buscar(cate));
                        if(manteCe.modificar(cerv)==1) {
//                            response.sendRedirect("administrador.jsp");
                              request.setAttribute("cerveza", manteCe.mostrar());
                        request.setAttribute("categoria", manteC.mostrar());
                        request.getRequestDispatcher("administrador.jsp").forward(request, response);
                        }else{
                            response.sendRedirect("error.jsp?mensaje=No modifico");
                        }
                    } catch (Exception ex) {
                        response.sendRedirect("error.jsp?mensaje=" + ex);
                    }
                    break;
                case "Eliminar":
                    try {
                        int id = Integer.parseInt(request.getParameter("txtId").toString());
                        if(manteCe.eliminar(id) == 1) {
//                            response.sendRedirect("administrador.jsp");
                        request.setAttribute("cerveza", manteCe.mostrar());
                        request.setAttribute("categoria", manteC.mostrar());
                        request.getRequestDispatcher("administrador.jsp").forward(request, response);
                        }else{
                            response.sendRedirect("error.jsp?mensaje=No elimino");
                        }
                        }catch (Exception ex) {
                        response.sendRedirect("error.jsp?mensaje=" + ex);
                    }
                    break;
                    }
                    request.setAttribute("cerveza", manteCe.mostrar());
                    request.setAttribute("categoria", manteC.mostrar());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
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
