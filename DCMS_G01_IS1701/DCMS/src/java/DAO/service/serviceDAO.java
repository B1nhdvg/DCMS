package DAO.service;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.Service;

public class serviceDAO {

    public serviceDAO() {
        connectDB();
    }

    Connection cnn = null; // ket noi db
    PreparedStatement stm = null; // thuc thi cac cau lenh sql
    ResultSet rs = null; // luu tru va xu ly du lieu

    private void connectDB() {
        try {
            cnn = (new DBContext().getConnection());
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }

    public List<Service> searchService(String target) {
        List<Service> list = new ArrayList<>();
        String query = "select * from Category_service where category_service_name like ?";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + target + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                Service s = new Service(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Service> getAllService() {
        ArrayList<Service> list = new ArrayList<>();
        String query = "SELECT *\n" + "  FROM [DCMS_ISP391].[dbo].[Category_service]";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();

            while (rs.next()) {
                Service s = new Service(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println("get all Service Error:" + e.getMessage());
        }
        return list;
    }

    public void deleteService(String id) {
        try {
            String sql = "delete from Category_service "
                    + "where id = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("del Error:" + e.getMessage());
        }
    }

    public Service getServicetByID(int id) {
        String sql = "SELECT *\n"
                + "FROM Category_service\n"
                + "WHERE id = ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Service(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
            System.out.println("add Error:" + e.getMessage());
        }
        return null;
    }

    public void updateService(int id, String name, String description, String image, int cost) {
        String sql = " UPDATE Category_service\n"
                + " SET category_service_name = ?,"
                + " description = ?,"
                + " image = ?,"
                + " cost = ? \n"
                + " WHERE id = ?";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, description);
            stm.setString(3, image);
            stm.setInt(4, cost);
            stm.setInt(5, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update Error:" + e.getMessage());
        }
    }

    public void addService( String name, String description, String image, int cost) {
        String sql = "INSERT INTO "
                + "Category_service\n"
                + "VALUES(?,?,?,?)";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, description);
            stm.setString(3, image);
            stm.setInt(4, cost);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("add Error:" + e.getMessage());
        }
    }

    public int getNumberPage() {
        String sql = "select count(*) from Category_service";
        try {
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public ArrayList<Service> getPaging(int index) {
        String sql = "select * from Category_service\n"
                + "order by id\n"
                + "offset ? rows\n"
                + "fetch first 4 rows only;";
        ArrayList<Service> list = new ArrayList<>();
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, (index-1)*4);
            rs = stm.executeQuery();
            while(rs.next()){
                 Service s = new Service(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
                list.add(s);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
