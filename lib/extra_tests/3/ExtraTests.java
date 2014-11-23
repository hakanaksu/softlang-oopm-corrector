import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertNull;

public class ExtraTests {
	public static void main(String[] args) {
		int[] a = new int[] { 8, 3, -2, 0, -7, 5, 9 };
		int[][] b = new int[][] { new int[] { -7, 3, -2, 0, 8, 5, 9 },
				new int[] { -7, -2, 3, 0, 8, 5, 9 },
				new int[] { -7, -2, 0, 3, 8, 5, 9 },
				new int[] { -7, -2, 0, 3, 8, 5, 9 },
				new int[] { -7, -2, 0, 3, 5, 8, 9 },
				new int[] { -7, -2, 0, 3, 5, 8, 9 },
				new int[] { -7, -2, 0, 3, 5, 8, 9 } };
		int[][] c = Functionality.selctionsort(a);
		for (int i = 0; i < 7; i++)
			assertArrayEquals(b[i], c[i]);

		a = new int[0];
		c = new int[0][0];
		assertArrayEquals(c, Functionality.selctionsort(a));
		a = new int[] { 5 };
		c = new int[][] { new int[] { 5 } };
		assertArrayEquals(c, Functionality.selctionsort(a));
	}

}
