package com.example.javawebapp.agency;

public class Agency {
    private Integer agencyId;
    private String name;
    private String city;
    private String cep;
    private String address;
    private Integer address_number;
    private String location;

    public Agency(Integer agencyId, String name, String city, String cep, String address, Integer address_number,
            String location) {
        this.agencyId = agencyId;
        this.name = name;
        this.city = city;
        this.cep = cep;
        this.address = address;
        this.address_number = address_number;
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

    public Integer getAddress_number() {
        return address_number;
    }

    public void setAddress_number(Integer address_number) {
        this.address_number = address_number;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}