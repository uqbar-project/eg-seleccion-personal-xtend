package ar.edu.seleccionPersonal

import java.util.ArrayList
import java.util.List

class Externo extends Postulante {
	
	@Property List<String> puestosAnteriores
	
	new() {
		puestosAnteriores = new ArrayList<String>	
	}
	
	override dispatch validarPostulacion(BusquedaInterna interna) {
		throw new UnsupportedOperationException("No puede postularse a búsquedas internas")
	}

	override dispatch validarPostulacion(BusquedaEspecial especial) {
		if (!puestosAnteriores.contains(especial.puesto)) {
			throw new UnsupportedOperationException("Para poder postularse debe haber trabajado anteriormente en el mismo puesto")
		}
	}
	
}