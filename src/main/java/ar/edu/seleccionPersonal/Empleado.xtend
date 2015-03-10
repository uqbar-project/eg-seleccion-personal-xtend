package ar.edu.seleccionPersonal

import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

import static extension ar.edu.seleccionPersonal.DateUtil.*

@Accessors
abstract class Empleado implements Postulante {

	Cargo cargo
	String sector
	Date fechaIngreso
	List<Empleado> personasACargo

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
