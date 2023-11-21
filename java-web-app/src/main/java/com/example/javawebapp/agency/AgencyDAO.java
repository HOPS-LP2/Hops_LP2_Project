package com.example.javawebapp.agency;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.javawebapp.db.DBConnection;

public class AgencyDAO {
    public static List<Agency> getAllAgencies() {
        List<Agency> agencyList = new ArrayList<>();

        String query = "SELECT agencia.id AS id, " +
                "agencia.nome AS name, " +
                "cidade.nome AS city, " +
                "estado.nome AS state, " +
                "agencia.cep AS cep, " +
                "agencia.endereco AS address " +
                "FROM agencia " +
                "JOIN cidade ON agencia.id_cidade = cidade.id " +
                "JOIN estado ON cidade.id_estado = estado.id;";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);){
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Agency agency = new Agency();
                    agency.setAgencyId(resultSet.getInt("id"));
                    agency.setName(resultSet.getString("name"));
                    agency.setCity(resultSet.getString("city"));
                    agency.setState(resultSet.getString("state"));
                    agency.setCep(resultSet.getString("cep"));
                    agency.setAddress(resultSet.getString("address"));

                    agencyList.add(agency);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return agencyList;
    }

    public static List<Agency> getNearestAgencies(LocationInfo locationInfo) {
        List<Agency> agencyList = new ArrayList<>();

        String query = "SELECT agencia.id AS id, " +
                "agencia.nome AS name, " +
                "cidade.nome AS city, " +
                "estado.nome AS state, " +
                "agencia.cep AS cep, " +
                "agencia.endereco AS address, " +
                "ST_AsText(agencia.location) AS location, " +
                "ST_DISTANCE_Sphere(" +
                "    ST_GeomFromText(CONCAT('POINT(', ?, ' ', ?, ')'), 4326), " +
                "    agencia.location" +
                ") / 1000 AS distance " +
                "FROM agencia " +
                "JOIN cidade ON agencia.id_cidade = cidade.id " +
                "JOIN estado ON cidade.id_estado = estado.id " +
                "WHERE cidade.nome = ? " +
                "LIMIT 3;";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);) {
            statement.setString(1, locationInfo.getLatitude());
            statement.setString(2, locationInfo.getLongitude());
            statement.setString(3, locationInfo.getCityName());

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Agency agency = new Agency();
                    agency.setAgencyId(resultSet.getInt("id"));
                    agency.setName(resultSet.getString("name"));
                    agency.setCity(resultSet.getString("city"));
                    agency.setState(resultSet.getString("state"));
                    agency.setCep(resultSet.getString("cep"));
                    agency.setAddress(resultSet.getString("address"));
                    agency.setLocation(resultSet.getString("location"));
                    agency.setDistance(resultSet.getDouble("distance"));

                    agencyList.add(agency);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return agencyList;
    }
}
