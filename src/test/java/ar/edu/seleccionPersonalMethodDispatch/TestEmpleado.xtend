package ar.edu.seleccionPersonalMethodDispatch

import java.time.LocalDate
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestEmpleado {
	
	PersonalPlanta lopez
	
	@Before
	def void init() {
		lopez = new PersonalPlanta => [
			fechaIngreso = LocalDate.of(2008, 2, 14)
		]
	}
	
	@Test
	def void testAntiguedadDeLopez() {
		Assert.assertEquals(5, lopez.getFechaAntiguedad(LocalDate.of(2013, 8, 15)))	
	}
	
}