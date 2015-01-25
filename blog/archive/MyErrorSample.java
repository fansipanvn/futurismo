import java.lang.Exception;
public class MyErrorSample {
  static final int TEST = 1;
  static final int TESTTEST = 1;
  static final int TESTTESTTTTT = 1;
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
