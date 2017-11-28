/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.servlet;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author Marcelo
 */
public class ContextRootListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContextInfo.setContextPath(sce.getServletContext().getContextPath());
        ServletContextInfo.setRealPath(sce.getServletContext().getRealPath("/"));
        ServletContextInfo.setFullServerName(sce.getServletContext().getInitParameter("fullServerName"));
        ServletContextInfo.setDriver(sce.getServletContext().getInitParameter("driver"));
        ServletContextInfo.setUsername(sce.getServletContext().getInitParameter("username"));
        ServletContextInfo.setPassword(sce.getServletContext().getInitParameter("password"));
        ServletContextInfo.setHostName(sce.getServletContext().getInitParameter("hostName"));
        ServletContextInfo.setSmtpPort(sce.getServletContext().getInitParameter("smtpPort"));
        ServletContextInfo.setEmail(sce.getServletContext().getInitParameter("email"));
        ServletContextInfo.setEmailPassword(sce.getServletContext().getInitParameter("emailPassword"));
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Não suportado .");
    }

}
