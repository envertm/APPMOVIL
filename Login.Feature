#Autor: Edinson
#Idioma: Español
@MVP-AppMovil @Android @Iphone
Feature: Login
  Como Cliente
  Quiero ingresar al Appmovil  con credencial de usuaru & Password
  Para asi poder utilizar el AppMovil

  Rule: El cliente debe ser mayor de edad o igual a 18 años
  #Uso de Background
  Background:
    Given Yo estoy en la pagina Login del AppMovil
  #Primer Scenario(+) Positivo
  @SRT-2021-OptimizacionAppMovil
  Scenario: Cuando realizo el Login con credenciales de Usuario & Password validos
    #Given Yo estoy en la pagina Login del AppMovil
    When Yo registro la cuenta email texbox con el valor "envertp@hotmail.com"
    And Yo registro el password textBox con el Valor "12345"
    And Yo doy Clic en el boton Login
    Then Yo deberia estar en la pagina principal de nombre Home Page del AppMovil
    And El Titulo de la Pagina de Home Page es "Bienvenida"
    But El boton Login no deberia estar presente en la pagina Home Page del AppMovil
       """
       nombre:
       MonoDisponibleCuenta: 1000
       LineaDisponible: 1000
       """
  #El Segundo Scenario(-) Negativo
  Scenario:  Cuando realizo el Login credenciales no validas
    #Given Yo estoy en la pagina Login del AppMovil
    When Yo registro la cuenta email textbox con el Valor "envertp@hotmail.com"
    And Yo registro el Password textbox con el valor "clave.errada"
    And Yo doy Click en el boton Login
    Then Yo no puedo acceder a la pagina Home Page
    And El Mensaje debera mostrar : Usuario y Password no validos
  #Scenario Outline
  Scenario Outline: Cuando realizo el Login con credenciales de Usuario & Password validos
    When Yo registro la cuenta email con el valor <email>
    And Yo registro el password con el Valor <password>
    And Yo doy Clic en el boton Login
    Then Yo deberia estar en la pagina principal de nombre Home Page del AppMovil
    And El Titulo de la Pagina de Home Page es "Bienvenida"
    But El boton Login no deberia estar presente en la pagina Home Page del AppMovil

    Examples:
    |email              |password|
    |envertp@gmail.com  |123456|
