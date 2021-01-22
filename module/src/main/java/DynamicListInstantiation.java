import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DynamicListInstantiation {
    public static void main(String[] args) {
        List<String> list = new ArrayList<String>();
        list.add("a");

        Object obj = list;
        Object[] obj2 = ((List) obj).toArray();

        System.out.println(((List) obj).toArray()[0].getClass());
    }
}
