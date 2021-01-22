import java.io.*;
import java.util.Properties;

public class PropertiesFile {

    public static void main(String[] args) {
        File cfgFile = new File("/taglib.properties");
        InputStream is = null;
        try {
            is = new FileInputStream(cfgFile);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        Properties props = new Properties();
        try {
            props.load(is);
            props.getProperty("a");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
//    public static void main(String[] args) {
//        Properties prop = new Properties();
//        try {
//            prop.load(PropertiesFile.class.getResourceAsStream("test.properties"));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
}
