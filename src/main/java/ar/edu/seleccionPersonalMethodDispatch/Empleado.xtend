package ar.edu.seleccionPersonalMethodDispatch

import java.time.LocalDate
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

import static extension ar.edu.seleccionPersonalMethodDispatch.DateUtil.*

@Accessors
abstract class Empleado implements Postulante {

	Cargo cargo
	String sector
	LocalDate fechaIngreso
	List<Empleado> personasACargo

	new() {
		personasACargo = new ArrayList<Empleado>
		fechaIngreso = LocalDate.now	
	}
	
	def getFechaAntiguedad(LocalDate hoy) {
		hoy.diferenciaCon(fechaIngreso)
	}
	
	def getFechaAntiguedad() {
		LocalDate.now().fechaAntiguedad
	}

	def int cantidadPersonasACargo() {
		personasACargo.size
	}
	
}
