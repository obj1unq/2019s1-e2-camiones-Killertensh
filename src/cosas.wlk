	object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() = 1
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	method bultos() = 2
}

object paqueteDeLadrillos{
	
	var property cantLadrillos = 0
	
	method peso() = 2 * self.cantLadrillos() 
	
	method nivelPeligrosidad() = 2
	
	method bultos(){
		if (cantLadrillos <= 100) {return 1}
		else if (cantLadrillos.between(101,300)){return 2}
		else{return 3}  
	}
}

object arenaAGranel{
	var property pesoActual = 0
	
	method peso() = pesoActual
	
	method nivelPeligrosidad() = 1
	
	method bultos() = 1
}

object bateriaAntiAerea{
	
	var property tieneMisiles = null
	
	method peso() = 
	  if (self.tieneMisiles()){return 300}
	  else {return 200}
	  
	method nivelPeligrosidad() = 
	  if (self.tieneMisiles()){return 100}
	  else {return 0 } 
	  
	method bultos(){
		if (self.tieneMisiles()){return 1}
	    else{return 2}	
	}   
}


object contenedorPortuario{
	var cosasDentro = []
	
	 
	method peso() {
		if (cosasDentro == []){return 0}
		else{ return 100 + self.pesoTotalDeCosas() } 
	}
	method pesoCosas() = cosasDentro.map({cosa => cosa.nivelPeligrosidad()})
	
	method pesoTotalDeCosas() = self.pesoCosas() .sum()
	
	method nivelPeligrosidad() = self.pesoCosas().max()
	
	method agregarCosa(cosa){ cosasDentro.add(cosa) }
	
}

object contRadioactivo{
	var property peso = 0
	
	method nivelPeligrosidad() = 200
	
	method bultos() = 1
}


object embalajeDeSeguridad{
	
	var property cosaDentro = null
	
	method peso(){
		if (!self.tieneAlgoDentro()){return 0}
		else{return cosaDentro.peso()}
	}
	
	method tieneAlgoDentro() = cosaDentro != null
	
	method nivelPeligrosidad(){
		if (!self.tieneAlgoDentro()){return 0}
		else{return cosaDentro.nivelPeligrosidad()}
	}
	
	method bultos() = 2
	
}

