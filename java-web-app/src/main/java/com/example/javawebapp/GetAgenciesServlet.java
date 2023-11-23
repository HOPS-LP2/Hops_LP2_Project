package com.example.javawebapp;

import com.example.javawebapp.agency.Agency;
import com.example.javawebapp.agency.AgencyDAO;
import com.example.javawebapp.agency.LocationInfo;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet(name = "getAgencies", value = "/getAgencies")
public class GetAgenciesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action.equals("getByLocation")) {
            String userInputLocation = req.getParameter("inputLocation");
            LocationInfo locationInfo = getLocationInfo(userInputLocation);

            if (locationInfo != null) {
                List<Agency> agencies = AgencyDAO.getNearestAgencies(locationInfo);

                JsonArray jsonArray = new JsonArray();
                for (Agency agency : agencies) {
                    JsonObject agencyJson = new JsonObject();
                    agencyJson.addProperty("agency_id", agency.getAgencyId());
                    agencyJson.addProperty("name", agency.getName());
                    agencyJson.addProperty("city", agency.getCity());
                    agencyJson.addProperty("state", agency.getState());
                    agencyJson.addProperty("cep", agency.getCep());
                    agencyJson.addProperty("address", agency.getAddress());
                    agencyJson.addProperty("location", agency.getLocation());
                    agencyJson.addProperty("distance", agency.getDistance());

                    jsonArray.add(agencyJson);
                }

                res.setContentType("application/json");

                res.getWriter().write(jsonArray.toString());
            } else {
                res.sendError(0, "Couldn't find address");
            }
        }
    }

    private String makeApiRequest(String apiUrl) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            // Print the API response for debugging

            return response.toString();
        } catch (IOException e) {
            // Print an error message if the API request fails
            System.err.println("Error making API request: " + e.getMessage());
            throw e; // Re-throw the exception to be handled by the caller
        } finally {
            connection.disconnect();
        }
    }

    private LocationInfo getLocationInfo(String location) {
        String apiKey = "API_KEY";
        String autoCompleteApiUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
        String detailsApiUrl = "https://maps.googleapis.com/maps/api/place/details/json";

        try {
            // Step 1: Perform Place Autocomplete request
            String autoCompleteUrl = String.format(
                    "%s?input=%s&key=%s", autoCompleteApiUrl, URLEncoder.encode(location, StandardCharsets.UTF_8),
                    apiKey);

            String autoCompleteResponse = makeApiRequest(autoCompleteUrl);
            JsonObject autoCompleteJson = JsonParser.parseString(autoCompleteResponse).getAsJsonObject();

            // Extract the place ID from the Autocomplete response
            JsonArray predictionsArray = autoCompleteJson.getAsJsonArray("predictions");
            if (predictionsArray != null && predictionsArray.size() > 0) {
                String placeId = predictionsArray
                        .get(0).getAsJsonObject().get("place_id").getAsString();

                // Step 2: Perform Place Details request
                String detailsUrl = String.format("%s?place_id=%s&key=%s", detailsApiUrl, placeId, apiKey);

                String detailsResponse = makeApiRequest(detailsUrl);
                JsonObject detailsJson = JsonParser.parseString(detailsResponse).getAsJsonObject();

                // Extract relevant information (latitude, longitude, city, etc.) from the
                // Details response
                JsonObject result = detailsJson.getAsJsonObject("result");

                // Extract the city name directly from the result's address_components
                String cityName = null;
                JsonArray addressComponents = result.getAsJsonArray("address_components");

                for (JsonElement component : addressComponents) {
                    JsonObject componentObj = component.getAsJsonObject();
                    JsonArray types = componentObj.getAsJsonArray("types");
                    for (JsonElement typeElement : types) {
                        String type = typeElement.getAsString();

                        // Check for general types that correspond to the city
                        if (type.equals("locality") || type.contains("administrative_area_level")) {
                            cityName = componentObj.get("long_name").getAsString();
                            break;
                        }
                    }

                    if (cityName != null) {
                        break; // Break out of the outer loop if we found the city name
                    }
                }

                // Build and return the LocationInfo object
                String latitude = result.getAsJsonObject("geometry").getAsJsonObject("location").get("lat")
                        .getAsString();
                String longitude = result.getAsJsonObject("geometry").getAsJsonObject("location").get("lng")
                        .getAsString();

                return new LocationInfo(latitude, longitude, cityName);
            } else {
                // Handle the case where "predictions" array is empty or null
                System.out.println("No predictions found in autoCompleteJson");
                return null;
            }

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            System.out.println("Exception caught: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

}
