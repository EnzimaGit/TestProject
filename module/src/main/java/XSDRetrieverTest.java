import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

public class XSDRetrieverTest {

    public static void main(String[] args) {
        for(String file: args){
            doStuff(file);
        }
    }

    private static void doStuff(String arg){
        Path file = Paths.get(arg);
        Path wsdlDir = Paths.get(file.getRoot().toString() + file.subpath(0, file.getNameCount()-1));
        Path mainDir = Paths.get(file.getRoot().toString() + wsdlDir.subpath(0, wsdlDir.getNameCount()-1));
        Path schemaDir = Paths.get(mainDir + "/schema");

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

        Pattern pattern = Pattern.compile("include schemaLocation=\"(.*?.xsd)\"");
        Matcher matcher = pattern.matcher(fileContent);



        while(matcher.find()){
            String group = matcher.group(1);
            String fileName = group.contains("schema") ? group.substring(group.indexOf("/")+1) : group;

            Path copied = Paths.get(wsdlDir + "/" + fileName);
            Path originalPath = Paths.get(schemaDir + "/" + fileName);
            try {
                Files.copy(originalPath, copied, StandardCopyOption.REPLACE_EXISTING);
                System.out.println("Copied " + copied);
                doStuff(copied.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
