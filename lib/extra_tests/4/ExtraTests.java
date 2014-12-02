import static org.junit.Assert.*;

import org.junit.Test;

/**
 * 
 * Checks Vector Space properties of Vector3 against random values
 * 
 * @author Team OOPM1415
 *
 */
public class ExtraTests {

	
	public double random () {
		
		double result = Math.random() * Math.round(Math.random() * 100);
				
		if (Math.round(result) % 2 == 0) {
			
			return result * -1;
			
		}
		
		return result;
		
	}
	
	public Vector3 randomVector3 () {
		
		return  new Vector3(this.random(), this.random(), this.random());
		
	}
	
	@Test
	public void test () {
		
		for (int i = 0; i < 1000; i++) {
			
			this.extraTest2();
			this.extraTest3();
			this.extraTest4();
			
		}
		
	}
	

	
	/**
	 * Check vector space rules for + against random values
	 */
	public void extraTest2 () {
		
		Vector3 o = new Vector3(0,0,0);
		Vector3 a = this.randomVector3();
		Vector3 b = this.randomVector3();
		Vector3 c = this.randomVector3();
		Vector3 i = a.mul(-1);
		

		assertTrue(a.add(b).equals(b.add(a)));
		assertTrue(a.add(b).add(c).equals(a.add(b.add(c))));
		assertTrue(o.add(a).equals(a));
		assertTrue(a.add(o).equals(a));
		assertTrue(a.add(i).equals(i.add(a)));
		assertTrue(a.add(i).equals(o));
		
	}
	
	
	/**
	 * Check vector space rules for * against random values
	 */
	public void extraTest3 () {
		
		double r = this.random();
		double s = this.random();
		double e = 1;
		
		Vector3 a = this.randomVector3();
		Vector3 b = this.randomVector3();
		
		assertTrue(a.mul(s).mul(r).equals(a.mul(r).mul(s)));
		assertTrue(a.mul(e).equals(a));
		assertTrue(a.mul(r+s).equals(a.mul(r).add(a.mul(s))));
		assertTrue(a.add(b).mul(r).equals(a.mul(r).add(b.mul(r))));
		
	}
	

	
	/**
	 * Check parallelism laws against random values
	 */
	public void extraTest4 () {
		
		Vector3 o = new Vector3(0,0,0);
		Vector3 a = this.randomVector3();
		Vector3 b = a.mul(this.random());
		
		assertTrue(a.crossproduct(b).equals(o));
		
		
	}
	
}
