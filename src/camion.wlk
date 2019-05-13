import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.serCargada()
	}
	
	method descargar(cosa){
		cosas.remove(cosa)
	}
	
	method descargarTodo(){cosas.clear()}
	
	method pesoTotal() = self.pesoTotalDeCosas() + self.tara()
	
	method pesoTotalDeCosas() = self.pesoDeCosas().sum()            
	
	method pesoDeCosas() = cosas.map({cosa => cosa.peso()})    // metodo pedido mas adelante, pesos()
	
	method tara() = 1000
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosPeligrosos(nivel)=
	
	   cosas.filter({item => item.nivelPeligrosidad() == nivel})
	
	method objetosMasPeligrososQue(cosa)=
	
	   cosas.filter({item => item.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	
	method puedeCircularEnRuta(nivelMaximoDePeligrosidad)=
	
	   not cosas.any({cosa => cosa.nivelPeligrosidad() > nivelMaximoDePeligrosidad})
	   
	   
	   
	   
                   ////////////  AGREGADOS  \\\\\\\\\\\\
	 
	method tieneAlgoQuePesaEntre(min,max) =
	   
	   self.pesoDeCosas().any({peso=>peso.between(min,max)})
	
	
    method cosaMasPesada(){
    	
    	if(cosas.isEmpty()){ return "No hay nada en el camion"}
    	
    	else{return cosas.max({cosa => cosa.peso()})}
    } 
    
    
    method totalBultos() = 
       cosas.sum({cosa => cosa.bultos()})
    
    
    
    //Pesos esta hecho como un metodo llamado pesoDeCosas.
    
    
    	
    
}


