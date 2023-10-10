

class Farolito  {
	const property esLuminoso = true
	method carga() = 0
	method peso() = 0.5
	
}

class Canasto {
	const volumen 
	method esLuminoso() = false
	
	method peso() = volumen / 10
	
	method carga() = volumen * 2
}


class MorralDeBici {
	const property largo
	const property tieneOjoDeGato  // true o false 
	method peso() = 1.2
	
	method carga() = largo / 3
	
	method esLuminoso() = self.tieneOjoDeGato() 
	
}


/*
	Para agregar otro accesorio solo debemos crear otra clase con el nombre del accesorio, y estos accesorios deben 
	entender 3 mensajes fundamentales, peso, carga y si es o no luminoso. De esta manera la bicicleta podrá
	utilizar e intercambiar cualquier tipo de accesorio sin verse afectado (generar un error de comprension de mensajes). 
	 
*/