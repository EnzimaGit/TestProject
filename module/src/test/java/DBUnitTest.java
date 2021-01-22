import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Arrays;

import org.dbunit.DatabaseTestCase;
import org.dbunit.database.DatabaseConnection;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.junit.Test;

public class DBUnitTest extends DatabaseTestCase {
    public static final String TABLE_LOGIN = "salarydetails";
    private FlatXmlDataSet loadedDataSet;
    private SalaryCalculation salaryCalicutation;
    private Connection jdbcConnection;

    /** * Provide a connection to the database * @return IDatabaseConnection */
    protected IDatabaseConnection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        jdbcConnection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Company", "root", "");
        return new DatabaseConnection(jdbcConnection);
    }

    /** * Load the data which will be inserted for the test * @return IDataSet */
    protected IDataSet getDataSet() throws Exception {
        loadedDataSet = new FlatXmlDataSet(this.getClass().getClassLoader()
                .getResourceAsStream("dbunitData.xml"));
        return loadedDataSet;
    }

    /** * Test case for calculator * positive scenario---Valid Employee */
    @Test
    public void testCalculator() throws SQLException {
        salaryCalicutation = new SalaryCalculation();
        int salary = salaryCalicutation.calculator("24356A");
        assertEquals(13245, salary);
    }

    /** *Test case for calculator *negative scenario---InValid Employee */
    @Test
    public void testCalculatorNeg() throws SQLException {
        String[] array = null;
        Arrays.asList(array);

        salaryCalicutation = new SalaryCalculation();
        int salary = salaryCalicutation.calculator("24356B");
        assertEquals(0, salary);
    }
}