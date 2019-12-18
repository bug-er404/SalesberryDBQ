/*******************************************************
Salesberry Queries GUI class.
 @author Salil Maharjan
 @since 11/26/2019
  ******************************************************** */

// *********************************************************
// ******************** Package and Imports ****************
// *********************************************************
package salesberryapp;
import javax.swing.border.*;
import com.sun.tools.jconsole.JConsolePlugin;
import dnl.utils.text.table.TextTable;
import salesberryapp.dbconnect;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import net.miginfocom.swing.*;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Scanner;

import java.util.*;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;


public class Salesberry extends JPanel {
    // *********************************************************
    // ******************** Member Variable ********************
    // *********************************************************
    // Variable holding connection to DB.
    public static Connection connection;

    // *********************************************************
    // ******************** Class Constructor ******************
    // *********************************************************
    public Salesberry() {
        initComponents();
    }

    // *********************************************************
    // **Action listener to get Query 1 and display results.****
    // *********************************************************
    private void getQuery1(ActionEvent e){
        // Clearing text area and initializing columns for query.
        // Used if output is needed in a text area.
        // Previous Implementation. (Saved here as a reusable block)
//        queryResult.setText("");

        String[] columns = {"Branch ID", "Employee ID", "Employee Name", "Employee Salary"};
        // Buffer to get query items
        List<String[]> dataList = new ArrayList<String[]>();

        // Query the database
        Statement stmt;
        ResultSet rs;

        try{
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT branchid, employeeid, empfirstname || ' ' || emplastname AS NAME, salary from employee where (salary>26000 AND jobid='BR_MG') ORDER BY salary DESC");

            while(rs.next()){
                dataList.add(new String[] {rs.getString("branchid"), rs.getString("employeeid"), rs.getString("NAME"),
                        rs.getString("salary")});
            }

        } catch(SQLException f){
            System.out.println("Error quering the database. Check query.");
        }
        // Initialize object which is used to print table using the buffer.
        Object[][] result = new Object[dataList.size()][4];
        for(int i=0;i<dataList.size();i++){
            result[i][0]=dataList.get(i)[0];
            result[i][1]=dataList.get(i)[1];
            result[i][2]=dataList.get(i)[2];
            result[i][3]=dataList.get(i)[3];
        }

		// Table creation using TextTables (dnl.utils.text.table.TextTable)
        // Class textOutputStream is used to override Printstream so that
        // the output is recorded in the Jtext area in the GUI instead of the console.
        // Part of previous implementation: (Saved here as a reusable block)
//         Create table
//        TextTable tt = new TextTable(columns, result);
//        tt.setAddRowNumbering(true);
//
//        // Set Print Stream to text area and print content.
//        PrintStream printStream = new PrintStream(new textOutputStream(queryResult));
//        System.setOut(printStream);
//        tt.printTable();

        // Create and display table
        JTable table = new JTable(result, columns);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setCellSelectionEnabled(false);
        table.setFillsViewportHeight(false);
        JFrame f = new JFrame();
        f.setTitle("Branch Managers earning more than 26,000.");
        f.setSize(500, 300);
        f.add(new JScrollPane(table));
        f.setVisible(true);

    }
    // *********************************************************
    // **Action listener to get Query 2 and display results.****
    // *********************************************************
    private void getQuery2(ActionEvent e) {
        String[] columns = {"Employee Name", "Employee Phone", "Branch Name", "Branch Location"};
        // Buffer to get query items
        List<String[]> dataList = new ArrayList<String[]>();

        // Query the database
        Statement stmt;
        ResultSet rs;

        try{
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT empfirstname || ' ' || emplastname AS NAME, empphone, branchname, branchlocation from employee JOIN branch USING (branchid)");

            while(rs.next()){
                dataList.add(new String[] {rs.getString("NAME"), rs.getString("empphone"), rs.getString("branchname"),
                        rs.getString("branchlocation")});
            }
        } catch(SQLException f){
            System.out.println("Error quering the database. Check query.");
        }
        // Initialize object which is used to print table using the buffer.
        Object[][] result = new Object[dataList.size()][4];
        for(int i=0;i<dataList.size();i++){
            result[i][0]=dataList.get(i)[0];
            result[i][1]=dataList.get(i)[1];
            result[i][2]=dataList.get(i)[2];
            result[i][3]=dataList.get(i)[3];
        }

        // Create and display Table
        JTable table = new JTable(result, columns);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setCellSelectionEnabled(false);
        table.setFillsViewportHeight(false);
        JFrame f = new JFrame();
        f.setTitle("Employee - Branch information (Inner Join)");
        f.setSize(500, 300);
        f.add(new JScrollPane(table));
        f.setVisible(true);

    }

