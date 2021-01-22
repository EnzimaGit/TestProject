import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

public class DateInProperties {

    public static void main(String[] args) throws IOException, ParseException {
        Properties props = new Properties();
        InputStream inputStream = DateInProperties.class.getResourceAsStream("properties.properties");
        props.load(inputStream);
        String property = props.getProperty("a");
        DateFormat format = new SimpleDateFormat("yyyyMMdd-HHmmss");
        Date date = format.parse(property);
        System.out.println(date);
    }
}
