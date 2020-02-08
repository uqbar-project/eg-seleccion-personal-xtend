package ar.edu.seleccionPersonalMethodDispatch

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

	PersonalPlanta empleadoSinPersonasACargo
	PersonalPlanta jerarquicoConVariasPersonasACargo
	PersonalPlanta empleadoConMuyBuenSueldo

	PersonalContratado contratadoConPocasPersonasACargo
	PersonalContratado contratadoConMuchasPersonasACargo
	Externo externoSinExperienciaEnElPuesto
	Externo externoConExperienciaEnElPuesto
	
	Cargo cargoProgramador
	Cargo cargoTester
	Cargo cargoAnalista

	@BeforeEach
	def void init() {
		especial = new BusquedaEspecial => [
			sector = "Sistemas"
			puesto = "Programador"
			remuneracion = new BigDecimal(7000)
		]

		cargoProgramador = new Cargo => [
			descripcion = "Programador"
			sueldo = new BigDecimal(6000)
		]

		cargoTester = new Cargo => [
			descripcion = "Tester"
			sueldo = new BigDecimal(126000)
		]

		cargoAnalista = new Cargo => [
			descripcion = "Analista"
			sueldo = new BigDecimal(10000)
		]
		
		externoSinExperienciaEnElPuesto = new Externo

		externoConExperienciaEnElPuesto = new Externo => [
			trabajarDe(cargoProgramador)
			trabajarDe(cargoAnalista)
		]
				
		contratadoConPocasPersonasACargo = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.of(2014, 5, 9)
		]

		contratadoConMuchasPersonasACargo = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.now().minusYears(1)
		]
		(1..25).forEach [ contratadoConMuchasPersonasACargo.agregarPersonaACargo(new PersonalPlanta) ]
		
		empleadoSinPersonasACargo = new PersonalPlanta => [
			cargo = cargoProgramador
		]
		
		jerarquicoConVariasPersonasACargo = new PersonalPlanta => [
			cargo = cargoProgramador
		]
		(1..25).forEach [ jerarquicoConVariasPersonasACargo.agregarPersonaACargo(new PersonalPlanta) ]
		
		empleadoConMuyBuenSueldo = new PersonalPlanta => [
			cargo = cargoTester
		]
	}

	@Test
	@DisplayName("un empleado de planta con menos de 10 personas a cargo no puede postularse")
	def void testEmpleadoConPocasPersonasACargoNoSePuedePostularABusquedaEspecial() {
		assertThrows(UnsupportedOperationException, [
			especial.postular(empleadoSinPersonasACargo)
		])
	}
	
	@Test
	@DisplayName("un empleado de planta que tiene mejor sueldo actual no puede postularse")
	def void testEmpleadoConMejorSueldoNoSePuedePostularABusquedaEspecial() {
		assertThrows(UnsupportedOperationException, [
			especial.postular(empleadoConMuyBuenSueldo)
		])
	}

	@Test
	@DisplayName("un empleado de planta con un sueldo menor y más de 10 personas a cargo puede postularse")
	def void testJerarquicoConVariasPersonasACargoSePuedePostularABusquedaEspecial() {
		especial.postular(jerarquicoConVariasPersonasACargo)
		assertTrue(especial.postulantes.contains(jerarquicoConVariasPersonasACargo))
	}
	
	@Test
	@DisplayName("un contratado con pocas personas a cargo no puede postularse")
	def void testContratadoNoSePuedePostularABusquedaEspecial() {
		assertThrows(UnsupportedOperationException, [
			especial.postular(contratadoConPocasPersonasACargo)
		])
	}

	@Test
	@DisplayName("un contratado con muchas personas a cargo puede postularse")
	def void testContratadoQueSePuedePostularABusquedaEspecial() {
		especial.postular(contratadoConMuchasPersonasACargo)
		assertTrue(especial.postulantes.contains(contratadoConMuchasPersonasACargo))
	}

	@Test
	@DisplayName("un externo sin experiencia en el puesto no puede postularse")
	def void testExternoNoSePuedePostularABusquedaEspecial() {
		assertThrows(UnsupportedOperationException, [
			especial.postular(externoSinExperienciaEnElPuesto)
		])
	}

	@Test
	@DisplayName("un externo con experiencia en el puesto puede postularse")
	def void testExternoQueSePuedePostularABusquedaEspecial() {
		especial.postular(externoConExperienciaEnElPuesto)
		assertTrue(especial.postulantes.contains(externoConExperienciaEnElPuesto))
	}

}
