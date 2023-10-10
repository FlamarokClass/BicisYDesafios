import accesorios.*

class Bicicleta {
	var property rodado
	const property largo 
	const property marca
	const accesorios = [] 
	
	method agregarAccesorio(unAccesorio) {
		accesorios.add(unAccesorio)
	}
	
	method sacarAccesorio(unAccesorio) {
		accesorios.remove(unAccesorio)
	}
	
	method altura() {
		return rodado* 2.5 + 15
	}
	
	method velocidadCrucero() {
		return if(largo > 120){rodado + 6}else{rodado + 2}
	}
	
	method carga() {
		return accesorios.sum({a => a.carga()})
	}
	
	method pesoDeCarga(){
		return accesorios.sum({a => a.peso()})
	}
	
	method peso() {
		return rodado / 2 + self.pesoDeCarga()
	}
	
	method tieneLuz() {
		return accesorios.any({a => a.esLuminoso()})
	}
	
	method cantidadAccesoriosLivianos() {
		return accesorios.count({a => a.peso() < 1})
	}
	
	method biciLarga() {
		return largo >= 170
	}
	
	method biciSinAccesorio() {
		return accesorios.isEmpty()
	}
	
	method sonCompanieras(unaBici) {
		const diferenciaDeLargo = self.largo() - unaBici.largo() 
		return self.marca() == unaBici.marca() and diferenciaDeLargo <= 10 and diferenciaDeLargo >= -10
 	}
	
}

// Desafio
class ParDeBicis {
	const property companieras = #{}
	method yaEstaElParDeBicis(unaBici,otraBici) {
		return companieras.contains(unaBici) and companieras.contains(otraBici)
	}
}