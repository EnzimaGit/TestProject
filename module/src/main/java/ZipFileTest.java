import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipFileTest {

    public static void main(String[] args) throws IOException {

        String zipFile = "C:/TEMP/archive.zip";
        String srcDir = "C:/TEMP/ics-content-upgrade_v3_format";

        try {

            // create byte buffer
            byte[] buffer = new byte[1024];

            FileOutputStream fos = new FileOutputStream(zipFile);

            ZipOutputStream zos = new ZipOutputStream(fos);

            File dir = new File(srcDir);

            File[] files = dir.listFiles();

            for (int i = 0; i < files.length; i++) {

                if(files[i].isDirectory()){
                    File subDir = new File(srcDir+"/"+files[i].getName());

                    File[] subFiles = subDir.listFiles();

                    for(File file: subFiles) {
                        System.out.println("Adding file: " + file.getName());

                        FileInputStream fis = new FileInputStream(file);

                        // begin writing a new ZIP entry, positions the stream to the start of the entry data
                        zos.putNextEntry(new ZipEntry("ics-content-upgrade_v3_format"+File.separator+
                                files[i].getName()+File.separator+file.getName()));

                        int length;

                        while ((length = fis.read(buffer)) > 0) {
                            zos.write(buffer, 0, length);
                        }

                        zos.closeEntry();

                        // close the InputStream
                        fis.close();
                    }
                }else {

                    System.out.println("Adding file: " + files[i].getName());

                    FileInputStream fis = new FileInputStream(files[i]);

                    // begin writing a new ZIP entry, positions the stream to the start of the entry data
                    zos.putNextEntry(new ZipEntry("ics-content-upgrade_v3_format"+File.separator+files[i].getName()));

                    int length;

                    while ((length = fis.read(buffer)) > 0) {
                        zos.write(buffer, 0, length);
                    }

                    zos.closeEntry();

                    // close the InputStream
                    fis.close();
                }
            }

            // close the ZipOutputStream
            zos.close();

        }
        catch (IOException ioe) {
            System.out.println("Error creating zip file" + ioe);
        }

    }

}
