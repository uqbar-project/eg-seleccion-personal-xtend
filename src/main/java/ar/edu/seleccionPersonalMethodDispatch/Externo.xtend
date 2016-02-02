package ar.edu.seleccionPersonalMethodDispatch

import java.util.ArrayList
import java.util.List

class Externo implements Postulante {
	
	@Property List<String> puestosAnteriores
	
	new() {
		puestosAnteriores = new ArrayList<String>	
	}
	
	def trabajoEn(String puesto) {
		puestosAnteriores.contains(puesto)
	}

}