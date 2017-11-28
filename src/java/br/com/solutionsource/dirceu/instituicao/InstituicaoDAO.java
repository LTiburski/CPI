/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.instituicao;

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
public class InstituicaoDAO {

    public InstituicaoDAO() {
    }

    public Instituicao selecionaInstituicao(int id) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM instituicoes i INNER JOIN estado e ON i.uf = e.id INNER JOIN cidade c ON i.cidade = c.id "
                + "INNER JOIN instituicoes_categorias ic ON i.id_categoria = ic.id "
                + "WHERE i.Id = ?";

        try {
            conexao = Database.getInstance().getConnection();
            if (conexao != null) {
                ps = conexao.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                if (rs.next()) {
                    Instituicao i = new Instituicao();
                    i.setId(rs.getInt("i.id"));
                    i.setNome_fantasia(rs.getString("nome_fantasia"));
                    i.setRazao_social(rs.getString("razao_social"));
                    i.setCnpj(rs.getString("cnpj"));
                    i.setLogradouro(rs.getString("logradouro"));
                    i.setNumero(rs.getInt("numero"));
                    i.setComplemento(rs.getString("complemento"));
                    i.setBairro(rs.getString("bairro"));
                    i.setId_uf(rs.getInt("uf"));
                    i.setId_cidade(rs.getInt("cidade"));
                    i.setNome_uf(rs.getString("e.uf"));
                    i.setNome_cidade(rs.getString("c.nome"));
                    i.setObservacoes(rs.getString("observacoes"));
                    i.setId_categoria(rs.getInt("id_categoria"));
                    i.setNome_categoria(rs.getString("ic.categoria"));
                    i.setTelefone(rs.getString("telefone"));
                    i.setEmail(rs.getString("email"));
                    i.setTipo(rs.getString("tipo"));
                    i.setSituacao(rs.getString("situacao"));
                    i.setLatitude(rs.getString("latitude"));
                    i.setLongitude(rs.getString("longitude"));

                    return i;
                }
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoDAO] selecionaInstituicao: " + ex.toString());
            ex.printStackTrace();
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

    public ArrayList listaInstituicoes(Instituicao pesquisa) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM instituicoes i "
                + "INNER JOIN estado e ON i.uf = e.id INNER JOIN cidade c ON i.cidade = c.id WHERE id_usuario = ? ";

        if (pesquisa != null) {
            if (pesquisa.getPesquisa_id() > 0) {
                sql = sql + "AND i.id = ? ";
            }
            if (pesquisa.getPesquisa_cnpj() != null) {
                sql = sql + "AND i.cnpj LIKE ? ";
            }
            if (pesquisa.getPesquisa_rsocial() != null) {
                sql = sql + "AND i.razao_social LIKE ?";
            }
            if (pesquisa.getPesquisa_uf() > 0) {
                sql = sql + "AND i.uf = ? ";
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
                if (pesquisa.getPesquisa_cnpj() != null) {
                    ps.setString(i, "%" + pesquisa.getPesquisa_cnpj() + "%");
                    i++;
                }
                if (pesquisa.getPesquisa_rsocial() != null) {
                    ps.setString(i, "%" + pesquisa.getPesquisa_rsocial() + "%");
                    i++;
                }
                if (pesquisa.getPesquisa_uf() > 0) {
                    ps.setInt(i, pesquisa.getPesquisa_uf());
                    i++;
                }
                ps.setInt(i, pesquisa.getPg() * 10);
            } else {
                ps.setInt(2, 0);
            }
            rs = ps.executeQuery();
            if (rs.isBeforeFirst()) {
                ArrayList<Instituicao> resultado = new ArrayList<>();
                while (rs.next()) {
                    Instituicao i = new Instituicao();
                    i.setId(rs.getInt("id"));
                    i.setNome_fantasia(rs.getString("nome_fantasia"));
                    i.setRazao_social(rs.getString("razao_social"));
                    i.setCnpj(rs.getString("cnpj"));
                    i.setLogradouro(rs.getString("logradouro"));
                    i.setNumero(rs.getInt("numero"));
                    i.setComplemento(rs.getString("complemento"));
                    i.setBairro(rs.getString("bairro"));
                    i.setId_uf(rs.getInt("uf"));
                    i.setNome_uf(rs.getString("e.uf"));
                    i.setNome_cidade(rs.getString("c.nome"));
                    i.setId_cidade(rs.getInt("cidade"));
                    i.setObservacoes(rs.getString("observacoes"));
                    i.setTelefone(rs.getString("telefone"));
                    i.setEmail(rs.getString("email"));
                    i.setTipo(rs.getString("tipo"));
                    i.setSituacao(rs.getString("situacao"));
                    i.setLatitude(rs.getString("latitude"));
                    i.setLongitude(rs.getString("longitude"));

                    resultado.add(i);
                }
                return resultado;
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoDAO] listaInstituicoes: " + ex.toString());
            ex.printStackTrace();
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

    public boolean insereInstituicao(Instituicao i) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "INSERT INTO instituicoes (tipo, situacao, razao_social, nome_fantasia, cnpj, logradouro, numero, complemento, bairro, uf, cidade, observacoes, "
                + "id_pai, id_categoria, site, email, telefone, latitude, longitude, id_usuario) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, i.getTipo());
            ps.setString(2, i.getSituacao());
            ps.setString(3, i.getRazao_social());
            ps.setString(4, i.getNome_fantasia());
            ps.setString(5, i.getCnpj());
            ps.setString(6, i.getLogradouro());
            ps.setInt(7, i.getNumero());
            ps.setString(8, i.getComplemento());
            ps.setString(9, i.getBairro());
            ps.setInt(10, i.getId_uf());
            ps.setInt(11, i.getId_cidade());
            ps.setString(12, i.getObservacoes());
            ps.setInt(13, i.getId_pai());
            ps.setInt(14, i.getId_categoria());
            ps.setString(15, i.getSite());
            ps.setString(16, i.getEmail());
            ps.setString(17, i.getTelefone());
            ps.setString(18, i.getLatitude());
            ps.setString(19, i.getLongitude());
            ps.setInt(20, i.getId_usuario());

            ps.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("[InstituicaoDAO] insereInstituicao: " + ex.toString());
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

    public ResultSet buscaPorCnpj(String cnpj, Integer id, Integer id_usuario) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT id FROM instituicoes WHERE cnpj = ?  AND id_usuario = ? ";
        if (id != null) {
            sql = sql + "AND id <> ?";
        }
        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, cnpj);
            ps.setInt(2, id_usuario);
            if (id != null) {
                ps.setInt(3, id);
            }
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs;
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoDAO] buscaPorCnpj: " + ex.toString());
            ex.printStackTrace();
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

