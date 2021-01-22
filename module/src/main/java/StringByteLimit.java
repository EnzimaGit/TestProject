import java.io.UnsupportedEncodingException;

public class StringByteLimit {
    public static void main(String[] args) throws UnsupportedEncodingException {
        String input = "abcÅBC";
        String input2 = "Å";
        String input3 = "abcBCÅ";

        System.out.println(input.getBytes("UTF-8").length);
//        System.out.println(input2.getBytes("UTF-8").length);
//        System.out.println(input3.getBytes("UTF-8").length);
//        System.out.println(input3.substring(0, 7));
//        System.out.println(input3.substring(0, 7).getBytes().length);
        if(input.getBytes("UTF-8").length > 6) {
            System.out.println(input.substring(0, 5));
            System.out.println(input.substring(0, 5).getBytes("UTF-8").length);
        }

        if(input3.getBytes("UTF-8").length > 6) {
            System.out.println(input3.substring(0, 5));
            System.out.println(input3.substring(0, 5).getBytes("UTF-8").length);
        }

        System.out.println("=====================");
        System.out.println();
//        String input4 = "ÅÅÅÅÅÅÅÅÅÅ";
//        String input4 = "ÅÅaÅÅÅÅÅÅÅÅ";
//        String input4 = "ÅÅaÅÅÅÅÅÅÅ";
//        String input4 = "ÅaÅaÅaÅaÅaÅaÅaÅaÅa";
//        String input4 = "aÅaÅaÅaÅaÅaÅaÅaÅaÅ";
        String input4 = "aaaaaaaaaa";
        System.out.println(input4.length());
        System.out.println(input4.getBytes("UTF-8").length);

//        if(input4.getBytes("UTF-8").length > 5){
//            System.out.println(input4.substring(0, 5));
//            System.out.println(input4.substring(0, 5).getBytes("UTF-8").length);
//        }

//        while(true){
//            if(sub.getBytes("UTF-8").length > 5){
//                sub = sub.substring(0, 5 - (sub.substring(0, 5).getBytes("UTF-8").length - 5)/2);
//            } else{
//                break;
//            }

        String sub = input4;
        int maxValue = 6;
        while(true){
                if(sub.getBytes("UTF-8").length > maxValue){
                    int dif = sub.getBytes("UTF-8").length - maxValue ;
                    if (sub.substring(0, (dif/2)-1).getBytes("UTF-8").length < maxValue){
                        for(int i = 0; i < sub.length(); i++){
                            sub = sub.substring(0, sub.length()-1);
                            if(sub.getBytes("UTF-8").length <= maxValue){
                                break;
                            }
                        }
                        break;
                    } else{
                        sub = sub.substring(0, (dif/2)-1);
                    }
                }
        }

        System.out.println(sub);
        System.out.println(sub.length());
        System.out.println(sub.getBytes("UTF-8").length);
    }
}
