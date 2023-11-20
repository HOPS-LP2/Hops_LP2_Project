import com.example.javawebapp.agency.Agency;
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

@WebServlet(name = "home", value = "/")
public class GetAgenciesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action.equals("getByLocation")) {
            String userInputLocation = req.getParameter("inputLocation");
            LocationInfo locationInfo = getLocationInfo(userInputLocation);

            if (locationInfo != null) {
                List<Agency> agencies = getAgenciesByLocation(locationInfo);
                // Return agencies as JSON
            } else {
                // Handle error or return appropriate response
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
            return response.toString();
        } finally {
            connection.disconnect();
        }
    }

    private LocationInfo getLocationInfo(String location) {
        String apiKey = "YOUR_GOOGLE_API_KEY";
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
            String placeId = autoCompleteJson.getAsJsonArray("predictions")
                    .get(0).getAsJsonObject().get("place_id").getAsString();

            // Step 2: Perform Place Details request
            String detailsUrl = String.format("%s?place_id=%s&key=%s", detailsApiUrl, placeId, apiKey);

            String detailsResponse = makeApiRequest(detailsUrl);
            JsonObject detailsJson = JsonParser.parseString(detailsResponse).getAsJsonObject();

            // Extract relevant information (latitude, longitude, city, etc.) from the
            // Details response
            JsonObject result = detailsJson.getAsJsonObject("result");

            String cityName = null;
            if (result.has("address_components")) {
                JsonArray addressComponents = result.getAsJsonArray("address_components");
                for (JsonElement component : addressComponents) {
                    JsonObject componentObj = component.getAsJsonObject();
                    JsonArray types = componentObj.getAsJsonArray("types");

                    boolean isLocality = false;
                    for (JsonElement type : types) {
                        if ("locality".equals(type.getAsString())) {
                            isLocality = true;
                            break;
                        }
                    }

                    if (isLocality) {
                        cityName = componentObj.get("long_name").getAsString();
                        break;
                    }
                }

            }

            // Build and return the LocationInfo object
            String latitude = result.getAsJsonObject("geometry").getAsJsonObject("location").get("lat").getAsString();
            String longitude = result.getAsJsonObject("geometry").getAsJsonObject("location").get("lng").getAsString();

            return new LocationInfo(latitude, longitude, cityName);

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    private List<Agency> getAgenciesByLocation(LocationInfo locationInfo) {
        // Implement the logic to get agencies based on the location information
        // You may call your DAO or perform any other necessary operations
        // Return the list of agencies
        return null;
    }
}
