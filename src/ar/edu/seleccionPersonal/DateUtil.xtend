package ar.edu.seleccionPersonal

import java.util.Date
import org.joda.time.DateTime
import org.joda.time.Period

class DateUtil {

	def static diferenciaCon(Date date1, Date date2) {
		val fecha1 = new DateTime(date1.time)
		val fecha2 = new DateTime(date2.time)
		val period = new Period(fecha2, fecha1)
		var difAnios = period.years
		if (period.months > 0 || period.days > 0) {
			difAnios = difAnios + 1
		} 
		difAnios
	}

}
