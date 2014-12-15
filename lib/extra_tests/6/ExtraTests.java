import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ExtraTests {
	private static Monoid sumTest = (Monoid) new SumMonoid();
	private static Monoid mulTest = (Monoid) new MultMonoid();

	@Test
	public void neutralesElement() {
		assertEquals(0, sumTest.monoidNeutral());
		assertEquals(18, sumTest.monoidMerge(sumTest.monoidNeutral(), 18));
		assertEquals(8, sumTest.monoidMerge(8, sumTest.monoidNeutral()));

		assertEquals(1, mulTest.monoidNeutral());
		assertEquals(6, mulTest.monoidMerge(mulTest.monoidNeutral(), 6));
		assertEquals(16, mulTest.monoidMerge(16, mulTest.monoidNeutral()));
	}

	@Test
	public void kombinationenVonMonoid() {
		assertEquals(42, mulTest.monoidMerge(
				sumTest.monoidMerge(2, sumTest.monoidNeutral()),
				sumTest.monoidMerge(6, 15)));
		assertEquals(
				99,
				sumTest.monoidMerge(mulTest.monoidMerge(30, 3),
						mulTest.monoidMerge(mulTest.monoidNeutral(), 9)));
	}

}