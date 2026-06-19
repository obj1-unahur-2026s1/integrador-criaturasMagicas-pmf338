import roles.*
class Criatura {
  var poderMagico
  var astucia
  var rol
  const mascotas = []

  method poderMagico() = poderMagico
  method astucia() = astucia
  method rol() = rol
  method mascotas() = mascotas

  method perderPoderMagico(porcentaje) {
    poderMagico = poderMagico - poderMagico * porcentaje
  }

  method poderOfensivoBase() = poderMagico * 10 + rol.extra(self)
  method poderOfensivo() = self.poderOfensivoBase()

  method esAstuta()
  method esExtraordinaria() = rol.esExtraordinario(self)
  method esFormidable() = self.esAstuta() || self.esExtraordinaria()

  method agregarMascota(mascota) {mascotas.add(mascota)}

  method cambiarRol(nuevoRol)

  method cambiarRolADomadorConMascota(mascotaNueva) {
    rol = domador
    mascotas.add(mascotaNueva)
  }

  method cambiarRolAGuardian() {rol = guardian}

  method cambiarRolAHechicero() {
    if (!mascotas.any({m => m.tieneCuernos()})) {
      error.throwWithMessage("El ritual fue cancelado: no hay mascota con cuernos")
    }
    rol = hechicero
  }
}

class Duende inherits Criatura {
  override method poderOfensivo() = self.poderOfensivoBase() * 1.1

  override method esAstuta() = false

  override method cambiarRol(nuevoRol) {
    if (rol == guardian) {
      error.throwWithMessage("Desde guardián solo se puede pasar a domador con una mascota nueva")
    }
    if (rol == hechicero) {
      self.cambiarRolAGuardian()
      
    }
    if (rol == domador) {
      self.cambiarRolAHechicero()
    }
  }
}

class Hada inherits Criatura {
  var kilometrosDeVuelo = 2

  method kilometrosDeVuelo() = kilometrosDeVuelo

  method aumentarVuelo(kilometros) {
    kilometrosDeVuelo = (kilometrosDeVuelo + kilometros).min(25)
  }

  override method esAstuta() = astucia > 50

  override method esExtraordinaria() = super() && kilometrosDeVuelo > 10

  override method cambiarRol(nuevoRol) {
    if (rol == guardian) {
      error.throwWithMessage("Desde guardián solo se puede pasar a domador con una mascota nueva")
    }
    if (rol == hechicero) {
      self.cambiarRolAGuardian()
      
    }
    if (rol == domador) {
      self.cambiarRolAHechicero()
    }
  }
}