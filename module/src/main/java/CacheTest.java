import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

public class CacheTest {

    public static void main(String[] args) {
        LoadingCache<String, Properties> cached = CacheBuilder.newBuilder().maximumSize(1024).refreshAfterWrite(1L, TimeUnit.HOURS).build(
                new CacheLoader<String, Properties>(){
                    public Properties load(String key){
                        System.out.println("cenas");
                        try(InputStream inputStream = new FileInputStream("C:\\TEMP\\EORIWhitelist.properties")){
                            Properties prop = new Properties();
                            prop.load(inputStream);
                            return prop;
                        } catch(IOException ex){
                            System.out.println("Could not load CVR whitelist file.");
                            return new Properties();
                        }
                    }
                }
        );

        try {
            cached.get("ALL");
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        System.out.println("end");
    }

//        return new Properties();
}
