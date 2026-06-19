import roles.*
class Criatura {
  var poderMagico
  const astucia
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

  // El ritual se delega completamente al rol actual, es el rol quien sabe
  // a que otro rol puede transformar a la criatura.
  method cambiarRol(mascotaNueva) {rol.realizarRitual(self, mascotaNueva)}

  method convertirseEnGuardian() {rol = guardian}

  method convertirseEnHechicero() {rol = hechicero}

  method convertirseEnDomadorCon(mascotaNueva) {
    rol = domador
    mascotas.add(mascotaNueva)
  }
}

class Duende inherits Criatura {
  override method poderOfensivo() = self.poderOfensivoBase() * 1.1

  override method esAstuta() = false
}

class Hada inherits Criatura {
  var kilometrosDeVuelo = 2

  method kilometrosDeVuelo() = kilometrosDeVuelo

  method aumentarVuelo(kilometros) {
    kilometrosDeVuelo = (kilometrosDeVuelo + kilometros).min(25)
  }

  override method esAstuta() = astucia > 50

  override method esExtraordinaria() = super() && kilometrosDeVuelo > 10
}

class MascotaMitologica {
  const edad
  const tieneCuernos

  method edad() = edad
  method tieneCuernos() = tieneCuernos

  method esVeterana() {edad >= 10}
}