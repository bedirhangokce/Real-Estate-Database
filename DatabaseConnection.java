import java.sql.*;
import java.util.Scanner;

public class DatabaseConnection {
    String url = "jdbc:mysql://" + "localhost" + ":" + "3306" + "/" + "estate project";

    private Connection con = null;
    private Statement stat = null;
    private PreparedStatement preStat = null;

    public DatabaseConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection(url,"root","162534");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void getEstates(){
        String query ="Select *from estate";

        try {
            stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);

            while (rs.next()){
                int id = rs.getInt(1);
                int noOfBalconies = rs.getInt(2);
                String status = rs.getString(3);
                int floor = rs.getInt(4);
                String seller = rs.getString(5);
                String condit = rs.getString(6);
                String DateOnMarket = rs.getString(7);
                int price = rs.getInt(8);
                String address = rs.getString(9);
                int noOfRooms = rs.getInt(10);
                System.out.println("ID= " + id + " NumberOfBalconies= " + noOfBalconies + " Status= " + status
                        +" DateOnMarket= " + DateOnMarket + " Floor= " + floor + " Seller= " + seller + " Condition= " + condit
                        + " Price= " + price + " Address= " +address + " NoOfRooms= " + noOfRooms);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void  getSellers(){
        String query ="Select *from seller";

        try {
            stat=con.createStatement();
            ResultSet rs = stat.executeQuery(query);

            while (rs.next()){
              int id = rs.getInt(1);
              int telNum = rs.getInt(2);
              String name = rs.getString(3);

                System.out.println("ID= " + id+ " TelNum= " + telNum + " Name= " + name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getBuyers(){
        String query ="Select *from buyer";
        try {
            stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()){
                int id = rs.getInt(1);
                long telNum = rs.getLong(2);
                String name = rs.getString(3);

                System.out.println("ID= " + id+ " TelNum= " + telNum + " Name= " + name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getContracts(){
        String query ="Select *from Contract";
        try {
            stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()){
                int sellerID = rs.getInt(1);
                int estateID = rs.getInt(2);
                int buyerID = rs.getInt(3);
                String date = rs.getString(4);

                System.out.println("SellerID= " + sellerID + " EstateID= " + estateID + " BuyerID= " + buyerID + " Date= " + date);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(String tableName, String variableName, String value,int ID){
        String query2 = "Update $tableName Set $variableName = ? where ID=? ";
        String query1 = query2.replace("$tableName",tableName);
        String query = query1.replace("$variableName",variableName);
        try {
            preStat = con.prepareStatement(query);
            preStat.setString(1,value);
            preStat.setInt(2,ID);
            preStat.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        DatabaseConnection dc =  new DatabaseConnection();
        int x;
        int y;
        System.out.println("1- Get information");
        System.out.println("2- Update");
        Scanner scanner = new Scanner(System.in);
        x= scanner.nextInt();
        switch (x){
            case 1:
                System.out.println("Which table you want to get information");
                System.out.println("1- Seller");
                System.out.println("2- Buyer");
                System.out.println("3- Estate");
                System.out.println("4- Contract");
                y = scanner.nextInt();
                switch (y){
                    case 1:
                        dc.getSellers(); break;

                    case 2:
                        dc.getBuyers(); break;
                    case 3:
                        dc.getEstates(); break;
                    case 4:
                        dc.getContracts(); break;
                }
                break;

            case 2:
                String tabName, varName, val;
                int IDNum;
                System.out.print("Table name you want to update: ");
                tabName = scanner.next();
                System.out.print("Variable name you want to update: ");
                varName = scanner.next();
                System.out.print("ID you want to update: ");
                IDNum = scanner.nextInt();
                System.out.print("Value you want to update: ");
                scanner.nextLine();
                val = scanner.nextLine();
                dc.update(tabName,varName,val,IDNum);
                System.out.println("Done succesfully");
                break;
        }
    }
}