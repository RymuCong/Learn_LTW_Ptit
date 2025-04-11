package com.ptit.demo.dal;

import com.ptit.demo.model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    private DBContext db;

    public CategoryDAO() {
        db = new DBContext();
    }

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT ID, [name], describe FROM Categories";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("ID"));
                category.setName(rs.getString("name"));
                category.setDescribe(rs.getString("describe"));
                list.add(category);
            }
        } catch (Exception e) {
            System.out.println("Error getting all categories: " + e.getMessage());
        }

        return list;
    }

    public Category getById(int id) {
        String sql = "SELECT ID, [name], describe FROM Categories WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Category category = new Category();
                    category.setId(rs.getInt("ID"));
                    category.setName(rs.getString("name"));
                    category.setDescribe(rs.getString("describe"));
                    return category;
                }
            }
        } catch (Exception e) {
            System.out.println("Error getting category by ID: " + e.getMessage());
        }

        return null;
    }

    public boolean insert(Category category) {
        String sql = "INSERT INTO Categories (ID, [name], describe) VALUES (?, ?, ?)";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, category.getId());
            ps.setString(2, category.getName());
            ps.setString(3, category.getDescribe());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error inserting category: " + e.getMessage());
            return false;
        }
    }

    public boolean update(Category category) {
        String sql = "UPDATE Categories SET [name] = ?, describe = ? WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category.getName());
            ps.setString(2, category.getDescribe());
            ps.setInt(3, category.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error updating category: " + e.getMessage());
            return false;
        }
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM Categories WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error deleting category: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();
        List<Category> list = c.getAll();
        if (!list.isEmpty()) {
            System.out.println(list.get(0).getName());
        } else {
            System.out.println("No categories found.");
        }
    }
}