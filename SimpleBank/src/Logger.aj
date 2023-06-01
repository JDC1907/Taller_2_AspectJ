import java.io.File;
import java.util.Calendar;
import com.bank.*;
import java.io.File;
import java.util.Calendar;
import com.bank.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.*;


public aspect Logger {

	 Calendar cal = Calendar.getInstance();
	 pointcut transaction() : call(* Bank.moneyMakeTransaction (..) );
	 after() : transaction() {
		 try {
			 FileWriter writer = new FileWriter("Logg.txt", true);
		     BufferedWriter bf = new BufferedWriter(writer);
		     bf.write("Transacción exitosa a las: "+cal.get(Calendar.HOUR_OF_DAY)+"H"+":"+cal.get(Calendar.MINUTE)+"m");
		     bf.newLine();
		     bf.close();			 
		 }catch (IOException e) {
	         e.printStackTrace();
		 } System.out.println("Transacción exitosa a las: "+cal.get(Calendar.HOUR_OF_DAY)+"H"+":"+cal.get(Calendar.MINUTE)+"m");

		 }
	 
	 
	 
}