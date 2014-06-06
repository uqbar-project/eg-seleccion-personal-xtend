package ar.edu.seleccionPersonal

import java.util.ArrayList
import java.util.Date
import java.util.List

import static extension ar.edu.seleccionPersonal.DateUtil.*

abstract class Empleado implements Postulante {

	@Property Cargo cargo
	@Property String sector
	@Property Date fechaIngreso
	@Property List<Empleado> personasACargo

	new() {
		personasACargo = new ArrayList<Empleado>
		fechaIngreso = new Date	
	}
	
	def int getFechaAntiguedad(Date fecha) {
		fecha.diferenciaCon(fechaIngreso)
	}

	def getFechaAntiguedad() {
		getFechaAntiguedad(new Date)
	}

	def int cantidadPersonasACargo() {
		personasACargo.size
	}
	
}
