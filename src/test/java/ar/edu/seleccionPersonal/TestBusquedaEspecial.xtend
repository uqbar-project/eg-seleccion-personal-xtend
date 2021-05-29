package ar.edu.seleccionPersonal

import java.math.BigDecimal
import java.time.LocalDate
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertThrows
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una búsqueda especial")
class TestBusquedaEspecial {
	Busqueda especial

	@BeforeEach
	def void init() {
		especial = new BusquedaEspecial => [
			sector = "Sistemas"
			puesto = "Programador"
			remuneracion = new BigDecimal(7000)
		]
	}
	
	def cargoProgramador() {
		new Cargo => [
			descripcion = "Programador"
			sueldo = new BigDecimal(6000)
		]
	}
	
	def cargoTester() {
		new Cargo => [
			descripcion = "Tester"
			sueldo = new BigDecimal(126000)
		]
	}

	def Cargo cargoAnalista() {
		new Cargo => [
			descripcion = "Analista"
			sueldo = new BigDecimal(10000)
		]
	}

	@Test
	@DisplayName("un empleado de planta con menos de 10 personas a cargo no puede postularse")
	def void testEmpleadoConPocasPersonasACargoNoSePuedePostularABusquedaEspecial() {
		val empleadoSinPersonasACargo = new PersonalPlanta => [
			cargo = cargoProgramador
		]
		
		assertThrows(BusinessException, [
			especial.postular(empleadoSinPersonasACargo)
		])
	}
	
	
	@Test
	@DisplayName("un empleado de planta que tiene mejor sueldo actual no puede postularse")
	def void testEmpleadoConMejorSueldoNoSePuedePostularABusquedaEspecial() {
		val empleadoConMuyBuenSueldo = new PersonalPlanta => [
			cargo = cargoTester
		]
		
		assertThrows(BusinessException, [
			especial.postular(empleadoConMuyBuenSueldo)
		])
	}

	@Test
	@DisplayName("un empleado de planta con un sueldo menor y más de 10 personas a cargo puede postularse")
	def void testJerarquicoConVariasPersonasACargoSePuedePostularABusquedaEspecial() {
		val jerarquicoConVariasPersonasACargo = new PersonalPlanta => [
			cargo = cargoProgramador
		]
		(1..25).forEach [ jerarquicoConVariasPersonasACargo.agregarPersonaACargo(new PersonalPlanta) ]
		
		especial.postular(jerarquicoConVariasPersonasACargo)

		assertTrue(especial.estaPostulado(jerarquicoConVariasPersonasACargo))
	}
	
	@Test
	@DisplayName("un contratado con pocas personas a cargo no puede postularse")
	def void testContratadoNoSePuedePostularABusquedaEspecial() {
		val contratadoConPocasPersonasACargo = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.of(2014, 5, 9)
		]

		assertThrows(BusinessException, [
			especial.postular(contratadoConPocasPersonasACargo)
		])
	}

	@Test
	@DisplayName("un contratado con muchas personas a cargo puede postularse")
	def void testContratadoQueSePuedePostularABusquedaEspecial() {
		val contratadoConMuchasPersonasACargo = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.now().minusYears(1)
		]
		(1..25).forEach [ contratadoConMuchasPersonasACargo.agregarPersonaACargo(new PersonalPlanta) ]
		
		especial.postular(contratadoConMuchasPersonasACargo)
		assertTrue(especial.estaPostulado(contratadoConMuchasPersonasACargo))
	}

	@Test
	@DisplayName("un externo sin experiencia en el puesto no puede postularse")
	def void testExternoNoSePuedePostularABusquedaEspecial() {
		val externoSinExperienciaEnElPuesto = new Externo

		assertThrows(BusinessException, [
			especial.postular(externoSinExperienciaEnElPuesto)
		])
	}

	@Test
	@DisplayName("un externo con experiencia en el puesto puede postularse")
	def void testExternoQueSePuedePostularABusquedaEspecial() {
		val externoConExperienciaEnElPuesto = new Externo => [
			trabajarDe(cargoProgramador.descripcion)
			trabajarDe(cargoAnalista.descripcion)
		]
		
		especial.postular(externoConExperienciaEnElPuesto)
		
		assertTrue(especial.estaPostulado(externoConExperienciaEnElPuesto))
	}

}
