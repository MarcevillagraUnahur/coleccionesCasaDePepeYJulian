object heladera {
  method precio() = 200000
  method esComida() = false
  method esElectrodomestico() = true
}

object cama {
  method precio() = 80000
  method esComida() = false
  method esElectrodomestico() = false
}

object tiraDeAsado {
  method precio() = 3500
  method esComida() = true
  method esElectrodomestico() = false
}

object paqueteDeFideos {
  method precio() = 500
  method esComida() = true
  method esElectrodomestico() = false
}

object plancha {
  method precio() = 12000
  method esComida() = false
  method esElectrodomestico() = true
}

object milanesasRebozadas {
  method precio() = 2600
  method esComida() = true
  method esElectrodomestico() = false
}

object salsaDeTomates {
  method precio() = 900
  method esComida() = true
  method esElectrodomestico() = false
}

object microondas {
  method precio() = 42000
  method esComida() = false
  method esElectrodomestico() = true
}

object cebollas {
  method precio() = 250
  method esComida() = true
  method esElectrodomestico() = false
}

object dolar {
  var property precioDeVenta = 1000
}

object compu {
  method precio() = 500 * dolar.precioDeVenta()
  method esComida() = false
  method esElectrodomestico() = true
}

object packComida {
  var property plato = tiraDeAsado
  var property aderezo = salsaDeTomates

  method precio() = plato.precio() + aderezo.precio()
  method esComida() = true
  method esElectrodomestico() = false
}
