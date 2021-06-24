/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOJSF;

import DAO1.PerfilUsuarioFacade;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import DAOJSF.util.JsfUtil;
import DAOJSF.util.PagingInfo;
import java.util.List;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import modelo.PerfilUsuario;

/**
 *
 * @author benja
 */
public class PerfilUsuarioController {

    public PerfilUsuarioController() {
        pagingInfo = new PagingInfo();
        converter = new PerfilUsuarioConverter();
    }
    private PerfilUsuario perfilUsuario = null;
    private List<PerfilUsuario> perfilUsuarioItems = null;
    private PerfilUsuarioFacade jpaController = null;
    private PerfilUsuarioConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "CervezaPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public PerfilUsuarioFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (PerfilUsuarioFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "perfilUsuarioJpa");
        }
        return jpaController;
    }

    public SelectItem[] getPerfilUsuarioItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getPerfilUsuarioItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public PerfilUsuario getPerfilUsuario() {
        if (perfilUsuario == null) {
            perfilUsuario = (PerfilUsuario) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPerfilUsuario", converter, null);
        }
        if (perfilUsuario == null) {
            perfilUsuario = new PerfilUsuario();
        }
        return perfilUsuario;
    }

    public String listSetup() {
        reset(true);
        return "perfilUsuario_list";
    }

    public String createSetup() {
        reset(false);
        perfilUsuario = new PerfilUsuario();
        return "perfilUsuario_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(perfilUsuario);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("PerfilUsuario was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("perfilUsuario_detail");
    }

    public String editSetup() {
        return scalarSetup("perfilUsuario_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        perfilUsuario = (PerfilUsuario) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPerfilUsuario", converter, null);
        if (perfilUsuario == null) {
            String requestPerfilUsuarioString = JsfUtil.getRequestParameter("jsfcrud.currentPerfilUsuario");
            JsfUtil.addErrorMessage("The perfilUsuario with id " + requestPerfilUsuarioString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String perfilUsuarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, perfilUsuario);
        String currentPerfilUsuarioString = JsfUtil.getRequestParameter("jsfcrud.currentPerfilUsuario");
        if (perfilUsuarioString == null || perfilUsuarioString.length() == 0 || !perfilUsuarioString.equals(currentPerfilUsuarioString)) {
            String outcome = editSetup();
            if ("perfilUsuario_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit perfilUsuario. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(perfilUsuario);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("PerfilUsuario was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPerfilUsuario");
        int id = Integer.parseInt(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("PerfilUsuario was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        boolean ERROR=false;
        if ((ERROR)) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<PerfilUsuario> getPerfilUsuarioItems() {
        if (perfilUsuarioItems == null) {
            getPagingInfo();
            perfilUsuarioItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return perfilUsuarioItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "perfilUsuario_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "perfilUsuario_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        perfilUsuario = null;
        perfilUsuarioItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        PerfilUsuario newPerfilUsuario = new PerfilUsuario();
        String newPerfilUsuarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPerfilUsuario);
        String perfilUsuarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, perfilUsuario);
        if (!newPerfilUsuarioString.equals(perfilUsuarioString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
