/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOJSF;

import DAO1.CervezaFacade;
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
import modelo.Cerveza;

/**
 *
 * @author benja
 */
public class CervezaController {

    public CervezaController() {
        pagingInfo = new PagingInfo();
        converter = new CervezaConverter();
    }
    private Cerveza cerveza = null;
    private List<Cerveza> cervezaItems = null;
    private CervezaFacade jpaController = null;
    private CervezaConverter converter = null;
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

    public CervezaFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (CervezaFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "cervezaJpa");
        }
        return jpaController;
    }

    public SelectItem[] getCervezaItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getCervezaItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Cerveza getCerveza() {
        if (cerveza == null) {
            cerveza = (Cerveza) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentCerveza", converter, null);
        }
        if (cerveza == null) {
            cerveza = new Cerveza();
        }
        return cerveza;
    }

    public String listSetup() {
        reset(true);
        return "cerveza_list";
    }

    public String createSetup() {
        reset(false);
        cerveza = new Cerveza();
        return "cerveza_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(cerveza);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Cerveza was successfully created.");
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
        return scalarSetup("cerveza_detail");
    }

    public String editSetup() {
        return scalarSetup("cerveza_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        cerveza = (Cerveza) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentCerveza", converter, null);
        if (cerveza == null) {
            String requestCervezaString = JsfUtil.getRequestParameter("jsfcrud.currentCerveza");
            JsfUtil.addErrorMessage("The cerveza with id " + requestCervezaString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String cervezaString = converter.getAsString(FacesContext.getCurrentInstance(), null, cerveza);
        String currentCervezaString = JsfUtil.getRequestParameter("jsfcrud.currentCerveza");
        if (cervezaString == null || cervezaString.length() == 0 || !cervezaString.equals(currentCervezaString)) {
            String outcome = editSetup();
            if ("cerveza_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit cerveza. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(cerveza);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Cerveza was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentCerveza");
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
                JsfUtil.addSuccessMessage("Cerveza was successfully deleted.");
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

    public List<Cerveza> getCervezaItems() {
        if (cervezaItems == null) {
            getPagingInfo();
            cervezaItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return cervezaItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "cerveza_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "cerveza_list";
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
        cerveza = null;
        cervezaItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Cerveza newCerveza = new Cerveza();
        String newCervezaString = converter.getAsString(FacesContext.getCurrentInstance(), null, newCerveza);
        String cervezaString = converter.getAsString(FacesContext.getCurrentInstance(), null, cerveza);
        if (!newCervezaString.equals(cervezaString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
