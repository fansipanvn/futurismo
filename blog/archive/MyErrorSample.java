import java.lang.Exception;
public class MyErrorSample {
	public static void main (String args[]) {
		try {
			throw new MyException (5);
		}
		catch (MyException e) {
			e.printStackTrace ();
			System.out.println ("ErrorCode = " + e.getCode ());
		}
	}
}

class MyException extends Exception {
	int errorCode;
		
	MyException (int errorCode) {
		this.errorCode = errorCode;
	}

	int getCode () {
		return errorCode;
	}
}