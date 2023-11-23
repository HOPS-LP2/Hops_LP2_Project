package com.example.javawebapp.message;

public class Message {
    private Integer message_id;
    private String name;
    private String email;
    private String message;

    public Message(Integer message_id, String name, String email, String message) {
        this.message_id = message_id;
        this.name = name;
        this.email = email;
        this.message = message;
    }

    public Integer getMessage_id() {
        return message_id;
    }

    public void setMessage_id(Integer message_id) {
        this.message_id = message_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
