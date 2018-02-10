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
	PersonalContratado contratadoMismoSectorMenosUnAnio
	PersonalContratado contratadoDistintoSectorMas5Anios
	Externo externo
	Externo externoConExperiencia
	Cargo cargoProgramador

	@Before
	def void init() {
		interna = new BusquedaInterna => [
			sector = "Sistemas"
		]

		externa = new BusquedaExterna => [
			sector = "Sistemas"
			remuneracion = new BigDecimal(10000)
		]

		especial = new BusquedaEspecial => [
			sector = "Sistemas"
			remuneracion = new BigDecimal(4000)
		]

		externo = new Externo

		externoConExperiencia = new Externo => [
			trabajoEn("Analista")
			trabajoEn("Programador")
		]

		cargoProgramador = new Cargo => [
			descripcion = "Programador"
			sueldo = new BigDecimal(6000)
		]

		contratadoMismoSectorMenosUnAnio = new PersonalContratado => [
			sector = "Sistemas"
		]

		contratadoDistintoSectorMas5Anios = new PersonalContratado => [
			sector = "Contabilidad"
			fechaIngreso = LocalDate.of(2014, 5, 9)
		]

		lopez = new PersonalPlanta => [
			cargo = cargoProgramador
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
	def void testContratadoNoSePuedePostularABusquedaEspecial() {
		especial.postular(contratadoDistintoSectorMas5Anios)
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testExternoNoSePuedePostularABusquedaEspecial() {
		especial.postular(externo)
	}

	@Test
	def void testExternoConExperienciaSePuedePostularABusquedaExterna() {
		externa.postular(externoConExperiencia)
		Assert.assertTrue(externa.postulantes.contains(externoConExperiencia))
	}

}
