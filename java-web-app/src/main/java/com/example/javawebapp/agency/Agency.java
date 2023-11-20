package com.example.javawebapp.agency;

public class Agency {
    private Integer agencyId;
    private String name;
    private String city;
    private String state;
    private String cep;
    private String address;
    private String location;
    private Double distance;

    public Agency() {
    };

    public Agency(Integer agencyId, String name, String city, String state, String cep, String address, String location,
            Double distance) {
        this.agencyId = agencyId;
        this.name = name;
        this.city = city;
        this.state = state;
        this.cep = cep;
        this.address = address;
        this.location = location;
        this.distance = distance;
    }

    public Agency(Integer agencyId, String name, String city, String state, String cep, String address,
            String location) {
        this.agencyId = agencyId;
        this.name = name;
        this.city = city;
        this.state = state;
        this.cep = cep;
        this.address = address;
        this.location = location;
    }

    public Integer getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(Integer agencyId) {
        this.agencyId = agencyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

}