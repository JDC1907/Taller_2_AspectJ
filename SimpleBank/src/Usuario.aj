import com.bank.*;

public aspect Usuario {
	pointcut success() : call(* Bank.createUser(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
}
