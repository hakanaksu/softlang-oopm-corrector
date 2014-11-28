import static org.junit.Assert.*;

import org.junit.Test;

/**
 *
 * Checks Vector Space properties of Vector3
 *
 * @author Team OOPM1415
 *
 */
public class PublicTests {


    /**
     * Check data encapsulation
     */
    @Test
    public void publicTest1 () {

        Vector3 v = new Vector3(1,2,3);

        assertEquals(1, v.getX(), Vector3.EPSILON);
        assertEquals(2, v.getY(), Vector3.EPSILON);
        assertEquals(3, v.getZ(), Vector3.EPSILON);

    }

    /**
     * Check vector space rules for add
     */
    @Test
    public void publicTest2 () {

        Vector3 o = new Vector3(0,0,0);
        Vector3 a = new Vector3(1,2,3);
        Vector3 b = new Vector3(4,5,6);
        Vector3 c = new Vector3(7,8,9);
        Vector3 i = a.mul(-1);


        assertTrue(a.add(b).equals(b.add(a)));
        assertTrue(a.add(b).add(c).equals(a.add(b.add(c))));
        assertTrue(o.add(a).equals(a));
        assertTrue(a.add(o).equals(a));
        assertTrue(a.add(i).equals(i.add(a)));
        assertTrue(a.add(i).equals(o));

    }


    /**
     * Check vector space rules for *
     */
    @Test
    public void publicTest3 () {

        double r = 3.5;
        double s = -7.7;
        double e = 1;

        Vector3 a = new Vector3(1,2,3);
        Vector3 b = new Vector3(4,5,6);

        assertTrue(a.mul(s).mul(r).equals(a.mul(r).mul(s)));
        assertTrue(a.mul(e).equals(a));
        assertTrue(a.mul(r+s).equals(a.mul(r).add(a.mul(s))));
        assertTrue(a.add(b).mul(r).equals(a.mul(r).add(b.mul(r))));

    }


    /**
     * Check orthogonality laws
     */
    @Test
    public void publicTest4 () {

        Vector3 b1 = new Vector3(1,0,0);
        Vector3 b2 = new Vector3(0,1,0);
        Vector3 b3 = new Vector3(0,0,1);

        assertEquals(0, b1.dotproduct(b2), Vector3.EPSILON);
        assertEquals(0, b2.dotproduct(b3), Vector3.EPSILON);
        assertEquals(0, b3.dotproduct(b1), Vector3.EPSILON);

        assertEquals(b1.crossproduct(b2).normalize(), b1.normalize() * b2.normalize(), Vector3.EPSILON);


    }

    /**
     * Check parallelism laws
     */
    @Test
    public void publicTest5 () {

        Vector3 o = new Vector3(0,0,0);
        Vector3 a = new Vector3(1,2,3);
        Vector3 b = new Vector3(5,10,15);

        assertTrue(a.crossproduct(b).equals(o));


    }


}
