package ar.edu.seleccionPersonalMethodDispatch

import java.math.BigDecimal
import java.time.LocalDate
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestBusqueda {
	Busqueda interna
	Busqueda externa
	Busqueda especial

	PersonalPlanta lopez
	PersonalPlanta gonzalez
	PersonalPlanta gimenez
	PersonalContratado contratadoMismoSectorMenosUnAnio
	PersonalContratado contratadoDistintoSectorMas5Anios
	PersonalContratado contratadoDistintoSectorMenos5Anios
	Externo externo
	Externo externoConExperiencia
	
	Cargo cargoProgramador
	Cargo cargoTester
	Cargo cargoAnalista

	@Before
	def void init() {
		interna = new BusquedaInterna => [
			sector = "Sistemas"
			puesto = "Programador"
		]

		externa = new BusquedaExterna => [
			sector = "Sistemas"
			puesto = "Programador"
			remuneracion = new BigDecimal(10000)
		]

		especial = new BusquedaEspecial => [
			sector = "Sistemas"
			puesto = "Programador"
			remuneracion = new BigDecimal(7000)
		]

		externo = new Externo

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
		
		externoConExperiencia = new Externo => [
			trabajarDe(cargoProgramador)
			trabajarDe(cargoAnalista)
		]
				
		contratadoMismoSectorMenosUnAnio = new PersonalContratado => [
			sector = "Sistemas"
		]

		contratadoDistintoSectorMas5Anios = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.of(2014, 5, 9)
		]

		contratadoDistintoSectorMenos5Anios = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.now().minusYears(1)
		]
		
		lopez = new PersonalPlanta => [
			cargo = cargoProgramador
		]
		
		gonzalez = new PersonalPlanta => [
			cargo = cargoProgramador
		]
		(1..25).forEach [ gonzalez.agregarPersonaACargo(new PersonalPlanta) ]
		
		gimenez = new PersonalPlanta => [
			cargo = cargoTester
		]
	}

	@Test
	def void testLopezSePuedePostularABusquedaInterna() {
		interna.postular(lopez)
		Assert.assertTrue(interna.postulantes.contains(lopez))
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testContratadoDistintoSectorSePuedePostularABusquedaInterna() {
		interna.postular(contratadoDistintoSectorMas5Anios)
	}

	@Test
	def void testContratadoMismoSectorSePuedePostularABusquedaInterna() {
		interna.postular(contratadoMismoSectorMenosUnAnio)
		Assert.assertTrue(interna.postulantes.contains(contratadoMismoSectorMenosUnAnio))
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testSePuedePostularABusquedaInterna() {
		interna.postular(externo)
	}

	@Test
	def void testExternoSePuedePostularABusquedaExterna() {
		externa.postular(externo)
		Assert.assertTrue(externa.postulantes.contains(externo))
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testLopezNoSePuedePostularABusquedaExterna() {
		externa.postular(lopez)
	}

	@Test
	def void testContratadoRecienteSePuedePostularABusquedaExterna() {
		externa.postular(contratadoMismoSectorMenosUnAnio)
		Assert.assertTrue(externa.postulantes.contains(contratadoMismoSectorMenosUnAnio))
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testLopezNoSePuedePostularABusquedaEspecial() {
		especial.postular(lopez)
	}
	
	@Test(expected=typeof(UnsupportedOperationException))
	def void testGimenezNoSePuedePostularABusquedaEspecial() {
		especial.postular(gimenez)
	}

	@Test
	def void testGonzalezSePuedePostularABusquedaExterna() {
		especial.postular(gonzalez)
	}
	
	@Test(expected=typeof(UnsupportedOperationException))
	def void testContratadoNoSePuedePostularABusquedaEspecial() {
		especial.postular(contratadoDistintoSectorMas5Anios)
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testContratadoQueSePuedePostularABusquedaEspecial() {
		especial.postular(contratadoDistintoSectorMenos5Anios)
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testExternoNoSePuedePostularABusquedaEspecial() {
		especial.postular(externo)
	}

	@Test
	def void testExternoQueSePuedePostularABusquedaEspecial() {
		especial.postular(externoConExperiencia)
	}

	@Test
	def void testExternoConExperienciaSePuedePostularABusquedaExterna() {
		externa.postular(externoConExperiencia)
		Assert.assertTrue(externa.postulantes.contains(externoConExperiencia))
	}

}