    // *********************************************************
    // **Action listener to get Query 3 and display results.****
    // *********************************************************
    private void getQuery3(ActionEvent e) {
        String[] columns = {"Employee Name", "Employee Phone", "Branch Name", "Branch Location"};
        // Buffer to get query items
        List<String[]> dataList = new ArrayList<String[]>();

        // Query the database
        Statement stmt;
        ResultSet rs;

        try{
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT empfirstname || ' ' || emplastname AS NAME, empphone, branchname, branchlocation from employee FULL OUTER JOIN branch USING (branchid)");

            while(rs.next()){
                dataList.add(new String[] {rs.getString("NAME"), rs.getString("empphone"), rs.getString("branchname"),
                        rs.getString("branchlocation")});
            }

        } catch(SQLException f){
            System.out.println("Error quering the database. Check query.");
        }

        // Initialize object which is used to print table using the buffer.
        Object[][] result = new Object[dataList.size()][4];
        for(int i=0;i<dataList.size();i++){
            result[i][0]=dataList.get(i)[0];
            result[i][1]=dataList.get(i)[1];
            result[i][2]=dataList.get(i)[2];
            result[i][3]=dataList.get(i)[3];
        }
        // Create and display Table
        JTable table = new JTable(result, columns);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setCellSelectionEnabled(false);
        table.setFillsViewportHeight(false);
        JFrame f = new JFrame();
        f.setTitle("Employee - Branch information (Outer Join)");
        f.setSize(500, 300);
        f.add(new JScrollPane(table));
        f.setVisible(true);
    }

    // *********************************************************
    // **Action listener to get Query 4 and display results.****
    // *********************************************************
    private void getQuery4(ActionEvent e) {
        String[] columns = {"Job ID", "Job Title", "Highest Job Salary"};
        // Buffer to get query items
        List<String[]> dataList = new ArrayList<String[]>();

        // Query the database
        Statement stmt;
        ResultSet rs;

        try{
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT jobid, jobtitle, MAX(salary) AS HIGHEST_JOB_SALRY FROM employee join job using (jobid) GROUP BY jobid, jobtitle ORDER BY MAX(salary) DESC");

            while(rs.next()){
                dataList.add(new String[] {rs.getString("jobid"), rs.getString("jobtitle"), rs.getString("HIGHEST_JOB_SALRY")});
            }

        } catch(SQLException f){
            System.out.println("Error quering the database. Check query.");
        }
        // Initialize object which is used to print table using the buffer.
        Object[][] result = new Object[dataList.size()][3];
        for(int i=0;i<dataList.size();i++){
            result[i][0]=dataList.get(i)[0];
            result[i][1]=dataList.get(i)[1];
            result[i][2]=dataList.get(i)[2];
        }
        // Create and display Table
        JTable table = new JTable(result, columns);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setCellSelectionEnabled(false);
        table.setFillsViewportHeight(false);
        JFrame f = new JFrame();
        f.setTitle("Highest salary received in each job.");
        f.setSize(500, 300);
        f.add(new JScrollPane(table));
        f.setVisible(true);
    }

    // *********************************************************
    // **Action listener to get Query 5 and display results.****
    // *********************************************************
    private void getQuery5(ActionEvent e) {
        String[] columns = {"Job ID", "Job Title", "Highest Job Salary(>15000)"};
        // Buffer to get query items
        List<String[]> dataList = new ArrayList<String[]>();

        // Query the database
        Statement stmt;
        ResultSet rs;

        try{
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT jobid, jobtitle, MAX(salary) AS HIGHEST_JOB_SALRY FROM employee join job using (jobid) GROUP BY jobid, jobtitle HAVING MAX(SALARY)>15000 ORDER BY MAX(salary) DESC");

            while(rs.next()){
                dataList.add(new String[] {rs.getString("jobid"), rs.getString("jobtitle"), rs.getString("HIGHEST_JOB_SALRY")});
            }

        } catch(SQLException f){
            System.out.println("Error quering the database. Check query.");
        }
        // Initialize object which is used to print table using the buffer.
        Object[][] result = new Object[dataList.size()][3];
        for(int i=0;i<dataList.size();i++){
            result[i][0]=dataList.get(i)[0];
            result[i][1]=dataList.get(i)[1];
            result[i][2]=dataList.get(i)[2];
        }
        // Create and display Table
        JTable table = new JTable(result, columns);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setCellSelectionEnabled(false);
        table.setFillsViewportHeight(false);
        JFrame f = new JFrame();
        f.setTitle("Highest salary (above 15,000) received in each job. ");
        f.setSize(500, 300);
        f.add(new JScrollPane(table));
        f.setVisible(true);
    }

