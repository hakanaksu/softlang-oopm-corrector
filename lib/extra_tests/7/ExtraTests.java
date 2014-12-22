import static org.junit.Assert.*;

import org.junit.Test;


public class ExtraTests {

	@Test
	public void normalfallExtended() {
		CycleList normal1 = new CycleList(3);
		for(int i = 0; i<3;i++){
			CycleListElement elem = new CycleListElement(i);
			normal1.add(elem);
		}
		assertTrue(normal1.getFirst().getItem() == normal1.getLast().getNext().getItem());
		assertTrue(normal1.actualLength==normal1.maxLength);
		//Lscht erstes Element
		normal1.deleteFirst();
		//Kontrolliert ob sich Lnge verdert hat
		assertTrue(normal1.actualLength<normal1.maxLength);
		//Kontrolliert ob Folgeelement von last wieder null ist (zyklenfrei)
		assertTrue(normal1.getLast().getNext()==null);
		//Fgt ein neues Element wieder hinzu
		normal1.add(new CycleListElement(5));
		//Kontrolliert ob Zyklus erneut funktioniert
		assertTrue(normal1.getFirst().getItem() == normal1.getLast().getNext().getItem());
		assertTrue(normal1.actualLength==normal1.maxLength);
	}

	
	@Test
	public void grenzfall2(){
		//Prft ob Zyklus mit ein-elementiger Liste funktioniert
		CycleList grenz = new CycleList(1);
		CycleListElement elem = new CycleListElement(42);
		grenz.add(elem);
		//Prft auf gleiche Lnge
		assertTrue(grenz.actualLength==grenz.maxLength);
		//Prft auf gleichen Wert von nachfolgendem Element von last und first
		assertTrue(grenz.getFirst().getItem() == grenz.getLast().getNext().getItem());
		//Prft ob nicht nur Werte, sondern auch Objektinstanz gleich sind!
		assertTrue(grenz.getFirst().equals(grenz.getLast().getNext()));
	}
	
	@Test
	public void fehlerfall2(){
		//Prfe ob Lschen des ersten Elements in leerer Liste bedacht wurde
		CycleList fehler2 = new CycleList(0);
		fehler2.deleteFirst();
		//Prfe ob hinzufgen bei maxLength=0 verboten ist
		fehler2.add(new CycleListElement(5));
		assertTrue(fehler2.getLast() == null);
	}

}
