
import cosas.*
object camion {
    const carga = []

    method cargarVariasCosas(listaDeCosas){
        carga.addAll(listaDeCosas)
    }
    method cargar(algo){
        carga.add(algo)
        algo.consecuenciaDeCarga()
    }
    method descargar(algo){
        carga.remove(algo)
    }


    method cargaTotal(){
        return carga.sum({c => c.peso()})
    }
    method pesoTotal(){
        return 1000 + self.cargaTotal()
    }
    method pesosDeLaCarga(){
        return carga.map({c => c.peso()})
    }
    method todoPesoImpar(){
        return self.pesosDeLaCarga().all({e => e.odd()})
    }
    method algoPesa(unValor){
        return carga.any({c => c.peso() == unValor})
    }
    method cosaConPeligrosidad(nivel){
        return carga.find({c => c.peligrosidad() == nivel})
    }
    method cosasQueSuperanPeligrosidad(nivel){
        return carga.filter({c => c.peligrosidad() > nivel})
    }
    method cosasMasPeligrosaQue(unaCosa){
        return carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    }
    method excedidoMaximoPeso(){
        return self.pesoTotal() > 2500
    }
    method puedeCircularEnRuta(unValor){
        return not self.excedidoMaximoPeso() && self.cosasQueSuperanPeligrosidad(unValor).isEmpty()
    }
    method tieneAlgoQuePesaEntre(min,max){
        return carga.any({c => c.peso().between(min,max)})
    }
    method cosaMasPesada(){
        return carga.max({c => c.peso()})
    }


}