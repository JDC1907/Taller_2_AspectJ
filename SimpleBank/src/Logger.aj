import java.util.Calendar;
import com.bank.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;


public aspect Logger {

	 Calendar cal = Calendar.getInstance();
	 pointcut transaction() : call(* Bank.moneyMakeTransaction (..) );
	 after() : transaction() {
		 try {
			 FileWriter writer = new FileWriter("Log.txt", true);
		     BufferedWriter bf = new BufferedWriter(writer);
		     bf.write("Transacción exitosa a las: "+cal.get(Calendar.HOUR_OF_DAY)+"H"+":"+cal.get(Calendar.MINUTE)+"m");
		     bf.newLine();
		     bf.close();			 
		 }catch (IOException e) {
	         e.printStackTrace();
		 } System.out.println("Transacción exitosa a las: "+cal.get(Calendar.HOUR_OF_DAY)+"H"+":"+cal.get(Calendar.MINUTE)+"m");

		 }
	 
	 pointcut retiro() : call(* Bank.moneyWithdrawal (..) );
	 after() : retiro(){
		 try {
			 FileWriter writer = new FileWriter("Log.txt", true);
		     BufferedWriter bf = new BufferedWriter(writer);
		     bf.write("Retiro de dinero exitoso, a las: "+cal.get(Calendar.HOUR_OF_DAY)+"H"+":"+cal.get(Calendar.MINUTE)+"m");
		     bf.newLine();
		     bf.flush();
		     bf.close();
		 }catch (IOException e) {
	         e.printStackTrace();
		 } System.out.println("Retiro de dinero exitoso, a las: "+cal.get(Calendar.HOUR_OF_DAY)+"H"+":"+cal.get(Calendar.MINUTE)+"m");

	 
}
	 
}