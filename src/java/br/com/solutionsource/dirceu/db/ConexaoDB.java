/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.db;

import br.com.solutionsource.dirceu.servlet.ServletContextInfo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author Desenvolvimento
 */
public class ConexaoDB {

    private static Connection conexao = null;
    static ConexaoDB instancia = null;
    static ServletContextInfo sci = new ServletContextInfo();

    public ConexaoDB() {
        inicializaDB();
    }

    public static ConexaoDB retornaInstancia() {
        if (instancia == null) {
            instancia = new ConexaoDB();
            Thread t = new Thread(new Mysql_Keep_Alive(), "Mysql_Keep_Alive");
            t.start();
            return instancia;
        } else {
            return instancia;
        }
    }

    public void inicializaDB() {
        try {
            Class.forName(sci.getDriver()).newInstance();
            conexao = DriverManager.getConnection(sci.getFullServerName(), sci.getUsername(), sci.getPassword());
        } catch (Exception ex) {
            System.out.println("[ConexaoDB] inicializaDB: " + ex.toString());
            ex.printStackTrace();
        }
    }

    public Connection retornaConexao() {
        return this.conexao;
    }

    private static class Mysql_Keep_Alive implements Runnable {

        // Mantém a conexão ativa com o Mysql
        @Override
        public void run() {
            int ttl = 300000; // 5 minutos

            while (true) {

                try {
                    String sql = "SELECT 1";
                    try {
                        Statement st = conexao.createStatement();
                        st.executeQuery(sql);
                    } catch (Exception ex) {
                        System.out.println("[ProjetoDirceu] Mysql_Keep_Alive: Falha: " + ex.toString());
                    }
                    Thread.sleep(ttl);
                } catch (Exception ex) {
                    ex.printStackTrace();
                    System.out.println("[Mysql_Keep_Alive: " + ex.toString());
                }
            }
        }
    }
}