    // *********************************************************
    // **Action listener to get Query 6 and display results.****
    // *********************************************************
    private void getQuery6(ActionEvent e) {
        String[] columns = {"Employee Name", "Purchase ID", "Exact DATETIME of purchase"};
        // Buffer to get query items
        List<String[]> dataList = new ArrayList<String[]>();

        // Query the database
        Statement stmt;
        ResultSet rs;

        try{
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT SUBSTR(empfirstname,1,1) || ' ' || emplastname AS EMPLOYEE_NAME, purchaseid, to_char(purchasedate, 'Day\" of\" DD Month YYYY - HH24:MI:SS') AS PURCHASE_DATE from employee join purchase USING (employeeid) ");

            while(rs.next()){
                dataList.add(new String[] {rs.getString("EMPLOYEE_NAME"), rs.getString("purchaseid"), rs.getString("PURCHASE_DATE")});
            }

        } catch(SQLException f){
            System.out.println("Error quering the database. Check query.");
        }
        // Initialize object which is used to print table using the buffer.
        Object[][] result = new Object[dataList.size()][3];
        for(int i=0;i<dataList.size();i++){
            result[i][0]=dataList.get(i)[0];
            result[i][1]=dataList.get(i)[1];
            result[i][2]=dataList.get(i)[2];
        }
        // Create and display Table
        JTable table = new JTable(result, columns);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setCellSelectionEnabled(false);
        table.setFillsViewportHeight(false);
        JFrame f = new JFrame();
        f.setTitle("Employee who processed the purchase.");
        f.setSize(500, 300);
        f.add(new JScrollPane(table));
        f.setVisible(true);
    }

    // *********************************************************
    // **Action listener to get Query 7 and display results.****
    // *********************************************************
    private void getQuery7(ActionEvent e) {
        String[] columns = {"Employee Name", "Salary", "Job Title"};
        // Buffer to get query items
        List<String[]> dataList = new ArrayList<String[]>();

        // Query the database
        Statement stmt;
        ResultSet rs;

        try{
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT SUBSTR(empfirstname,1,1) || ' ' || emplastname AS EMPLOYEE_NAME, salary, jobtitle from employee join job USING (jobid) where (jobid, salary) IN(SELECT jobid, MAX(salary) FROM employee GROUP BY jobid)");

            while(rs.next()){
                dataList.add(new String[] {rs.getString("EMPLOYEE_NAME"), rs.getString("salary"), rs.getString("jobtitle")});
            }

        } catch(SQLException f){
            System.out.println("Error quering the database. Check query.");
        }
        // Initialize object which is used to print table using the buffer.
        Object[][] result = new Object[dataList.size()][3];
        for(int i=0;i<dataList.size();i++){
            result[i][0]=dataList.get(i)[0];
            result[i][1]=dataList.get(i)[1];
            result[i][2]=dataList.get(i)[2];
        }
        // Create and display Table
        JTable table = new JTable(result, columns);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setCellSelectionEnabled(false);
        table.setFillsViewportHeight(false);
        JFrame f = new JFrame();
        f.setTitle("Highest salary earning employee in each job.");
        f.setSize(500, 300);
        f.add(new JScrollPane(table));
        f.setVisible(true);
    }

