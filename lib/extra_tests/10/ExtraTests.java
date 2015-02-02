import static org.junit.Assert.*;

import org.junit.*;

public class ExtraTests {
	Class c = new Class();
	Interface i = new Interface();
	Public pu = new Public();
	Protected pr = new Protected();
	Default d = new Default();
	Private pri = new Private();
	Attribute at = new Attribute();
	Method m = new Method();
	Method m1 = new Method();
	Method m2 = new Method();
	Integer in = new Integer();
	Integer in2 = new Integer();
	Boolean b = new Boolean();
	CharArray ch = new CharArray();

	Method[] ms;

	@Before
	public void setUp() {
		i.setName("Account");
		i.setVisibility(pu);
		ms = new Method[3];
		m.setName("withdraw");
		m.setType(in);
		in.setValue(5000);
		in.setTarget(m);
		ms[0] = m;

		m1.setName("deposit");
		m1.setType(b);
		b.setValue(true);
		b.setTarget(m1);
		ms[1] = m1;

		m2.setName("name");
		m2.setType(ch);
		ch.setValue("Turing");
		ch.setTarget(m2);
		ms[2] = m2;

		i.setMethods(ms);

		at.setName("balance");
		in2.setTarget(at);
		in2.setValue(0);
		at.setType(in2);
	}

	@Test
	public void testInheritanceJavfile() {
		assertTrue(c instanceof Javafile);
		assertTrue(i instanceof Javafile);

	}

	@Test
	public void testInheritanceVisibility() {
		assertTrue(pu instanceof Visibility);
		assertTrue(pr instanceof Visibility);
		assertTrue(d instanceof Visibility);
		assertTrue(pri instanceof Visibility);
	}

	@Test
	public void testInheritanceTypeable() {
		assertTrue(at instanceof Typeable);
		assertTrue(m instanceof Typeable);
	}

	@Test
	public void testInheritanceType() {
		assertTrue(in instanceof Type);
		assertTrue(b instanceof Type);
		assertTrue(ch instanceof Type);
	}

	@Test
	public void testGetterInterface() {
		assertArrayEquals(ms, i.getMethods());
		assertEquals("Account", i.getName());
		assertEquals(pu, i.getVisibility());
	}

	@Test
	public void testGetterMethod() {
		assertEquals("name", m2.getName());
		assertEquals(ch, m2.getType());

		assertEquals("deposit", m1.getName());
		assertEquals(b, m1.getType());
	}

	@Test
	public void testGetterAttribute() {
		assertEquals("balance", at.getName());
		assertEquals(in2, at.getType());
	}

	@Test
	public void testGetterTypes() {
		assertEquals(5000, in.getValue());
		assertEquals(ms[0], in.getTarget());

		assertEquals("Turing", ch.getValue());
		assertEquals(ms[2], ch.getTarget());

		assertEquals(true, b.getValue());
		assertEquals(ms[1], b.getTarget());

	}
}
