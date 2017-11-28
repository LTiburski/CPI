/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.pessoa;

import br.com.solutionsource.dirceu.db.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Desenvolvimento
 */
public class PessoaDAO {

    public PessoaDAO() {
    }

    public Pessoa selecionaPessoa(int id) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM pessoas p INNER JOIN estado e ON p.id_uf = e.id INNER JOIN cidade c ON p.id_cidade = c.id "
                + "WHERE p.Id = ?";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Pessoa retorno = new Pessoa();
                retorno.setId(rs.getInt("id"));
                retorno.setSituacao(rs.getString("situacao"));
                retorno.setCpf(rs.getString("cpf"));
                retorno.setNome(rs.getString("nome"));
                retorno.setApelido(rs.getString("apelido"));
                retorno.setLogradouro(rs.getString("logradouro"));
                retorno.setNumero(rs.getInt("numero"));
                retorno.setBairro(rs.getString("bairro"));
                retorno.setComplemento(rs.getString("complemento"));
                retorno.setId_uf(rs.getInt("id_uf"));
                retorno.setId_cidade(rs.getInt("id_cidade"));
                retorno.setNome_uf(rs.getString("e.uf"));
                retorno.setNome_cidade(rs.getString("c.nome"));
                retorno.setCep(rs.getString("cep"));
                retorno.setFone_fixo(rs.getString("fone_fixo"));
                retorno.setFone_comercial(rs.getString("fone_comercial"));
                retorno.setEmail(rs.getString("email"));
                retorno.setObservacoes(rs.getString("observacoes"));

                return retorno;
            }
        } catch (Exception ex) {
            System.out.println("[PessoaDAO] selecionaPessoa: " + ex.toString());
        } finally {
            rs.close();
            ps.close();
            conexao.close();
        }
        return null;
    }

    public ArrayList listaPessoas(Pessoa pesquisa) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT p.Id, p.situacao, cpf, p.nome, id_uf, id_cidade, e.uf, c.nome FROM pessoas p "
                + "INNER JOIN cidade c ON p.id_cidade = c.id INNER JOIN estado e ON p.id_uf = e.id WHERE id_usuario = ? ";

        if (pesquisa != null) {
            if (pesquisa.getPesquisa_id() > 0) {
                sql = sql + "AND p.Id = ? ";
            }
            if (pesquisa.getPesquisa_situacao() != null) {
                sql = sql + "AND p.situacao = ? ";
            }
            if (pesquisa.getPesquisa_nome() != null) {
                sql = sql + "AND p.nome LIKE ? ";
            }
            if (pesquisa.getPesquisa_cpf() != null) {
                sql = sql + "AND p.cpf LIKE ? ";
            }
        }
        sql = sql + "LIMIT ?,10";
        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setInt(1, pesquisa.getId_usuario());
            
            if (pesquisa != null) {
                int i = 2;
                if (pesquisa.getPesquisa_id() > 0) {
                    ps.setInt(i, pesquisa.getPesquisa_id());
                    i++;
                }
                if (pesquisa.getPesquisa_situacao() != null) {
                    ps.setString(i, pesquisa.getPesquisa_situacao());
                    i++;
                }
                if (pesquisa.getPesquisa_nome() != null) {
                    ps.setString(i, "%" + pesquisa.getPesquisa_nome() + "%");
                    i++;
                }
                if (pesquisa.getPesquisa_cpf() != null) {
                    ps.setString(i, "%" + pesquisa.getPesquisa_cpf() + "%");
                    i++;
                }
                ps.setInt(i, pesquisa.getPg() * 10);
            } else {
                ps.setInt(1, 0);
            }
            rs = ps.executeQuery();

            if (rs.isBeforeFirst()) {
                ArrayList<Pessoa> resultado = new ArrayList<>();
                while (rs.next()) {
                    Pessoa p = new Pessoa();
                    p.setId(rs.getInt("id"));
                    p.setSituacao(rs.getString("p.situacao"));
                    p.setNome(rs.getString("nome"));
                    p.setCpf(rs.getString("cpf"));
                    p.setNome_uf(rs.getString("e.uf"));
                    p.setNome_cidade(rs.getString("c.nome"));
                    resultado.add(p);
                }
                return resultado;
            }
        } catch (Exception ex) {
            System.out.println("[PessoaDAO] listaPessoas: " + ex.toString());
            ex.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conexao.close();
        }
        return null;
    }

    public boolean inserePessoa(Pessoa p) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;

        String sql = "INSERT INTO pessoas (data_cadastro, nome, apelido, cpf, logradouro, numero, complemento, bairro, id_uf, id_cidade, cep, fone_fixo, fone_comercial, "
                + "email, observacoes, situacao, id_usuario) VALUES (NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, p.getNome());
            ps.setString(2, p.getApelido());
            ps.setString(3, p.getCpf());
            ps.setString(4, p.getLogradouro());
            ps.setInt(5, p.getNumero());
            ps.setString(6, p.getComplemento());
            ps.setString(7, p.getBairro());
            ps.setInt(8, p.getId_uf());
            ps.setInt(9, p.getId_cidade());
            ps.setString(10, p.getCep());
            ps.setString(11, p.getFone_fixo());
            ps.setString(12, p.getFone_comercial());
            ps.setString(13, p.getEmail());
            ps.setString(14, p.getObservacoes());
            ps.setString(15, p.getSituacao());
            ps.setInt(16, p.getId_usuario());
            ps.execute();

            return true;
        } catch (Exception ex) {
            System.out.println("[PessoaDAO] inserePessoa: " + ex.toString());
            ex.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
        return false;
    }

    public ResultSet buscaPorCpf(String cpf, Integer id, Integer id_usuario) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT nome FROM pessoas WHERE cpf = ? AND id_usuario = ? ";
        if (id != null) {
            sql = sql + "AND id <> ?";
        }

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, cpf);
            ps.setInt(2, id_usuario);
            if (id != null) {
                ps.setInt(3, id);
            }
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs;
            }
        } catch (Exception ex) {
            System.out.println("[PessoaDAO] buscaPorCpf: " + ex.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
        return null;
    }

    public boolean editaPessoa(Pessoa p) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;

        String sql = "UPDATE pessoas SET nome = ?, apelido = ?, cpf = ?, logradouro = ?, numero = ?, bairro = ?, complemento = ?, id_uf = ?, id_cidade = ?, cep = ?, "
                + "fone_fixo = ?, fone_comercial = ?, email = ?, observacoes = ?, situacao = ? WHERE id = ?";
        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, p.getNome());
            ps.setString(2, p.getApelido());
            ps.setString(3, p.getCpf());
            ps.setString(4, p.getLogradouro());
            ps.setInt(5, p.getNumero());
            ps.setString(6, p.getBairro());
            ps.setString(7, p.getComplemento());
            ps.setInt(8, p.getId_uf());
            ps.setInt(9, p.getId_cidade());
            ps.setString(10, p.getCep());
            ps.setString(11, p.getFone_fixo());
            ps.setString(12, p.getFone_comercial());
            ps.setString(13, p.getEmail());
            ps.setString(14, p.getObservacoes());
            ps.setString(15, p.getSituacao());
            ps.setInt(16, p.getId());
            ps.execute();

            return true;
        } catch (Exception ex) {
            System.out.println("[PessoaDAO] editaPessoa: " + ex.toString());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
        return false;
    }
}
