package com.ptit.demo.dal;

import com.ptit.demo.model.Product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private DBContext db;

    public ProductDAO() {
        db = new DBContext();
    }

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT ID, [name], [quantity], [price], [releaseDate], [describe], [image], [cid] FROM Products";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getString("ID"));
                product.setName(rs.getString("name"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setReleaseDate(rs.getDate("releaseDate"));
                product.setDescribe(rs.getString("describe"));
                product.setImage(rs.getString("image"));
                product.setCid(rs.getInt("cid"));
                list.add(product);
            }
        } catch (Exception e) {
            System.out.println("Error getting all products: " + e.getMessage());
        }

        return list;
    }

    public Product getById(String id) {
        String sql = "SELECT ID, [name], [quantity], [price], [releaseDate], [describe], [image], [cid] FROM Products WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getString("ID"));
                    product.setName(rs.getString("name"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getBigDecimal("price"));
                    product.setReleaseDate(rs.getDate("releaseDate"));
                    product.setDescribe(rs.getString("describe"));
                    product.setImage(rs.getString("image"));
                    product.setCid(rs.getInt("cid"));
                    return product;
                }
            }
        } catch (Exception e) {
            System.out.println("Error getting product by ID: " + e.getMessage());
        }

        return null;
    }

    public List<Product> getByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT ID, [name], [quantity], [price], [releaseDate], [describe], [image], [cid] FROM Products WHERE cid = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getString("ID"));
                    product.setName(rs.getString("name"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getBigDecimal("price"));
                    product.setReleaseDate(rs.getDate("releaseDate"));
                    product.setDescribe(rs.getString("describe"));
                    product.setImage(rs.getString("image"));
                    product.setCid(rs.getInt("cid"));
                    list.add(product);
                }
            }
        } catch (Exception e) {
            System.out.println("Error getting products by category ID: " + e.getMessage());
        }

        return list;
    }

    public boolean insert(Product product) {
        String sql = "INSERT INTO Products (ID, [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, product.getId());
            ps.setString(2, product.getName());
            ps.setObject(3, product.getQuantity());
            ps.setBigDecimal(4, product.getPrice());
            ps.setDate(5, product.getReleaseDate() != null ? new Date(product.getReleaseDate().getTime()) : null);
            ps.setString(6, product.getDescribe());
            ps.setString(7, product.getImage());
            ps.setObject(8, product.getCid());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error inserting product: " + e.getMessage());
            return false;
        }
    }

    public boolean update(Product product) {
        String sql = "UPDATE Products SET [name] = ?, [quantity] = ?, [price] = ?, " +
                "[releaseDate] = ?, [describe] = ?, [image] = ?, [cid] = ? WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, product.getName());
            ps.setObject(2, product.getQuantity());
            ps.setBigDecimal(3, product.getPrice());
            ps.setDate(4, product.getReleaseDate() != null ? new Date(product.getReleaseDate().getTime()) : null);
            ps.setString(5, product.getDescribe());
            ps.setString(6, product.getImage());
            ps.setObject(7, product.getCid());
            ps.setString(8, product.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error updating product: " + e.getMessage());
            return false;
        }
    }

    public boolean delete(String id) {
        String sql = "DELETE FROM Products WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, id);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error deleting product: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAll();
        if (!list.isEmpty()) {
            System.out.println("Found " + list.size() + " products");
            System.out.println("First product: " + list.get(0).getName());
        } else {
            System.out.println("No products found.");
        }
    }
}