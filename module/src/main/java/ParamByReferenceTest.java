public class ParamByReferenceTest {

    public static void main(String[] args) {
        int i = 0;


        boolean testPrimite = false;
        Boolean testObject = false;

        changeParameter(testPrimite);
        changeParameter(testObject);

        System.out.println(testPrimite);
        System.out.println(testObject);
    }

    private static void changeParameter(boolean param){
        param = true;
    }

    private static void changeParameter(Boolean param){
        param = true;
    }
}
