/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Time;

/**
 *
 * @author nmcbo
 */
public class Service {
    private int id;
    private String name;
    private String description;
    private String image;
    private int cost;

    public Service(int id, String name, String description, String image, int cost) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.image = image;
        this.cost = cost;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "Service{" + "id=" + id + ", name=" + name + ", description=" + description + ", image=" + image + ", cost=" + cost + '}';
    }
    
    
}
