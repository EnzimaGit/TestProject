import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

public class ValidateTextInFileTest {

    public static void main(String[] args) {
        String fileWithContent = "C:\\Users\\afonsojp\\Desktop\\new 60.txt";
        String fileWithList = "C:\\Users\\afonsojp\\Desktop\\new 59.txt";


        Path file = Paths.get(fileWithContent);

        StringBuilder contentBuilder = new StringBuilder();

        try (Stream<String> stream = Files.lines( Paths.get(file.toString()), StandardCharsets.UTF_8))
        {
            stream.forEach(s -> contentBuilder.append(s).append("\n"));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        String fileContent = contentBuilder.toString();

        List<String> listToFind = new ArrayList<>();

        Path file2 = Paths.get(fileWithList);

        try {
            listToFind = Files.readAllLines( Paths.get(file2.toString()), StandardCharsets.UTF_8);
        } catch (IOException e) {
            e.printStackTrace();
        }

        Matcher matcher;
        for (String s : listToFind) {
            Pattern pattern = Pattern.compile(s, Pattern.CASE_INSENSITIVE);
            matcher = pattern.matcher(fileContent);

            if(matcher.find()){
                System.out.println("Found " + s);
            }
        }



    }
}
