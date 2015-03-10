package ar.edu.seleccionPersonal

import ar.edu.seleccionPersonal.Busqueda

class BusquedaEspecial extends Busqueda {
	
	override validarPostulacion(Postulante postulante) {
		postulante.validarPostulacion(this)
	}

}
