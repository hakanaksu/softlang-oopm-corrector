import static org.junit.Assert.*;

public class PublicTests {
	public static void main(String[] args) {
		boolean[][] testArray0 = 
			{{true}};
		
		boolean[][] testArray1 = 
			{{true,true,true,true},
			 {true,true,true,true}};
		
		boolean[][] testArray2 = 
			{{true,true,true},
			 {true,false,true},
			 {true,true,true}};
		
		boolean[][] testArray3 = 
			{{true,true,true,true},
			 {true,false,false,true},
			 {true,false,false,true},
			 {true,false,false,true},
			 {true,false,false,true},
			 {true,true,true,true}};
		
		assertArrayEquals(testArray0, Functionality.rectangleArray(1,1));
		assertArrayEquals(testArray1, Functionality.rectangleArray(2,4));
		assertArrayEquals(testArray2, Functionality.rectangleArray(3,3));
		assertArrayEquals(testArray3, Functionality.rectangleArray(6,4));
		
		String testString = 
				"true" + "\t" + "true" + "\t" + "true" + "\t" +"true" + "\t" + "\n" +
				"true" + "\t" + "false" + "\t" + "false" + "\t"+"true" + "\t" + "\n" +
				"true" + "\t" + "false" + "\t" + "false" + "\t"+"true" + "\t" + "\n" +
				"true" + "\t" + "false" + "\t" + "false" + "\t"+"true" + "\t" + "\n" +
				"true" + "\t" + "false" + "\t" + "false" + "\t"+"true" + "\t" + "\n" +
				"true" + "\t" + "true" + "\t" + "true" + "\t" + "true" + "\t" + "\n";
		
		assertEquals(testString, Functionality.printArray(testArray3));
	}
}