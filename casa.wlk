import cosas.*
import cuentas.*

object casa {
  const property cosas = []
  var property cuenta = cuentaCorriente

  method comprar(cosa) {
    self.gastar(cosa.precio())
    cosas.add(cosa)
  }

  method gastar(importe) {
    cuenta.extraer(importe)
  }

  method dineroDisponible() = cuenta.saldo()

  method cantidadDeCosasCompradas() = cosas.size()

  method tieneComida() = cosas.any({ c => c.esComida() })

  method ultimaCosaComprada() = cosas.last()

  method vieneDeEquiparse() {
    if (cosas.isEmpty()) {
      return false
    } else {
      return self.ultimaCosaComprada().esElectrodomestico() 
      or self.ultimaCosaComprada().precio() > 50000
    }
  }

  method esDerrochona() = cosas.sum({ c => c.precio() }) >= 90000

  method compraMasCara() = cosas.max({ c => c.precio() })

  method electrodomesticosComprados() = cosas.filter({ c => c.esElectrodomestico() })

  method malaEpoca() = cosas.all({ c => c.esComida() })

  method queFaltaComprar(lista) = lista.filter({ c => not cosas.contains(c) })

  method faltaComida() = cosas.count({ c => c.esComida() }) < 2
}
