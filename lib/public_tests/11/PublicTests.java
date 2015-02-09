import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class PublicTests {

	private TreeNode<Integer> IntTree;
	private TreeNode<String> StrTree;
	
	
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

		root.addChild(sub1);
		root.addChild(sub2);
		IntTree = root;
		
	}
	
	@Before
	public void initStrTree () {
		
		TreeNode<String> root = new TreeNode<String>("lala");
		TreeNode<String> sub1 = new TreeNode<String>("foo");
		sub1.addChild(new TreeNode<String>("a"));
		sub1.addChild(new TreeNode<String>("b"));
		sub1.addChild(new TreeNode<String>("c"));
		sub1.addChild(new TreeNode<String>("d"));
		sub1.addChild(new TreeNode<String>("e"));
		TreeNode<String> sub2 = new TreeNode<String>("bar");
		sub2.addChild(new TreeNode<String>("f"));
		sub2.addChild(new TreeNode<String>("g"));
		sub2.addChild(new TreeNode<String>("h"));
		sub2.addChild(new TreeNode<String>("i"));
		sub2.addChild(new TreeNode<String>("j"));
		

		root.addChild(sub1);
		root.addChild(sub2);
		StrTree = root;
		
	}
	
	@Test
	public void testIteratorImplementation () {
		
		assertTrue(IntTree.iterator() instanceof TreeNodeIterator);
		assertTrue(StrTree.iterator() instanceof TreeNodeIterator);
		
		
	}
	
	
	@Test
	public void testIfGeneric () {
		assertTrue(IntTree instanceof TreeNode);
		assertTrue(StrTree instanceof TreeNode);
		
		for (Integer i:IntTree) {
			
			assertTrue(i instanceof Integer);
			
		}
		
		for (String s:StrTree) {
			
			assertTrue(s instanceof String);
			
		}
		
		
	}
	
	@Test
	public void testChildIndeces () {
		
		assertTrue(IntTree.getChild(0).getChild(4).getValue() == 6);
		assertTrue(IntTree.getChild(1).getChild(1).getValue() == 9);
		assertTrue(StrTree.getChild(0).getValue().equals("foo"));
		assertTrue(StrTree.getChild(1).getValue().equals("bar"));
		assertTrue(StrTree.getChild(0).getChild(2).getValue().equals("c"));
		assertTrue(StrTree.getChild(1).getChild(0).getValue().equals("f"));
		
	}
	
	@Test(expected=UnsupportedOperationException.class)
	public void testException () {
		
		IntTree.iterator().remove();
		
	}
	
}
