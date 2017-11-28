/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.servlet;

/**
 *
 * @author Marcelo
 */
public class ServletContextInfo {

    // Config. de acesso a base de dados
    private static String contextPath;
    private static String realPath;
    private static String fullServerName;
    private static String username;
    private static String password;
    private static String driver;
    private static String hostName;
    private static String smtpPort;
    private static String email;
    private static String emailPassword;

    public static String getHostName() {
        return hostName;
    }

    public static void setHostName(String hostName) {
        ServletContextInfo.hostName = hostName;
    }

    public static String getSmtpPort() {
        return smtpPort;
    }

    public static void setSmtpPort(String smtpPort) {
        ServletContextInfo.smtpPort = smtpPort;
    }

    public static String getEmail() {
        return email;
    }

    public static void setEmail(String email) {
        ServletContextInfo.email = email;
    }

    public static String getEmailPassword() {
        return emailPassword;
    }

    public static void setEmailPassword(String emailPassword) {
        ServletContextInfo.emailPassword = emailPassword;
    }
    
    public static String getContextPath() {
        return contextPath;
    }

    public static void setContextPath(String contextPath) {
        ServletContextInfo.contextPath = contextPath;
    }

    public static String getRealPath() {
        return realPath;
    }

    public static void setRealPath(String realPath) {
        ServletContextInfo.realPath = realPath;
    }

    public static String getFullServerName() {
        return fullServerName;
    }

    public static void setFullServerName(String fullServerName) {
        ServletContextInfo.fullServerName = fullServerName;
    }

    public static String getUsername() {
        return username;
    }

    public static void setUsername(String username) {
        ServletContextInfo.username = username;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        ServletContextInfo.password = password;
    }

    public static String getDriver() {
        return driver;
    }

    public static void setDriver(String driver) {
        ServletContextInfo.driver = driver;
    }
}
