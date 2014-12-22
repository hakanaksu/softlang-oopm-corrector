import static org.junit.Assert.*;

import org.junit.Test;


public class PublicTests {

	@Test
	public void normalfall() {
		CycleList normal1 = new CycleList(3);
		for(int i = 0; i<3;i++){
			CycleListElement elem = new CycleListElement(i);
			normal1.add(elem);
		}
		assertTrue(normal1.getFirst().getItem() == normal1.getLast().getNext().getItem());
		assertTrue(normal1.actualLength==normal1.maxLength);
		
	}
	@Test
	public void grenzfall(){
		CycleList grenz = new CycleList(0);
		CycleListElement elem = new CycleListElement(42);
		grenz.add(elem);
		
		assertTrue(grenz.actualLength==grenz.maxLength);
		assertTrue(grenz.getFirst() == null && grenz.getLast()==null);
	}
	
	@Test
	public void fehlerfall(){
		CycleList fehler = new CycleList(3);
		for(int i=0;i<4;i++){
			CycleListElement elem = new CycleListElement(i);
			fehler.add(elem);
		}
		assertFalse(fehler.actualLength==4);
	}
	

}
