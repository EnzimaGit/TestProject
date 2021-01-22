import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class TreeMapTest {

    public static void main(String[] args) {
        Map<String, String> unordered = new HashMap<>();
        Map<String, String> ordered = new TreeMap<>();

        unordered.put("1","c");
        unordered.put("2","a");
        unordered.put("3","b");

        ordered.put("1", "c");
        ordered.put("2", "a");
        ordered.put("3", "b");

        System.out.println(unordered.toString());
        System.out.println(ordered.toString());
    }
}
