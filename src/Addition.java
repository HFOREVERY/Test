import java.util.Scanner;
public class Addition {

	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		int num;
		int score=0;
		for(int i=1;i<=10;i++) {
			System.out.println("算吧！");
			int a=(int)(Math.random()*100+1),b=(int)(Math.random()*100+1);
			System.out.println("("+i+")"+a+"+"+b+"=?");
			num=scan.nextInt();
			if(num==-1) {
				break;
			}
			else if(a+b==num) {
				System.out.println("答对了！");
				score+=10;
			}
			else {
				System.out.println("答错了！");
			}
		}
		System.out.println("总分为："+score);
	}

}
