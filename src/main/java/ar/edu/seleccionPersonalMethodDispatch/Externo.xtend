package ar.edu.seleccionPersonalMethodDispatch

import java.util.List

class Externo implements Postulante {
	
	List<String> puestosAnteriores = newArrayList
	
	def trabajoEn(String puesto) {
		puestosAnteriores.contains(puesto)
	}

}