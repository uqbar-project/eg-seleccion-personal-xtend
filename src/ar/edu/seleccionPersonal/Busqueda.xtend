package ar.edu.seleccionPersonal

import java.math.BigDecimal
import java.util.ArrayList
import java.util.List

abstract class Busqueda {

	@Property List<Postulante> postulantes
	@Property BigDecimal remuneracion
	@Property String sector
	@Property String puesto

	new() { 
		postulantes = new ArrayList<Postulante>
	}

	def agregarPostulante(Postulante postulante) {
		postulantes.add(postulante)
	}

	def postular(Postulante postulante) {
		this.validarPostulacion(postulante)
		this.agregarPostulante(postulante)
	}
	
	def void validarPostulacion(Postulante postulante) {
		
	}
	
}
