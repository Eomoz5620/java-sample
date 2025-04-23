package com.example;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello, this is a vulnerable Java app.");

        // 🚨 Faux secret (clé API exposée)
        String apiKey = "AKIAFAKESECRET1234567890";
        System.out.println("Using API key: " + apiKey);
    }
}
