package ar.edu.seleccionPersonal

import java.math.BigDecimal
import java.time.LocalDate
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import static org.junit.jupiter.api.Assertions.assertTrue
import static org.junit.jupiter.api.Assertions.assertThrows

@DisplayName("Dada una búsqueda externa")
class TestBusquedaExterna {
	Busqueda externa

	@BeforeEach
	def void init() {
		externa = new BusquedaExterna => [
			sector = "Sistemas"
			puesto = "Programador"
			remuneracion = new BigDecimal(10000)
		]
	}

	@Test
	@DisplayName("un externo puede postularse")
	def void testExternoSePuedePostularABusquedaExterna() {
		val externo = new Externo

		externa.postular(externo)

		assertTrue(externa.estaPostulado(externo))
	}

	@Test
	@DisplayName("un empleado de planta no puede postularse")
	def void testEmpleadoNoSePuedePostularABusquedaExterna() {
		val	cargoProgramador = new Cargo => [
			descripcion = "Programador"
			sueldo = new BigDecimal(6000)
		]
		val empleadoPlanta = new PersonalPlanta => [
			cargo = cargoProgramador
		]

		assertThrows(BusinessException, [
			externa.postular(empleadoPlanta)
		])
	}

	@Test
	@DisplayName("un contratado reciente se puede postular")
	def void testContratadoRecienteSePuedePostularABusquedaExterna() {
		val contratadoMenosUnAnio = new PersonalContratado => [
			sector = "Sistemas"
		]
		
		externa.postular(contratadoMenosUnAnio)
		
		assertTrue(externa.estaPostulado(contratadoMenosUnAnio))
	}

	@Test
	@DisplayName("un contratado con mucha antigüedad no se puede postular")
	def void testContratadoConMuchaAntiguedadNoSePuedePostularABusquedaExterna() {
		val contratadoMasUnAnio = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.of(2014, 5, 9)
		]
		
		assertThrows(BusinessException, [
			externa.postular(contratadoMasUnAnio)
		])
	}

}
