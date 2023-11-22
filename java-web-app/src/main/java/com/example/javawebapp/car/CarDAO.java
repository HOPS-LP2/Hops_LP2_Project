package com.example.javawebapp.car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.javawebapp.db.DBConnection;

public class CarDAO {
    public static List<Car> getByAgencyId(String agency_id) {
        List<Car> carsList = new ArrayList<>();

        String query = "SELECT carro.id AS car_id, " +
                "marca.nome AS brand, " +
                "modelo.nome AS model, " +
                "modelo.ano AS year, " +
                "cor.nome AS color, " +
                "modelo.preco AS price, " +
                "carro.image_path AS image_path, " +
                "carro.disponibilidade AS availability " +
                "FROM carro " +
                "JOIN cor ON carro.id_cor = cor.id " +
                "JOIN modelo ON carro.id_modelo = modelo.id " +
                "JOIN marca ON modelo.id_marca = marca.id " +
                "WHERE carro.id_agencia = ? ";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);) {
            statement.setInt(1, Integer.parseInt(agency_id));

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Car car = new Car();
                    car.setCar_id(resultSet.getInt("car_id"));
                    car.setBrand(resultSet.getString("brand"));
                    car.setModel(resultSet.getString("model"));
                    car.setYear(resultSet.getInt("year"));
                    car.setColor(resultSet.getString("color"));

                    float price = resultSet.getFloat("price");
                    car.setPrice(Float.parseFloat(String.format("%.2f", price)));

                    car.setImage_path(resultSet.getString("image_path"));
                    car.setAvailability(resultSet.getBoolean("availability"));

                    carsList.add(car);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carsList;
    }
}
