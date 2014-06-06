package ar.edu.seleccionPersonal

class PersonalPlanta extends Empleado {
	
	@Property Cargo cargo
	
	def sueldo() {
		cargo.sueldo	
	}
	
}