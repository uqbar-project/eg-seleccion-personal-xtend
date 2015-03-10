package ar.edu.seleccionPersonal

import java.math.BigDecimal
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import java.util.Date
import java.util.ArrayList

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
		interna = new BusquedaInterna
		interna.sector = "Sistemas"

		externa = new BusquedaExterna
		externa.sector = "Sistemas"
		externa.remuneracion = new BigDecimal(10000)
		
		especial = new BusquedaEspecial
		especial.sector = "Sistemas"
		especial.remuneracion = new BigDecimal(4000)
		
		externo = new Externo
				
		externoConExperiencia = new Externo
		var puestos = new ArrayList<String>(#{"Analista", "Programador"})
		externoConExperiencia.puestosAnteriores = puestos 
				
		cargoProgramador = new Cargo
		cargoProgramador.descripcion = "Programador"
		cargoProgramador.sueldo = new BigDecimal(6000)
		
		contratadoMismoSectorMenosUnAnio = new PersonalContratado
		contratadoMismoSectorMenosUnAnio.sector = "Sistemas" 

		contratadoDistintoSectorMas5Anios = new PersonalContratado
		contratadoDistintoSectorMas5Anios.sector = "Contabilidad"
		contratadoDistintoSectorMas5Anios.fechaIngreso = new Date(104, 4, 9) 
		
		lopez = new PersonalPlanta
		lopez.cargo = cargoProgramador
	}
	
	@Test
	def void testLopezSePuedePostularABusquedaInterna() {
		interna.postular(lopez)
		Assert::assertTrue(interna.postulantes.contains(lopez))
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testContratadoDistintoSectorSePuedePostularABusquedaInterna() {
		interna.postular(contratadoDistintoSectorMas5Anios)
	}

	@Test
	def void testContratadoMismoSectorSePuedePostularABusquedaInterna() {
		interna.postular(contratadoMismoSectorMenosUnAnio)
		Assert::assertTrue(interna.postulantes.contains(contratadoMismoSectorMenosUnAnio))
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testSePuedePostularABusquedaInterna() {
		interna.postular(externo)
	}
	
	@Test
	def void testExternoSePuedePostularABusquedaExterna() {
		externa.postular(externo)
		Assert::assertTrue(externa.postulantes.contains(externo))
	}

	@Test(expected=typeof(UnsupportedOperationException))
	def void testLopezNoSePuedePostularABusquedaExterna() {
		externa.postular(lopez)
	}

	@Test
	def void testContratadoRecienteSePuedePostularABusquedaExterna() {
		externa.postular(contratadoMismoSectorMenosUnAnio)
		Assert::assertTrue(externa.postulantes.contains(contratadoMismoSectorMenosUnAnio))
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
		Assert::assertTrue(externa.postulantes.contains(externoConExperiencia))
	}
	
}