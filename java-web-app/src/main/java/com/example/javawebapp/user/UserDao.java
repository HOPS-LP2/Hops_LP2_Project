package com.example.javawebapp.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import com.example.javawebapp.db.DBConnection;

import at.favre.lib.crypto.bcrypt.BCrypt;

public class UserDao {
    public static User cadastrar(String first_name, String last_name, String email, String password, String CPF,
            String phone_number) {
        User user = null;
        String hashPassword = BCrypt.withDefaults().hashToString(12, password.toCharArray());
        String sql = "INSERT INTO usuario (primeiro_nome, segundo_nome, email, senha, cpf, telefone) VALUES (?, ?, ?, ?, ?, ?);";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);) {
            statement.setString(1, first_name);
            statement.setString(2, last_name);
            statement.setString(3, email);
            statement.setString(4, hashPassword);
            statement.setString(5, CPF);
            statement.setString(6, phone_number);

            statement.executeUpdate();

            ResultSet rs = statement.getGeneratedKeys();

            if (rs.next()) {
                user = new User(rs.getInt(1), first_name, last_name, email, hashPassword, CPF, phone_number);
            }

            rs.close();

            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static User searchById(Integer id) {
        String sql = "SELECT * FROM usuario WHERE id = ?;";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("primeiro_nome"),
                        rs.getString("segundo_nome"),
                        rs.getString("email"),
                        rs.getString("senha"),
                        rs.getString("cpf"),
                        rs.getString("telefone"));
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        return null;
    }

    public static User searchByEmail(String email) {
        String sql = "SELECT * FROM usuario WHERE email = ?;";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("primeiro_nome"),
                        rs.getString("segundo_nome"),
                        rs.getString("email"),
                        rs.getString("senha"),
                        rs.getString("cpf"),
                        rs.getString("telefone"));
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        return null;
    }

    public static User searchByCPF(String CPF) {
        String sql = "SELECT * FROM usuario WHERE cpf = ?;";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);) {
            statement.setString(1, CPF);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("primeiro_nome"),
                        rs.getString("segundo_nome"),
                        rs.getString("email"),
                        rs.getString("senha"),
                        rs.getString("cpf"),
                        rs.getString("telefone"));
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        return null;
    }

    public static User login(String credential, String password) {
        User user = null;
        if (credential.length() == 11 && credential.matches("\\d+")) {
            user = searchByCPF(credential);
            if (user != null) {
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
                return result.verified ? user : null;
            }
        } else {
            user = searchByEmail(credential);
            if (user != null) {
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
                return result.verified ? user : null;
            }
        }

        return null;
    }

    public static Boolean existsWithEmail(String email) {
        return searchByEmail(email) != null;
    }

    public static Boolean existsWithCPF(String CPF) {
        return searchByCPF(CPF) != null;
    }
}
