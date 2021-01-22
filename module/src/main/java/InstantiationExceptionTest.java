import javax.xml.datatype.XMLGregorianCalendar;
import java.util.Calendar;

public class InstantiationExceptionTest {
    public static void main(String[] args) {
        Class c1 = Calendar.class;
        try {
            c1.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }
}
