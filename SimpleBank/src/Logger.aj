import java.io.File;
import java.util.Calendar;
import com.bank.*;

public aspect Logger {
	
	 File file = new File("log.txt");
	 Calendar cal = Calendar.getInstance();
	 
	 pointcut transaction() : call(* Bank.moneyMakeTransaction (..) );
	 after() : transaction() {
		 System.out.println("Transacción exitosa a la hora: "+cal.get(Calendar.HOUR_OF_DAY));
		 }
	
}