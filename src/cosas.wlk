	object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() = 1
	method serCargada(){}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	method bultos() = 2
	
	method estaEnModoAuto() = transformadoEnAuto
	
	method serCargada() { transformadoEnAuto = false }
}

object paqueteDeLadrillos{
	
	var property cantLadrillos = 0
	
	method peso() = 2 * self.cantLadrillos() 
	
	method nivelPeligrosidad() = 2
	
	method bultos() = (self.cantLadrillos() / 100).roundUp()
	
	method serCargada() {cantLadrillos +=12}
}

object arenaAGranel{
	var property pesoActual = 0
	
	method peso() = pesoActual
	
	method nivelPeligrosidad() = 1
	
	method bultos() = 1
	
	method serCargada(){pesoActual += 20}
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
	
	method serCargada(){tieneMisiles = true}   
}


object contenedorPortuario{
	var cosasDentro = []
	
	 
	method peso() {
		if (cosasDentro.isEmpty()){return 0}
		else{ return 100 + self.pesoTotalDeCosas() } 
	}
	method pesoCosas() = cosasDentro.map({cosa => cosa.nivelPeligrosidad()})
	
	method pesoTotalDeCosas() = self.pesoCosas() .sum()
	
	method nivelPeligrosidad() {
		if (cosasDentro.isEmpty()){return 0}
		else{ return self.nivelPeligrosidadDeCosasDentro().max() } 
	}
	
	method nivelPeligrosidadDeCosasDentro() =
	    cosasDentro.map({cosa => cosa.nivelPeligrosidad()})
	
	method agregarCosa(cosa){ cosasDentro.add(cosa) }
	
	method serCargada(){
		cosasDentro.forEach({cosa => cosa.serCargada()})
	}
	
}

object residuoRadioactivo{
	var  peso = 0
	
	
	method setearPeso(unPeso){peso = unPeso}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 200
	
	method bultos() = 1
	
	method serCargada(){peso += 15}
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
	
	method serCargada(){}
	
}

