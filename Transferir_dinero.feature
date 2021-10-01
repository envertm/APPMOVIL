#Autor:Enver
#Idioma: Español
@MVP-AppMovil @Android @Iphone
Feature: Transferir Dinero
  Como Cliente del Banco IBK
  Quiero transferir entre mis cuentas
  Para Finaciar mi tarjeta de credito
  #Uso de Background
  Background:
    Given El cliente esta en la pagina Transferir
  #Primer Scenario(+) Positivo
  @SRT-2021-OptimizacionAppMovil
  Scenario: Cuando el Cliente tiene disponible Dinero
    #Given El cliente esta en la pagina Transferir
    Then El dinero es Transferido a la segunda cuenta bancaria
    And El cliente tiene cuenta bancaria con tipo de moneda en Soles
    And El cliente tiene dinero disponible en cuenta Bancaria
    When Cuando el cliente solicita Transferir Dinero entre sus cuentas
  #Seundo scenario (-) Negativo
  Scenario: Cuendo el Cliente no tiene Dinero disponible
    #Given El cliente esta en la pagina Transferir
    And El cliente tiene cuenta bancaria con tipo de moneda en Soles
    And El cliente no tiene Monto disponible en cuenta Bancaria
    When El cliente solicita transferir Dinero entre sus cuentas
    Then El cliente no puede Transferir a la segunda cuenta bancaria
    And El mensaje deberia mostrar : No cuenta con monto disponible para realizar dicha operacion
 #Scenario Outline
  Scenario Outline: Transferir Dinero
    Given La cuenta bancaria tiene <dineroDisponiblePrimeraCuenta>
    And El Cliente tiene una cuenta Bancaria con tipo  <moneda>
    When El cliente solicita transferir dinero <dineroTransferido>
    Then El Dinero es Transferido a la segunda cuenta Bancaria <mensaje>
    Examples:
    |dineroDisponiblePrimeraCuenta|moneda |dineroTransferido  |mensaje                          |
    |1000.00                      |Soles  |100.00             |Transferencia realizado con exito|
