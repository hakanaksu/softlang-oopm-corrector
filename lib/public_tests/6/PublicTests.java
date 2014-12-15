import static org.junit.Assert.*;

import org.junit.Test;

public class PublicTests {
	private static Monoid sumTest = (Monoid) new SumMonoid();
	private static Monoid mulTest = (Monoid) new MultMonoid();

	@Test
	public void normalfall() {
		assertEquals(42, sumTest.monoidMerge(35, 7));
		assertEquals(
				42,
				sumTest.monoidMerge(sumTest.monoidMerge(10, 11),
						sumTest.monoidMerge(19, 2)));
		assertEquals(42, mulTest.monoidMerge(21, 2));
		assertEquals(
				48,
				mulTest.monoidMerge(mulTest.monoidMerge(3, 2),
						mulTest.monoidMerge(2, 4)));
	}

	@Test
	public void grenzfall() {
		assertEquals(42, sumTest.monoidMerge(49, -7));
		assertEquals(42, mulTest.monoidMerge(-21, -2));
		assertEquals(24, sumTest.monoidMerge(0, 24));
	}

	@Test
	public void instanzenTest() {
		assertTrue(sumTest instanceof Monoid);
		assertTrue(mulTest instanceof Monoid);
	}
}
