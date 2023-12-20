import java.sql.*;
import java.util.Scanner;
import static java.lang.Integer.parseInt;


/* Karish Gupta and Allen Chueng*/

/* "jdbc:oracle:thin:@localhost:1521:XE" for connection
* jdbc:oracle:thin:@oracle.wpi.edu:1521:orcl*/

public class p3 {
    public static void main(String[] args) {
        String USERID = "";
        String PASSWORD = "";
        String CONNECTIONSTRING = "";
        int MODE = 0;

        if (args.length == 3 || args.length == 4) {
            USERID = args[0];
            PASSWORD = args[1];
            CONNECTIONSTRING = args[2];
            MODE = parseInt(args[3]);

        } else {
            System.out.println("Syntax: java p3 <username> <password> <connection string> <menu item>");
        }

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("No JDBC Driver");
            e.printStackTrace();
            return;
        }
        try {
            // create the connection string
            Connection connection = DriverManager.getConnection(CONNECTIONSTRING, USERID, PASSWORD);

            if (MODE == 1) {
                locations(connection);
            }

            if (MODE == 2) {
                edges(connection);
            }

            if (MODE == 3) {
                csstaff(connection);
            }

            if (MODE == 4) {
                insertPhone(connection);
            }
        } catch (SQLException e) {
            System.out.println("Connection Failed!");
        }




    }

    public static void locations (Connection connection) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter Location ID: ");
        String locationID = scanner.nextLine();
        scanner.close();

        try {
            String sql = "SELECT * FROM Locations WHERE LocationID = '" + locationID + "'";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                System.out.println("\nLocation Information");
                System.out.println("Location ID: " + rs.getString("LocationID"));
                System.out.println("Location Name: " + rs.getString("LocationName"));
                System.out.println("Location Type: " + rs.getString("LocationType"));
                System.out.println("X-Coordinate: " + rs.getInt("XCoord"));
                System.out.println("Y-Coordinate: " + rs.getInt("YCoord"));
                System.out.println("Floor: " + rs.getString("MapFloor"));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void edges (Connection connection) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter Edge ID: ");
        String edgeId = scan.nextLine();

        try {
            String sql = "SELECT l1.LocationName AS startName, l1.MapFloor AS startFloor, " +
                    "l2.LocationName AS endName, l2.MapFloor AS endFloor " +
                    "FROM Edges e " +
                    "JOIN Locations l1 ON e.StartingLocationID = l1.LocationID " +
                    "JOIN Locations l2 ON e.EndingLocationID = l2.LocationID " +
                    "WHERE e.EdgeID = '" + edgeId + "'";

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                System.out.println("\nEdge Information");
                System.out.println("Edge ID: " + edgeId);
                System.out.println("Starting Location Name: " + rs.getString("startName"));
                System.out.println("Starting Location Floor: " + rs.getString("startFloor"));
                System.out.println("Ending Location Name: " + rs.getString("endName"));
                System.out.println("Ending Location Floor: " + rs.getString("endFloor"));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void csstaff (Connection connection) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter CS Staff Account Name: ");
        String accountName = scan.nextLine();

        try {
            String sql = "SELECT a.FirstName, a.LastName, a.OfficeID, t.TitleName, p.PhoneExt " +
                    "FROM CSStaff a " +
                    "LEFT JOIN CSStaffTitles c ON a.AccountName = c.AccountName " +
                    "LEFT JOIN Titles t ON c.Acronym = t.Acronym " +
                    "LEFT JOIN PhoneExtensions p ON a.AccountName = p.AccountName " +
                    "WHERE a.AccountName = '" + accountName + "'" ;

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                System.out.println("\nCS Staff Information");
                System.out.println("Account Name: " + accountName);
                System.out.println("First Name: " + rs.getString("FirstName"));
                System.out.println("Last Name: " + rs.getString("LastName"));
                System.out.println("Office ID: " + rs.getString("OfficeID"));

                System.out.print("Title: ");
                do {
                    System.out.print(rs.getString("TitleName") + "; ");
                } while (rs.next());

                System.out.print("\nPhone Ext: ");
                rs.previous(); // reset cursor
                do {
                    System.out.print(rs.getString("PhoneExt") + "; ");
                } while (rs.next());
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertPhone (Connection connection) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter CS Staff Account Name: ");
        String accountName = scan.nextLine();

        System.out.print("Enter the new Phone Extension: ");
        String phoneExt = scan.nextLine();

        try {
            String sql = "INSERT INTO PhoneExtensions (AccountName, PhoneExt) VALUES ('" + accountName +
                    "', '" + phoneExt + "')";
            PreparedStatement stmt = connection.prepareStatement(sql);

            int rowCount = stmt.executeUpdate();
            if (rowCount > 0) {
                System.out.println("New phone extension inserted successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}