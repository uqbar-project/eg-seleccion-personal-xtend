package ar.edu.seleccionPersonalMethodDispatch

import java.math.BigDecimal
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertThrows
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una búsqueda interna")
class TestBusquedaInterna {
	Busqueda interna

	PersonalPlanta empleado

	PersonalContratado contratadoMismoSector
	PersonalContratado contratadoDistintoSector

	Externo externo
	
	Cargo cargoProgramador

	@BeforeEach
	def void init() {
		interna = new BusquedaInterna => [
			sector = "Sistemas"
			puesto = "Programador"
		]

		externo = new Externo

		cargoProgramador = new Cargo => [
			descripcion = "Programador"
			sueldo = new BigDecimal(6000)
		]

		contratadoMismoSector = new PersonalContratado => [
			sector = "Sistemas"
		]

		contratadoDistintoSector = new PersonalContratado => [
			sector = "Contabilidad"
		]

		empleado = new PersonalPlanta => [
			cargo = cargoProgramador
		]
	}

	@Test
	@DisplayName("un empleado puede postularse")
	def void testEmpleadoSePuedePostularABusquedaInterna() {
		interna.postular(empleado)
		assertTrue(interna.postulantes.contains(empleado))
	}

	@Test
	@DisplayName("un contratado de otro sector no puede postularse")
	def void testContratadoDistintoSectorNoSePuedePostularABusquedaInterna() {
		assertThrows(UnsupportedOperationException, [
			interna.postular(contratadoDistintoSector)
		])
	}

	@Test
	@DisplayName("un contratado del mismo sector puede postularse")
	def void testContratadoMismoSectorSePuedePostularABusquedaInterna() {
		interna.postular(contratadoMismoSector)
		assertTrue(interna.postulantes.contains(contratadoMismoSector))
	}

	@Test
	@DisplayName("un externo no puede postularse")
	def void testExternoNoSePuedePostularABusquedaInterna() {
		assertThrows(UnsupportedOperationException, [
			interna.postular(externo)
		])
	}

}
