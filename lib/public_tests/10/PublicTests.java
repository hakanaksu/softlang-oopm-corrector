import static org.junit.Assert.*;

import org.junit.*;


public class PublicTests {
	Class a = new Class();
	Boolean b = new Boolean();
	
	@Before
	public void setUp(){
		Attribute[] as = new Attribute[2];
		as[0] = new Attribute();
		as[0].setName("name");
		CharArray c = new CharArray();
		c.setTarget(as[0]);
		c.setValue("Max");
		as[0].setType(c);
		as[1] = new Attribute();
		as[1].setName("isFriend");
		Boolean b = new Boolean();
		b.setTarget(as[1]);
		b.setValue(true);
		as[1].setType(b);
		Method[] ms = new Method[1];
		ms[0] = new Method();
		ms[0].setStatic(true);
		ms[0].setName("getName");
		c = new CharArray();
		c.setTarget(as[0]);
		c.setValue("Max");
		ms[0].setType(c);
		a.setAttributes(as);
		a.setMethods(ms);
		a.setName("Freundesbuch");
		a.setVisibility(new Private());
		b.setValue(true);
	}
	
	@Test
	public void testInheritance() {
		assertTrue(a instanceof Javafile);
		assertTrue(a.getVisibility() instanceof Visibility);
		assertTrue(a.getAttributes()[0] instanceof Typeable);
		assertTrue(a.getMethods()[0] instanceof Typeable);
		assertTrue(b instanceof Type);
	}
	
	

}
