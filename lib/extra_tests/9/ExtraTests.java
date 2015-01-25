import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class ExtraTests {

	Angestellter angestellter;
	Angestellter angestellterException;
	
	Manager manager;
	Manager managerException;
	
	PrivatKunde privatKunde1;
	PrivatKunde privatKunde2;
	PrivatKunde privatKundeException;
	
	GeschaeftsKunde geschaeftsKunde1;
	GeschaeftsKunde geschaeftsKunde2;
	GeschaeftsKunde geschaeftsKundeException;
	
	Person person;
	
	@Before
	public void init(){
		angestellter = new Angestellter("Hans Mustermann Extra", 44,4000);
		manager = new Manager("Herr Chef Extra", 80, 3300);
		privatKunde1 = new PrivatKunde("Kunde Konrad Extra", 19);
		privatKunde2 = new PrivatKunde("Kunde2 Konrad Extra", 22, 0.78);
		geschaeftsKunde1 = new GeschaeftsKunde("Kunde Gross Extra", 26, "FirmaABC Extra");
		geschaeftsKunde2 = new GeschaeftsKunde("Kunde2 Gross Extra", 60,"FirmaXYZ Extra", 0.8);
		person = new Person("",-4){};
	}
	
	@Test
	public void testAngestellter() {
		assertEquals(44, angestellter.getAlter());
		assertTrue(angestellter instanceof Person);
		assertTrue(angestellter instanceof Angestellter);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testAngestellterException1(){
		angestellterException = new Angestellter("Tester Helmut Extra", 13, 200);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testAngestellterException2(){
		angestellter.setAlter(-5);
	}
	
	@Test
	public void testManager() {
		assertEquals("Herr Chef Extra", manager.getName());
		assertEquals(80,manager.getAlter());
		assertTrue(manager instanceof Person);
		assertTrue(manager instanceof Angestellter);
		assertTrue(manager instanceof Manager);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testManagerException1() {
		managerException = new Manager("", 19, 2200);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testManagerException2() {
		managerException = new Manager("", -1, 2200);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testManagerException3() {
		manager.setAlter(19);
	}

	@Test
	public void testPrivatKunde() {
		assertEquals("Kunde Konrad Extra", privatKunde1.getName());
		assertEquals(19, privatKunde1.getAlter());
		assertEquals(0.0, privatKunde1.getRabatt(),0.0);
		
		assertEquals("Kunde2 Konrad Extra", privatKunde2.getName());
		assertEquals(22, privatKunde2.getAlter());
		assertEquals(0.78, privatKunde2.getRabatt(),0.0);
		
		assertTrue(privatKunde1 instanceof PrivatKunde);
		assertTrue(privatKunde1 instanceof Kunde);
		assertTrue(privatKunde1 instanceof Person);
		
		assertTrue(privatKunde2 instanceof PrivatKunde);
		assertTrue(privatKunde2 instanceof Kunde);
		assertTrue(privatKunde2 instanceof Person);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testPrivatKundeException1() {
		privatKundeException = new PrivatKunde("", 7);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testPrivatKundeException2() {
		privatKundeException = new PrivatKunde("", -7);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testPrivatKundeException3() {
		privatKunde1.setAlter(4);
	}
	
	@Test
	public void testGeschaeftsKunde() {
		assertEquals("Kunde Gross Extra", geschaeftsKunde1.getName());
		assertEquals(26, geschaeftsKunde1.getAlter());
		assertEquals(0.15, geschaeftsKunde1.getRabatt(),0.0);
		assertEquals("FirmaABC Extra", geschaeftsKunde1.getFirmenName());
		
		assertEquals("Kunde2 Gross Extra", geschaeftsKunde2.getName());
		assertEquals(60, geschaeftsKunde2.getAlter());
		assertEquals(0.8, geschaeftsKunde2.getRabatt(),0.0);
		assertEquals("FirmaXYZ Extra", geschaeftsKunde2.getFirmenName());
		
		assertTrue(geschaeftsKunde1 instanceof GeschaeftsKunde);
		assertTrue(geschaeftsKunde1 instanceof Kunde);
		assertTrue(geschaeftsKunde1 instanceof Person);
		
		assertTrue(geschaeftsKunde2 instanceof GeschaeftsKunde);
		assertTrue(geschaeftsKunde2 instanceof Kunde);
		assertTrue(geschaeftsKunde2 instanceof Person);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testGeschaeftsKundeException1() {
		geschaeftsKundeException = new GeschaeftsKunde("", 15,"");
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testGeschaeftsKundeException2() {
		geschaeftsKundeException = new GeschaeftsKunde("", 0,"");
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testGeschaeftsKundeException3() {
		geschaeftsKunde1.setAlter(6);
	}
	
	@Test
	public void testPerson(){
		assertEquals(1, person.getAlter());
	}
}
