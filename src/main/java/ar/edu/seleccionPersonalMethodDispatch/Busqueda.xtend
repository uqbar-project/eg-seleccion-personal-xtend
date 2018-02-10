package ar.edu.seleccionPersonalMethodDispatch

import java.math.BigDecimal
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Busqueda {

	List<Postulante> postulantes = newArrayList
	BigDecimal remuneracion
	String sector
	String puesto

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
