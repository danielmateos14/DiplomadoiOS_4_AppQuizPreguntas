//
//  Cerebro.swift
//  CuartaAppQuizz
//
//  Created by djdenielb on 09/04/22.
//

import Foundation
import UIKit

struct Cerebro{
//    Una variable que servira para acumular el puntaje
    var puntaje: Int
//   Instancia de los atributos preguntas para crear objeto de esa struct, creamos cada objeto con sus atributos dentro de cada posicion del array, un atributo pregunta y otro respuesta
    let arrayPreguntas = [
        AtributosPreguntas(preguntaArray: "Brasil ha ganado 5 mundiales de futbol", respuestaArray: "Verdadero"),
        AtributosPreguntas(preguntaArray: "7 x 5 es 36 ", respuestaArray: "Falso"),
        AtributosPreguntas(preguntaArray: "Daddy Yankee se retira de la musica en 2022", respuestaArray: "Verdadero"),
        AtributosPreguntas(preguntaArray: "Putin es el prseidente de Ucrania", respuestaArray: "Falso"),
        AtributosPreguntas(preguntaArray: "La final de Champions League 2022 sera en Paris", respuestaArray: "Verdadero")
    ]
    
    
//     creamos una funcion de cambio de color, esta funcion recibe un string que es el texto de cada uno de los botones, recibe un elemento grafico que es un UIboton y recibe un entero que es un contador
//    - El contador viene el viewController ese contador lo use aqui para compararlo con el tamaño del array  cada que se presione algun boton de los que se envian incrementa ese contador y viene para aca, si es menor lo que hara es tomar el UIbutoon que recibe y cambiarle el color de fondo por verde cuando ya sea igual o mayor cambiar el background a color rojo
//    - cuando entra el if la variable puntaje aumenta 1
//    - El mutating se pone para poder modificar los atributos o variables de este struct en este caso el puntaje
     mutating func cambioColor(recibeRespuestaArray: String, recibeElementoGrafico: UIButton, recibeContador: Int){
        if recibeContador < arrayPreguntas.count{
            if recibeRespuestaArray == arrayPreguntas[recibeContador].respuestaArray{
                recibeElementoGrafico.backgroundColor = UIColor.green
                puntaje += 1
            }else{
                recibeElementoGrafico.backgroundColor = UIColor.red
            }
        }
    }
    
//    Esta funcion lo que hace es recibir un flotante que sera la barraProgreso del viewController
//    - Creamos una constante que sera igual a la division del tamaño del array entre el tamaño del array en este caso sera 1
//    - Retornamos la constante
    func barraProgreso() -> Float{
        let barraProgreso: Float = Float(arrayPreguntas.count) / Float(arrayPreguntas.count)
        return barraProgreso
    }
        
    }




