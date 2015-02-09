import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

/**
 * 
 * Checks Vector Space properties of Vector3 against random values
 * 
 * @author Team OOPM1415
 *
 */
public class ExtraTests {

	private TreeNode<Integer> IntTree;
	
	@Before 
	public void initIntTree () {
		
		TreeNode<Integer> root = new TreeNode<Integer>(0);
		TreeNode<Integer> sub1 = new TreeNode<Integer>(1);
		sub1.addChild(new TreeNode<Integer>(2));
		sub1.addChild(new TreeNode<Integer>(3));
		sub1.addChild(new TreeNode<Integer>(4));
		sub1.addChild(new TreeNode<Integer>(5));
		sub1.addChild(new TreeNode<Integer>(6));
		TreeNode<Integer> sub2 = new TreeNode<Integer>(7);
		sub2.addChild(new TreeNode<Integer>(8));
		sub2.addChild(new TreeNode<Integer>(9));
		sub2.addChild(new TreeNode<Integer>(10));
		sub2.addChild(new TreeNode<Integer>(11));
		sub2.addChild(new TreeNode<Integer>(12));

		root.addChild(sub2);
		root.addChild(sub1);
		IntTree = root;
		
	}

	
	@Test
	public void testMemoryComplexity () {
		
		TreeNodeIterator it = (TreeNodeIterator) IntTree.iterator();
		
		while (it.hasNext()) {
			
			assertTrue(it.getStack().size() < 7);
			it.next();
			
		}
		
		
	}
	
	@Test
	public void testPreOrder () {
		//0 7 8 9 10 11 12 1 2 3 4 5 6 
		
		int[] solution = {0, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6};
		int[] check = new int[13];
		
		int i = 0;
		for (Integer value:IntTree) {
			
			check[i] = value;
			i++;
			
		}
		
		for (i=0; i < solution.length; i++) {
			
			assertTrue(check[i] == solution[i]);
			
		}
		
	}
	
}
