object knightRider {
    method peso(){
        return 500
    }
    method peligrosidad(){
        return 10
    }
    method bultos(){
        return 1
    }
}

object bumblebee {
    var modoAuto = true

    method peso(){
        return 800
    }
    method peligrosidad(){
        return if (modoAuto) 15 else 30
    }
    method transformarseEnAuto(){
        modoAuto = true
    }
    method transformarseEnRobot(){
        modoAuto = false
    }
    method estaEnModoAuto(){
        return modoAuto
    }
    method bultos(){
        return 2
    }
    method consecuenciaDeCarga(){
        self.transformarseEnRobot()
    }
}

object ladrillos {
    var property cantidad = 0

    method peso(){
        return cantidad * 2
    }
    method peligrosidad(){
        return 2
    }
    method bultos(){
        return if (cantidad <= 100) 1 else if (cantidad.between(101, 300)) 2 else 3
    }
    method consecuenciaDeCarga(){
        cantidad += 12
    }
}

object arena{
    var property peso = 0.max(0)
    method peligrosidad(){
        return 1
    }
    method bultos(){
        return 1
    }
    method consecuenciaDeCarga(){
        peso -= 10
    }
}

object bateriaAntiaerea{
    var property estaConMisiles = false

    method peso(){
        return if(estaConMisiles) 300 else 200
    }
    method peligrosidad(){
        return if(estaConMisiles) 100 else 0
    }
    method bultos(){
        return if (estaConMisiles) 2 else 1
    }
    method consecuenciaDeCarga(){
        estaConMisiles = true
    }
}

object contenedor{
    const cosas = []
    method agregarCosa(unaCosa){
        cosas.add(unaCosa)
    }
    method quitarCosa(unaCosa){
        cosas.remove(unaCosa)
    }
    method agregarVariasCosas(listaDeCosas){
        cosas.addAll(listaDeCosas)
    }
    method peso(){
        return 100 + cosas.sum({c=>c.peso()})
    }
    method peligrosidad(){
        return if(cosas.isEmpty()) 0 else cosas.max({c=>c.peligrosidad()}).peligrosidad()
    }
    method bultos(){
        return 1 + cosas.sum({c => c.bultos()})
    }
    method consecuenciaDeCarga(){
        cosas.forEach({c => c.consecuenciaDeCarga()})
    }
}

object residuosRadioactivos{
    var property peso = 0
    method peligrosidad(){
        return 200
    }
    method bultos(){
        return 1
    }
    method consecuenciaDeCarga(){
        peso += 15
    }
}

object embalaje{
    var property cosaEnvuelta = arena
    method peso(){
        return cosaEnvuelta.peso()
    }
    method peligrosidad(){
        return cosaEnvuelta.peligrosidad() * 0.5
    }
    method bultos(){
        return 2
    }
}

