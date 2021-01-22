import java.util.Vector;

public class VectorLiveList {
    public static void main(String[] args) {

        class Whatever{
            private String s1 = null;
            private String s2 = null;


            public String getS1() {
                return s1;
            }

            public void setS1(String s1) {
                this.s1 = s1;
            }

            public String getS2() {
                return s2;
            }

            public void setS2(String s2) {
                this.s2 = s2;
            }
        }

        Vector<Whatever> vector = new Vector<Whatever>();
        Whatever w1 = new Whatever();
        w1.setS1("cenas");
        vector.add(w1);
        System.out.println(vector.get(0).getS1());
        vector.get(0).setS1("coisas");
        System.out.println(vector.get(0).getS1());
    }
}
