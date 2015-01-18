import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

public class PublicTests {
	
	private BinIntTree trivial;
	private BinIntTree nontrivial;
	
	@Before
	public void prepareTrees() {
		trivial = new BinIntTree(42);
		nontrivial = new BinIntTree(42);
		nontrivial.setLeft(new BinIntTree(77));
		nontrivial.setRight(new BinIntTree(88));
	}
	
	@Test
	public void trivialSearchTrue() {
		assertTrue(trivial.search(42));
	}
	
	@Test
	public void trivialSearchFalse() {
		assertFalse(trivial.search(88));
	}
	
	@Test
	public void nontrivialSearchTrue() {
		assertTrue(nontrivial.search(42));
		assertTrue(nontrivial.search(77));
		assertTrue(nontrivial.search(88));
	}

	@Test
	public void deleteSubtree() {
		nontrivial.getLeft().delete();
		assertFalse(nontrivial.search(77));
	}
	
	@Test
	public void replaceSubtree() {
		nontrivial.setLeft(new BinIntTree(101));
		assertFalse(nontrivial.search(77));
		assertTrue(nontrivial.search(101));
	}
		
	@Test(expected=TreeException.class)
	public void cannotDeleteRoot() {
		nontrivial.delete();
	}	

	@Test(expected=TreeException.class)
	public void cannotReparent() {
		trivial.setLeft(nontrivial.getLeft());
	}	
	
}
