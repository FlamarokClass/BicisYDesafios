import bicis.*
import accesorios.*

class Deposito {
	const bicicletas = []
	
	
	method agregarBici(unaBici) {
		bicicletas.add(unaBici)
	}
	
	method quitarBici(unaBici) {
		/*if(! unaBici.any({bici => bici.contains(bici)})){
			throw new Exception(message = "no se encuentra la bici a sacar")
		}*/
		bicicletas.remove(unaBici)
	}
	
	method bicisRapidas() {
		return bicicletas.filter({b => b.velocidadCrucero() > 25})
	}
	
	method marcasDeBicis() {
		return bicicletas.map({b => b.marca()}).asSet()
	}
	
	method esNocturno() {
		return bicicletas.all({b => b.tieneLuz()})
	}
	
	method bicicletaParaCarga(kgDeCarga) {
		return bicicletas.any({b =>  b.carga() > kgDeCarga })
	}
	
	method marcaMasRapida() {
		return self.bicisRapidas().max({b => b.velocidadCrucero()}).marca()
	}
	
	method bicicletasLargas() {
		return bicicletas.filter({b => b.biciLarga()})
	}
	
	method cargaTotalBicisLargas() {
		return self.bicicletasLargas().sum({b => b.carga()})
	}
	
	method bicicletasSinAccesorios() {
		return bicicletas.count({b => b.biciSinAccesorio()})
	}
	
	method bicisCompanieras(unaBici) {
		return bicicletas.filter({b => b.sonCompanieras(unaBici) and b != unaBici})
	}
	
	// Desafios
	method hayBicisCompanieras() {
		return bicicletas.any({b => self.bicisCompanieras(b).isEmpty().negate()})
	}
		// Explicación: negate es not, lo cual si No está vacia, tiene una companiera, y dará falso, el negate lo convierte en verdadero, dando verdadero el booleando del metodo 
		
	method biciCompanieraDe(unaBici) {
		return bicicletas.find({bici => bici.sonCompanieras(unaBici)})
	}
	method hayCompanieraDe(unaBici) {
		return !self.bicisCompanieras(unaBici).isEmpty()
	}
	
	method paresDeCompanieras() {
		const companieras = #{}
		bicicletas.forEach({b=> 
			if(self.hayCompanieraDe(b)) {
				self.agregarParDeBicicletas(b,companieras)
			}
		})
		return companieras
	}
	
	
	method agregarParDeBicicletas(bici,paresCompanieras) {
		self.bicisCompanieras(bici).forEach({c =>
			if(!paresCompanieras.any({pb => pb.yaEstaElParDeBicis(bici,c)})) { // verificar que no exista el par cargado 
				paresCompanieras.add(new ParDeBicis(companieras = #{bici,c})) // agrega la bici mas la companieras
			} //pb : par de bicis
		})
	}
	
}
