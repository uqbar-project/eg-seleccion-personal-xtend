package ar.edu.seleccionPersonal

import java.math.BigDecimal
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Busqueda {

	List<Postulante> postulantes
	BigDecimal remuneracion
	String sector
	String puesto

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

	def void validarPostulacion(Postulante postulante)

}
