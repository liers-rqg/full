package pr;
import java.util.Scanner;
public class Homework11 {
	 //判断状态
    public static boolean state(String str) {
        String s[] = str.split(",");
        if(s[2].equals("A")) {
            return true;
        }
        return false;
    }
 
    //异或计算
    public static boolean check(String s) {
        char[] schar = s.toCharArray();
        int a = 0;
        for(int i=1;i<schar.length-3;i++) {
            a = (char) (a^schar[i]);
        }
        a = (a%65536);
        String b = Integer.toHexString(a);
        if(s.substring(s.length()-2).contentEquals(b)) {
            return true;
        }
        return false;  
    }
     
    //时间计算
    public static String time(String str) {
        String s[] = str.split(",");
         
        Integer h1 = Integer.valueOf(s[1].substring(0, 2));
        Integer m1 = Integer.valueOf(s[1].substring(2, 4));
        Integer s1 = Integer.valueOf(s[1].substring(4, 6));
         
//      s1=00;
//      m1=00;
//      h1=24;
         
         
         
        int h2 = h1+8;
         
        if(h2>=24) {
            h2=h2-24;
        }
         
        String time = timeChange(h2)+":"+timeChange(m1)+":"+timeChange(s1);
         
        return time;
    }
     
     
    //补0规则
    public static String timeChange(int i) {
        String str = null;
        if(i<10) {
            str = "0"+i;
        }
        else {
            str = ""+i;
        }
        return str;
         
    }
     
    public static void main(String[] args) {
        // TODO Auto-generated method stub
         
//      String s = "$GPRMC,024813.640,A,3158.4608,N,11848.3737,E,10.05,324.27,150706,,,A*50";
//      System.out.println(check(s));
         
        Scanner in = new Scanner(System.in);
        String s1[] = new String[1000];
        int n = 0;
        int len = 0;
         
         
        //找出所有GPRMC语句
        END:
        for(int i=0;i<s1.length;i++) {
            for(int j=i+n;j<s1.length;j++) {
                String a = in.nextLine();
                if(!a.equals("END")) {
                    if(a.startsWith("$GPRMC")) {
                        s1[i]=a;
                        len++;      // 存储的PQPRMC语句数量
                        break;
                    }
                    else {
                        n++;
                    }
                }
                else {
                    break END;
                }   
            }
        }
         
        String str = new String();
        for(int i=0;i<len;i++) {
            if(state(s1[i])&&check(s1[i])) {
                str = s1[i];          //只要最后一条正确的
            }
        }
         
        System.out.println(time(str));
         
    }   

}
