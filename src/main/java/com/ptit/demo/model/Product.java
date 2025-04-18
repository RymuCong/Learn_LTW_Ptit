package com.ptit.demo.model;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
    private String id;
    private String name;
    private Integer quantity;
    private BigDecimal price;
    private Date releaseDate;
    private String describe;
    private String image;
    private Integer cid; // Foreign key to Category

    // Default constructor
    public Product() {
    }

    // Full constructor
    public Product(String id, String name, Integer quantity, BigDecimal price,
                   Date releaseDate, String describe, String image, Integer cid) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.releaseDate = releaseDate;
        this.describe = describe;
        this.image = image;
        this.cid = cid;
    }

    // Getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", releaseDate=" + releaseDate +
                ", describe='" + describe + '\'' +
                ", image='" + image + '\'' +
                ", cid=" + cid +
                '}';
    }
}