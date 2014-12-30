import java.util.List;
import java.util.ArrayList;

public class FunctionalMap {
	public static void main (String args[]) {
		List<Integer> xs = java.util.Arrays.asList (1,2,3,4,5);
		MyFunc<Integer> f = new MyFunc<Integer>() {
				public Integer evaluate (Integer x) { return x + 1; }
			};
		Functor<Integer> functor = new Functor<Integer>();
		
		List<Integer> ys = functor.map (f, xs);

		for (Integer y : ys){ System.out.print (y.toString () + " "); }
	}
}

class Functor<T> {
	public List<T> map (MyFunc<T> f, List<T> xs) {
		ArrayList<T> list = new ArrayList<T>();
		for (T x : xs) { list.add (f.evaluate (x)); }
		return list;
	}
}

interface MyFunc <T> {
	public T evaluate (T x);
}