    public boolean edicao(Instituicao i) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "UPDATE instituicoes SET id_categoria = ?, tipo = ?, situacao = ?, razao_social = ?, nome_fantasia = ?, cnpj = ?, logradouro = ?, numero = ?, "
                + "complemento = ?, bairro = ?, uf = ?, cidade = ?, latitude = ?, longitude = ?, telefone = ?, email = ?, site = ?, observacoes = ? "
                + "WHERE id = ?";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setInt(1, i.getId_categoria());
            ps.setString(2, i.getTipo());
            ps.setString(3, i.getSituacao());
            ps.setString(4, i.getRazao_social());
            ps.setString(5, i.getNome_fantasia());
            ps.setString(6, i.getCnpj());
            ps.setString(7, i.getLogradouro());
            ps.setInt(8, i.getNumero());
            ps.setString(9, i.getComplemento());
            ps.setString(10, i.getBairro());
            ps.setInt(11, i.getId_uf());
            ps.setInt(12, i.getId_cidade());
            ps.setString(13, i.getLatitude());
            ps.setString(14, i.getLongitude());
            ps.setString(15, i.getTelefone());
            ps.setString(16, i.getEmail());
            ps.setString(17, i.getSite());
            ps.setString(18, i.getObservacoes());
            ps.setInt(19, i.getId());
            ps.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("[InstituicaoDAO] edicao: " + ex.toString());
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

    public ArrayList buscaPorCategoria(int categoria) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT nome_fantasia WHERE id_categoria = ?";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setInt(1, categoria);
            rs = ps.executeQuery();
            if (rs.next()) {
                ArrayList<Instituicao> resultado = new ArrayList<>();
                while (rs.next()) {
                    Instituicao i = new Instituicao();
                    i.setNome_fantasia(rs.getString("nome_fantasia"));
                    resultado.add(i);
                }
                return resultado;
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoDAO] buscaPorCategoria: " + ex.toString());
            ex.printStackTrace();
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
}
