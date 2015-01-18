import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class ExtraTests {

	private BinIntTree tree1;
	private BinIntTree tree2;
	
	@Before
	public void prepareTrees() {
		tree1 = new BinIntTree(12);
		tree2 = new BinIntTree(25);
		tree1.setLeft(new BinIntTree(5));
		tree1.setRight(new BinIntTree(16));
		tree1.getLeft().setLeft(new BinIntTree(72));
		tree1.getRight().setLeft(new BinIntTree(22));
		tree2.setLeft(new BinIntTree(7));
		tree2.setRight(new BinIntTree(2));
	}
	@Test
	public void testSearch(){
		assertTrue(tree1.search(12));
		assertTrue(tree1.search(72));
		assertFalse(tree1.search(1));
		assertTrue(tree2.search(7));
	}
	@Test
	public void testDelete(){
		tree1.getLeft().delete();
		assertFalse(tree1.search(5));
		tree2.getRight().delete();
		assertFalse(tree2.search(2));
	}
	@Test(expected=TreeException.class)
	public void TestRootDelete(){
		tree1.delete();
	}
	@Test(expected=TreeException.class)
	public void TestReparent(){
		tree2.setRight(tree1.getLeft());
	}
}