    // *********************************************************
    // *************** GUI components initializer***************
    // *********************************************************
    private void initComponents() {
        // JFormDesigner - Component initialization.
        label1 = new JLabel();
        separator1 = new JSeparator();
        hSpacer1 = new JPanel(null);
        query1 = new JLabel();
        button1 = new JButton();
        hSpacer3 = new JPanel(null);
        query2 = new JLabel();
        button2 = new JButton();
        hSpacer2 = new JPanel(null);
        query3 = new JLabel();
        button3 = new JButton();
        hSpacer4 = new JPanel(null);
        query4 = new JLabel();
        button4 = new JButton();
        hSpacer5 = new JPanel(null);
        query5 = new JLabel();
        button5 = new JButton();
        hSpacer6 = new JPanel(null);
        query6 = new JLabel();
        button6 = new JButton();
        hSpacer7 = new JPanel(null);
        query7 = new JLabel();
        button7 = new JButton();
        label2 = new JLabel();

        //======== this ========
        setBackground(Color.darkGray);
        setBorder(new LineBorder(Color.white, 1, true));
        setForeground(Color.white);
        setFont(new Font("Segoe UI Historic", Font.PLAIN, 16));
        setBorder(new javax.swing.border.CompoundBorder(new javax.swing.border.TitledBorder(new javax.
        swing.border.EmptyBorder(0,0,0,0), "JF\u006frm\u0044es\u0069gn\u0065r \u0045va\u006cua\u0074io\u006e",javax.swing.border
        .TitledBorder.CENTER,javax.swing.border.TitledBorder.BOTTOM,new java.awt.Font("D\u0069al\u006fg"
        ,java.awt.Font.BOLD,12),java.awt.Color.red), getBorder
        ())); addPropertyChangeListener(new java.beans.PropertyChangeListener(){@Override public void propertyChange(java
        .beans.PropertyChangeEvent e){if("\u0062or\u0064er".equals(e.getPropertyName()))throw new RuntimeException
        ();}});
        setLayout(new MigLayout(
            "hidemode 3",
            // columns
            "[30,fill]" +
            "[fill]" +
            "[392,fill]" +
            "[57,fill]",
            // rows
            "[26]" +
            "[]" +
            "[]" +
            "[]" +
            "[]" +
            "[]" +
            "[]" +
            "[]" +
            "[]" +
            "[]"));

        //---- label1 ----
        label1.setText("Salesberry Database Queries");
        label1.setHorizontalAlignment(SwingConstants.CENTER);
        label1.setBackground(Color.black);
        label1.setForeground(Color.white);
        label1.setFont(new Font("Stencil", Font.PLAIN, 35));
        add(label1, "cell 0 0 4 1");
        add(separator1, "cell 2 1,width 1");

        //---- hSpacer1 ----
        hSpacer1.setForeground(new Color(60, 63, 65));
        hSpacer1.setBackground(Color.darkGray);
        add(hSpacer1, "cell 0 2");

        //---- query1 ----
        query1.setText("Branch Managers earning more than 26,000. ");
        query1.setForeground(Color.white);
        add(query1, "cell 2 2");

        //---- button1 ----
        button1.setText("GET");
        button1.setFont(new Font("Segoe UI Historic", Font.PLAIN, 12));
        button1.setForeground(Color.white);
        button1.setBackground(Color.gray);
        button1.addActionListener(e -> getQuery1(e));
        add(button1, "cell 3 2");

        //---- hSpacer3 ----
        hSpacer3.setForeground(new Color(60, 63, 65));
        hSpacer3.setBackground(Color.darkGray);
        add(hSpacer3, "cell 0 3");

        //---- query2 ----
        query2.setText("Employee - Branch information (Inner Join)");
        query2.setForeground(Color.white);
        add(query2, "cell 2 3");

        //---- button2 ----
        button2.setText("GET");
        button2.setFont(new Font("Segoe UI Historic", Font.PLAIN, 12));
        button2.setForeground(Color.white);
        button2.setBackground(Color.gray);
        button2.addActionListener(e -> getQuery2(e));
        add(button2, "cell 3 3");

        //---- hSpacer2 ----
        hSpacer2.setForeground(new Color(60, 63, 65));
        hSpacer2.setBackground(Color.darkGray);
        add(hSpacer2, "cell 0 4");

        //---- query3 ----
        query3.setText("Employee - Branch information (Outer Join)");
        query3.setForeground(Color.white);
        add(query3, "cell 2 4");

        //---- button3 ----
        button3.setText("GET");
        button3.setFont(new Font("Segoe UI Historic", Font.PLAIN, 12));
        button3.setForeground(Color.white);
        button3.setBackground(Color.gray);
        button3.addActionListener(e -> getQuery3(e));
        add(button3, "cell 3 4");

        //---- hSpacer4 ----
        hSpacer4.setForeground(new Color(60, 63, 65));
        hSpacer4.setBackground(Color.darkGray);
        add(hSpacer4, "cell 0 5");

        //---- query4 ----
        query4.setText("Highest salary received in each job.");
        query4.setForeground(Color.white);
        add(query4, "cell 2 5");

        //---- button4 ----
        button4.setText("GET");
        button4.setFont(new Font("Segoe UI Historic", Font.PLAIN, 12));
        button4.setForeground(Color.white);
        button4.setBackground(Color.gray);
        button4.addActionListener(e -> getQuery4(e));
        add(button4, "cell 3 5");

        //---- hSpacer5 ----
        hSpacer5.setForeground(new Color(60, 63, 65));
        hSpacer5.setBackground(Color.darkGray);
        add(hSpacer5, "cell 0 6");

        //---- query5 ----
        query5.setText("Highest salary (above 15,000) received in each job. ");
        query5.setForeground(Color.white);
        add(query5, "cell 2 6");

        //---- button5 ----
        button5.setText("GET");
        button5.setFont(new Font("Segoe UI Historic", Font.PLAIN, 12));
        button5.setForeground(Color.white);
        button5.setBackground(Color.gray);
        button5.addActionListener(e -> getQuery5(e));
        add(button5, "cell 3 6");

        //---- hSpacer6 ----
        hSpacer6.setForeground(new Color(60, 63, 65));
        hSpacer6.setBackground(Color.darkGray);
        add(hSpacer6, "cell 0 7");

        //---- query6 ----
        query6.setText("Employee who processed the purchase.");
        query6.setForeground(Color.white);
        add(query6, "cell 2 7");

        //---- button6 ----
        button6.setText("GET");
        button6.setFont(new Font("Segoe UI Historic", Font.PLAIN, 12));
        button6.setForeground(Color.white);
        button6.setBackground(Color.gray);
        button6.addActionListener(e -> getQuery6(e));
        add(button6, "cell 3 7");

        //---- hSpacer7 ----
        hSpacer7.setForeground(new Color(60, 63, 65));
        hSpacer7.setBackground(Color.darkGray);
        add(hSpacer7, "cell 0 8");

        //---- query7 ----
        query7.setText("Highest salary earning employee in each job.");
        query7.setForeground(Color.white);
        add(query7, "cell 2 8");

        //---- button7 ----
        button7.setText("GET");
        button7.setFont(new Font("Segoe UI Historic", Font.PLAIN, 12));
        button7.setForeground(Color.white);
        button7.setBackground(Color.gray);
        button7.addActionListener(e -> getQuery7(e));
        add(button7, "cell 3 8");

        //---- label2 ----
        label2.setText("Author: Salil Maharjan");
        label2.setForeground(Color.white);
        add(label2, "cell 3 9");

    }

