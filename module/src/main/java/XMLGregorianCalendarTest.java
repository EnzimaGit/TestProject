import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeConstants;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class XMLGregorianCalendarTest {
    public static void main(String[] args) throws DatatypeConfigurationException {
        GregorianCalendar cal = new GregorianCalendar();
        XMLGregorianCalendar calendar = DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
        System.out.println(calendar);
        calendar.setTimezone( DatatypeConstants.FIELD_UNDEFINED );
        System.out.println(calendar);
    }
}
