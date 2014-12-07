import org.junit.Assert;
import org.junit.Test;


public class ExtraTests {
	public static final float EPSILON = 10e-1f;

	@Test(expected = IllegalArgumentException.class)
	public void testFehler() {
		Functionality.binomialCoefficient(35, 555);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFloatingInput1() {
		Functionality.binomialCoefficient(5.52123f, 6);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFloatingInput2() {
		Functionality.binomialCoefficient(5, 4.785878f);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFloatingInput3() {
		Functionality.binomialCoefficient(5.464f, 4.785878f);
	}

	/*//Auskommentiert da nicht Bestandteil der PublicTests
	@Test
	public void testGleicheWerte() {// Gehört aber eigentlich zur kompletten Fallabdeckung dazu
		Assert.assertEquals(1, Functionality.binomialCoefficient(3, 3),
				ExtraTests.EPSILON);
		Assert.assertEquals(1, Functionality.binomialCoefficient(42, 42),
				ExtraTests.EPSILON);
	}
	//*/

	@Test
	public void testGrenzfall() {
		Assert.assertEquals(1, Functionality.binomialCoefficient(9, 0),
				ExtraTests.EPSILON);
		Assert.assertEquals(15, Functionality.binomialCoefficient(15, 1),
				ExtraTests.EPSILON);
		// fac gibt ab 35 Infinity zurück
		Assert.assertEquals(1221759, Functionality.binomialCoefficient(45, 40),
				ExtraTests.EPSILON);
		Assert.assertEquals(2080, Functionality.binomialCoefficient(65, 63),
				ExtraTests.EPSILON);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testNaNInput() {
		Functionality.binomialCoefficient(Float.NaN, 2);
		Functionality.binomialCoefficient(2, Float.NaN);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testNegativeInput1() {
		Functionality.binomialCoefficient(-7, 3);
		Functionality.binomialCoefficient(-8, 1);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testNegativeInput2() {
		Functionality.binomialCoefficient(5, -4);
		Functionality.binomialCoefficient(3, -2);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testNegativeInput3() {
		Functionality.binomialCoefficient(-3, -2);
		Functionality.binomialCoefficient(-2, -1);
	}

	@Test
	public void testNormalfall() {
		Assert.assertEquals(252, Functionality.binomialCoefficient(10, 5),
				ExtraTests.EPSILON);
		Assert.assertEquals(3, Functionality.binomialCoefficient(3, 2),
				ExtraTests.EPSILON);
		Assert.assertEquals(27132, Functionality.binomialCoefficient(19, 13),
				ExtraTests.EPSILON);
		Assert.assertEquals(3003, Functionality.binomialCoefficient(15, 10),
				ExtraTests.EPSILON);
	}

}
