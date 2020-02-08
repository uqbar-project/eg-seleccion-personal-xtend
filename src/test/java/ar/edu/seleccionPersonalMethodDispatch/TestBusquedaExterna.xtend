package ar.edu.seleccionPersonalMethodDispatch

import java.math.BigDecimal
import java.time.LocalDate
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import static org.junit.jupiter.api.Assertions.assertTrue
import static org.junit.jupiter.api.Assertions.assertThrows

@DisplayName("Dada una búsqueda externas")
class TestBusquedaExterna {
	Busqueda externa

	PersonalPlanta empleadoPlanta
	PersonalContratado contratadoMenosUnAnio
	PersonalContratado contratadoMasUnAnio
	Externo externo
	
	Cargo cargoProgramador

	@BeforeEach
	def void init() {
		externa = new BusquedaExterna => [
			sector = "Sistemas"
			puesto = "Programador"
			remuneracion = new BigDecimal(10000)
		]

		externo = new Externo

		cargoProgramador = new Cargo => [
			descripcion = "Programador"
			sueldo = new BigDecimal(6000)
		]

		contratadoMenosUnAnio = new PersonalContratado => [
			sector = "Sistemas"
		]

		contratadoMasUnAnio = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.of(2014, 5, 9)
		]

		empleadoPlanta = new PersonalPlanta => [
			cargo = cargoProgramador
		]
	}

	@Test
	@DisplayName("un externo puede postularse")
	def void testExternoSePuedePostularABusquedaExterna() {
		externa.postular(externo)
		assertTrue(externa.postulantes.contains(externo))
	}

	@Test
	@DisplayName("un empleado de planta no puede postularse")
	def void testEmpleadoNoSePuedePostularABusquedaExterna() {
		assertThrows(UnsupportedOperationException, [
			externa.postular(empleadoPlanta)
		])
	}

	@Test
	@DisplayName("un contratado reciente se puede postular")
	def void testContratadoRecienteSePuedePostularABusquedaExterna() {
		externa.postular(contratadoMenosUnAnio)
		assertTrue(externa.postulantes.contains(contratadoMenosUnAnio))
	}

	@Test
	@DisplayName("un contratado con mucha antigüedad no se puede postular")
	def void testContratadoConMuchaAntiguedadNoSePuedePostularABusquedaExterna() {
		assertThrows(UnsupportedOperationException, [
			externa.postular(contratadoMasUnAnio)
		])
	}

}
