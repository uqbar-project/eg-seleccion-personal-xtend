package ar.edu.seleccionPersonalMethodDispatch

import java.util.Date
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestEmpleado {
	
	PersonalPlanta lopez
	
	@Before
	def void init() {
		lopez = new PersonalPlanta
		lopez.fechaIngreso = new Date(108, 2, 14)
	}
	
	@Test
	def void testAntiguedadDeLopez() {
		Assert::assertEquals(6, lopez.getFechaAntiguedad(new Date(113, 8, 15)))	
	}
	
}