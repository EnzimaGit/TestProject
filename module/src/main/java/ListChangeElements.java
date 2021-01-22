import java.util.ArrayList;
import java.util.List;

public class ListChangeElements {
    public static void main(String[] args) {
        List<String> result = new ArrayList<>();
        result.add("12345");
        result.add("00345");

        for (int i = 0; i < result.size(); i++) {
            result.set(i, result.get(i).substring(2));  //Remove the first two chars of the value (type) and keep only the actual format
        }
        for (String s : result) {
            System.out.println(s);
        }
    }
}
