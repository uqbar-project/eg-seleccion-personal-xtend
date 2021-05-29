package ar.edu.seleccionPersonal

import java.math.BigDecimal
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

abstract class Busqueda {

	List<Postulante> postulantes = newArrayList
	@Accessors BigDecimal remuneracion
	@Accessors String sector
	@Accessors String puesto

	def agregarPostulante(Postulante postulante) {
		postulantes.add(postulante)
	}

	def estaPostulado(Postulante postulante) {
		postulantes.contains(postulante)
	}
	
	def postular(Postulante postulante) {
		this.validarPostulacion(postulante)
		this.agregarPostulante(postulante)
	}

	def void validarPostulacion(Postulante postulante)

}

class BusquedaEspecial extends Busqueda {
	
	override validarPostulacion(Postulante postulante) {
		postulante.validarPostulacionBusquedaEspecial(this)
	}

}

class BusquedaExterna extends Busqueda {

	override validarPostulacion(Postulante postulante) {
		postulante.validarPostulacionBusquedaExterna(this)
	}

}

class BusquedaInterna extends Busqueda {

	override validarPostulacion(Postulante postulante) {
		postulante.validarPostulacionBusquedaInterna(this)
	}

}
