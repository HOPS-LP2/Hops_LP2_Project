package com.example.javawebapp.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.javawebapp.db.DBConnection;

public class MessageDAO {
    public static Message criar(String name, String email, String message) {

        Message newMessage = null;
        String query = "INSERT INTO mensagem(nome, email, mensagem) VALUES (?, ?, ?);";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);) {
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, message);

            statement.executeUpdate();

            ResultSet rs = statement.getGeneratedKeys();

            if (rs.next()) {
                newMessage = new Message(rs.getInt(1), name, email, message);
            }

            rs.close();

            return newMessage;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }

}
