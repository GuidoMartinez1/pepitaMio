import extras.*
import wollok.game.*

object pepita {

	var energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()){"pepita-grande.png"}else{
		 if(self.colisionaConSilvestre() or self.estaCansada()){"pepita-gris.png" }
		 else "pepita.png"
	}
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida) // saca el elemento del tablero
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if ((not self.estaCansada())){
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method colisionaConSilvestre() = position == silvestre.position()

}

