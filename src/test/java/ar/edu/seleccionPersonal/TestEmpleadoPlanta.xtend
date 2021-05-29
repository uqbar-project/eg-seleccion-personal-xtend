package ar.edu.seleccionPersonal

import java.time.LocalDate
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dado un empleado de planta")
class TestEmpleadoPlanta {
	
	PersonalPlanta personalPlanta
	
	@BeforeEach
	def void init() {
		personalPlanta = new PersonalPlanta => [
			fechaIngreso = LocalDate.of(2008, 2, 14)
		]
	}
	
	@Test
	@DisplayName("Se puede calcular su antigüedad tomando una fecha fija como base")
	def void testAntiguedadDePersonalDePlanta() {
		assertEquals(5, personalPlanta.getFechaAntiguedad(LocalDate.of(2013, 8, 15)))	
	}
	
}
