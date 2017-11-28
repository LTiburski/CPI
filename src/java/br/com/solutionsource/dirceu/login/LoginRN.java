/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.login;

import java.sql.ResultSet;

/**
 *
 * @author Desenvolvimento
 */
public class LoginRN {

    LoginDAO lDAO = new LoginDAO();

    public String insereUsuario(Login usuario) {
        try {
            if (lDAO.insereUsuario(usuario)) {
                return "Usuário cadastrado com sucesso!";
            }
        } catch (Exception ex) {
            System.out.println("[LoginRN] insereUsuario: " + ex.toString());
        }
        return "Não foi possível completar o cadastro - contato o administrador!";
    }

    public Login checaLogin(String email, String senha) {
        try {
            return lDAO.checaLogin(email, senha);
        } catch (Exception ex) {
            System.out.println("[LoginRN] checaLogin: " + ex.toString());
        }
        return null;
    }

    public boolean checaEmailExistente(String email) {
        try {
            ResultSet rs = lDAO.checaEmailExistente(email);
            if (rs != null) {
                return false;
            }
        } catch (Exception ex) {
            System.out.println("[LoginRN] checaEmailExistente: " + ex.toString());
        }
        return true;
    }
}
