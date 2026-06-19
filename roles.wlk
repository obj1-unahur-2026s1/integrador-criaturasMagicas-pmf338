object guardian {
  method extra(criatura) = 100
  method esExtraordinario(criatura) = criatura.poderMagico() > 50

  // Desde guardián el ritual solo puede llevar a domador, y requiere
  // una mascota nueva (de 1 año, sin cuernos) provista por quien invoca el ritual.
  method realizarRitual(criatura, mascotaNueva) {
    criatura.convertirseEnDomadorCon(mascotaNueva)
  }
}

object hechicero {
  method extra(criatura) = 0
  method esExtraordinario(criatura) = true

  // Desde hechicero el ritual solo puede llevar a guardián.
  method realizarRitual(criatura, mascotaNueva) {
    criatura.convertirseEnGuardian()
  }
}

object domador {
  method extra(criatura) = criatura.mascotas().count({m => m.tieneCuernos()}) * 150

  method esExtraordinario(criatura) {
    criatura.poderMagico() >= 15 &&
    criatura.mascotas().all({m => m.esVeterana()})
  }

  // Desde domador el ritual solo puede llevar a hechicero, y requiere
  // al menos una mascota con cuernos; si no, el ritual se cancela con error.
  method realizarRitual(criatura, mascotaNueva) {
    if (!criatura.mascotas().any({m => m.tieneCuernos()})) {
      error.throwWithMessage("El ritual fue cancelado: no hay mascota con cuernos")
    }
    criatura.convertirseEnHechicero()
  }
}