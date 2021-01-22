import java.util.regex.Pattern;

public class RegexTest {
    public static void main(String[] args) {

//        String[] vats = new String[]{"pt 123 456 789", "pt a23 456 789", "UG1234567", "XX12345678"};
//
//        for (String vat : vats) {
//            if (vat != null) {
//                vat = vat.toUpperCase();
//                vat = vat.replaceAll("\\s", "");
//
//                if (Pattern.matches("[A-Z]{2}[A-Z0-9]{1,15}", vat) && Pattern.matches(".*[0-9]+.*", vat)) {    //valid vat
//                    System.out.println("Destination: " + vat.substring(0, 2));
//                    System.out.println("Y041: " + vat);
//                } else {    //invalid vat - use defaults
//                    System.out.println("Destination: DK");
//                    System.out.println("Y041: " + "DK1");
//                }
//            }
//        }


        String[] taxes = new String[]{"3.500,00", "3.3.3,00", "3.3.", "3,0.01", "3000", "3500,1", "3,0.1", "1111111112", "111111111,000", "111111111,00"};

        for (String tax : taxes) {
            tax = tax.replaceAll("\\.", "");

            if (!Pattern.matches("\\d{1,9}(,[0-9]{1,2})?", tax)) {
                System.out.println("invalid tax base: " + tax);
            } else {
                System.out.println("valid tax: " + tax);
            }
        }
    }
}
