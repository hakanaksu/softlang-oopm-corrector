import static org.junit.Assert.*;

import org.junit.Test;

public class PublicTests {
	public static final float EPSILON = 10e-1f;

	@Test
	public void testNormalfall() {
		assertEquals(252, Functionality.binomialCoefficient(10, 5), EPSILON);
		assertEquals(3, Functionality.binomialCoefficient(3, 2), EPSILON);
		assertEquals(27132, Functionality.binomialCoefficient(19, 13),
				EPSILON);
	}
	
	@Test
	public void testNormalfall2() {
		assertEquals(658008, Functionality.binomialCoefficient(40, 35),
				EPSILON);
		assertEquals(324632, Functionality.binomialCoefficient(35, 30),
				EPSILON);
	}

	@Test
	public void testGrenzfall() {
		assertEquals(1, Functionality.binomialCoefficient(5, 0), EPSILON);
		assertEquals(5, Functionality.binomialCoefficient(5, 1), EPSILON);
		assertEquals(1, Functionality.binomialCoefficient(10, 0), EPSILON);
		assertEquals(10, Functionality.binomialCoefficient(10, 1), EPSILON);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFehler() {
		Functionality.binomialCoefficient(3, 5);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFloatingInput1() {
		Functionality.binomialCoefficient(5.5f, 4);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFloatingInput2() {
		Functionality.binomialCoefficient(5, 4.8f);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testNegativeInput1() {
		Functionality.binomialCoefficient(-3, 2);
		Functionality.binomialCoefficient(-2, 1);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testNegativeInput2() {
		Functionality.binomialCoefficient(3, -2);
		Functionality.binomialCoefficient(2, -1);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testNaNInput() {
		Functionality.binomialCoefficient(Float.NaN, 2);
		Functionality.binomialCoefficient(2, Float.NaN);
	}
}
