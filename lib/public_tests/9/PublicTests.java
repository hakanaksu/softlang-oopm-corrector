import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class PublicTests {

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
	
	@Before
	public void init(){
		angestellter = new Angestellter("Hans Mustermann", 25,1500);
		manager = new Manager("Herr Chef", 37, 2600);
		privatKunde1 = new PrivatKunde("Kunde Konrad", 19);
		privatKunde2 = new PrivatKunde("Kunde2 Konrad", 22, 0.20);
		geschaeftsKunde1 = new GeschaeftsKunde("Kunde Gross", 38, "FirmaABC");
		geschaeftsKunde2 = new GeschaeftsKunde("Kunde2 Gross", 46,"FirmaXYZ", 0.5);
	}
	
	@Test
	public void testAngestellter() {
		assertEquals(25, angestellter.getAlter());
		assertTrue(angestellter instanceof Person);
		assertTrue(angestellter instanceof Angestellter);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testAngestellterException1(){
		angestellterException = new Angestellter("Tester Helmut", 13, 200);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testAngestellterException2(){
		angestellter.setAlter(-5);
	}
	
	@Test
	public void testManager() {
		assertEquals("Herr Chef", manager.getName());
		assertEquals(37,manager.getAlter());
		assertEquals(2860,manager.getGehalt());
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
		assertEquals("Kunde Konrad", privatKunde1.getName());
		assertEquals(19, privatKunde1.getAlter());
		assertEquals(0.0, privatKunde1.getRabatt(),0.0);
		assertEquals(0.0, privatKunde1.getRabatt(),0.0);
		
		assertEquals("Kunde2 Konrad", privatKunde2.getName());
		assertEquals(22, privatKunde2.getAlter());
		assertEquals(0.2, privatKunde2.getRabatt(),0.0);
		assertEquals(0.2, privatKunde2.getRabatt(),0.0);
		
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
		assertEquals("Kunde Gross", geschaeftsKunde1.getName());
		assertEquals(38, geschaeftsKunde1.getAlter());
		assertEquals(0.15, geschaeftsKunde1.getRabatt(),0.0);
		assertEquals("FirmaABC", geschaeftsKunde1.getFirmenName());
		
		assertEquals("Kunde2 Gross", geschaeftsKunde2.getName());
		assertEquals(46, geschaeftsKunde2.getAlter());
		assertEquals(0.5, geschaeftsKunde2.getRabatt(),0.0);
		assertEquals("FirmaXYZ", geschaeftsKunde2.getFirmenName());
		
		assertTrue(geschaeftsKunde1 instanceof GeschaeftsKunde);
		assertTrue(geschaeftsKunde1 instanceof Kunde);
		assertTrue(geschaeftsKunde1 instanceof Person);
		
		assertTrue(geschaeftsKunde2 instanceof GeschaeftsKunde);
		assertTrue(geschaeftsKunde2 instanceof Kunde);
		assertTrue(geschaeftsKunde2 instanceof Person);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testGeschaeftsKundeException1() {
		geschaeftsKundeException = new GeschaeftsKunde("", 17,"");
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testGeschaeftsKundeException2() {
		geschaeftsKundeException = new GeschaeftsKunde("", -47,"");
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testGeschaeftsKundeException3() {
		geschaeftsKunde1.setAlter(-2);
	}
}
