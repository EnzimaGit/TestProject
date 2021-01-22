public class GetClassTest {
    public static void main(String[] args) {
        Whatever wtv = new Whatever();
        method(wtv);
    }



    private static void method(Object obj){
        System.out.println(obj.getClass());
    }

    static class Whatever extends Object{

    }
}
