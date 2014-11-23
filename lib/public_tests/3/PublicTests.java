import static org.junit.Assert.assertArrayEquals;

public class PublicTests {
	public static void main(String[] args) {
		int[] a = new int[] { 35, 7, 63, 42, 24, 21 };
		int[][] b = new int[][] { new int[] { 7, 35, 63, 42, 24, 21 },
				new int[] { 7, 21, 63, 42, 24, 35 },
				new int[] { 7, 21, 24, 42, 63, 35 },
				new int[] { 7, 21, 24, 35, 63, 42 },
				new int[] { 7, 21, 24, 35, 42, 63 },
				new int[] { 7, 21, 24, 35, 42, 63 } };
		int[][] c = Functionality.selctionsort(a);
		for (int i = 0; i < 6; i++)
			assertArrayEquals(b[i], c[i]);
	}

}
