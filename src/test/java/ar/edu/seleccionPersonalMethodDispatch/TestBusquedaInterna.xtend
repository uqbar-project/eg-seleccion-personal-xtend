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

	def	cargoProgramador() {
		new Cargo => [
			descripcion = "Programador"
			sueldo = new BigDecimal(6000)
		]
	} 

	@BeforeEach
	def void init() {
		interna = new BusquedaInterna => [
			sector = "Sistemas"
			puesto = "Programador"
		]
	}

	@Test
	@DisplayName("un empleado puede postularse")
	def void testEmpleadoSePuedePostularABusquedaInterna() {
		val empleado = new PersonalPlanta => [
			cargo = cargoProgramador
		]

		interna.postular(empleado)
		assertTrue(interna.estaPostulado(empleado))
	}

	@Test
	@DisplayName("un contratado de otro sector no puede postularse")
	def void testContratadoDistintoSectorNoSePuedePostularABusquedaInterna() {
		val contratadoDistintoSector = new PersonalContratado => [
			sector = "Contabilidad"
		]

		assertThrows(BusinessException, [
			interna.postular(contratadoDistintoSector)
		])
	}

	@Test
	@DisplayName("un contratado del mismo sector puede postularse")
	def void testContratadoMismoSectorSePuedePostularABusquedaInterna() {
		val contratadoMismoSector = new PersonalContratado => [
			sector = "Sistemas"
		]

		interna.postular(contratadoMismoSector)

		assertTrue(interna.estaPostulado(contratadoMismoSector))
	}

	@Test
	@DisplayName("un externo no puede postularse")
	def void testExternoNoSePuedePostularABusquedaInterna() {
		val externo = new Externo

		assertThrows(BusinessException, [
			interna.postular(externo)
		])
	}

}