    // *********************************************************
    // ************* JForm GUI variable declaration ************
    // *********************************************************
    private JLabel label1;
    private JSeparator separator1;
    private JPanel hSpacer1;
    private JLabel query1;
    private JButton button1;
    private JPanel hSpacer3;
    private JLabel query2;
    private JButton button2;
    private JPanel hSpacer2;
    private JLabel query3;
    private JButton button3;
    private JPanel hSpacer4;
    private JLabel query4;
    private JButton button4;
    private JPanel hSpacer5;
    private JLabel query5;
    private JButton button5;
    private JPanel hSpacer6;
    private JLabel query6;
    private JButton button6;
    private JPanel hSpacer7;
    private JLabel query7;
    private JButton button7;
    private JLabel label2;

    // *********************************************************
    // ****************** Initialize GUI ***********************
    // *********************************************************
    public void initGUI(){
        JFrame frame = new JFrame("SalesBerry Query Application");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setContentPane(new Salesberry());
        frame.pack();
        frame.setVisible(true);
    }

    // *********************************************************
    // ****************** Main Method **************************
    // *********************************************************
    public static void main(String[] args) {
        // Load GUI
        Salesberry inst = new Salesberry();
        inst.initGUI();

        // Load driver and connect to DB
        dbconnect db = new dbconnect();
        connection = db.connectToDB();
    }

}
