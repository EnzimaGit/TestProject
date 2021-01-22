import java.util.Calendar;

public class TestLXRPeriod {

    public static void main(String[] args) {
        int month = 1;
        String monthstr = "";
        for (int i=0; i<args.length; i++) {
            if (args[i].equalsIgnoreCase("period")) monthstr=args[i+1];
        }
        if (monthstr.equals("")) {
            try {
                Calendar rightNow = Calendar.getInstance();
                month = 1 + rightNow.get(Calendar.MONTH); // 0-11
                if (month==1) {
                    monthstr = "12,1";
                } else
                    monthstr = (month-1)+","+month;
            } catch (Exception e) {
                month = 6;
            }
        }

        System.out.println("month: " +month);
        System.out.println("monthstr: " + monthstr);
    }
}
