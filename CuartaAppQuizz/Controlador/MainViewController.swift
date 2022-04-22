//
//  ViewController.swift
//  CuartaAppQuizz
//
//  Created by djdenielb on 07/04/22.
//

import UIKit

class MainViewController: UIViewController {
    
//    Instancia de cerebro, para acceder a todos sus metodos y atributos el atributo puntaje lo ponemos en 0
    var cerebro = Cerebro(puntaje: 0)
    
//    Creamos la variable timer de tipo Timer para acceder a toda la clase Timer()
    var timer = Timer()

//    Variables de enlace de elementos graficos
    @IBOutlet weak var labelPuntajes: UILabel!
    @IBOutlet weak var LabelPreguntas: UILabel!
    @IBOutlet weak var botonVerdadero: UIButton!
    @IBOutlet weak var botonFalso: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
//    Variable que servira de contador para el array
    var contador = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Decimos que el label donde iran las preguntas sera igual a lo que este en la primera posicion del array y lo ponemos en viewDidLoad para que se muestre el primer indice al arrancar la app
        LabelPreguntas.text = cerebro.arrayPreguntas[contador].preguntaArray
    }
    
//    Esto sera al presionar cada boton, se enlaza los 2 botones a la misma accion y con sender sabremos cual boton es
    @IBAction func Botones(_ sender: UIButton) {
            
//        Al presionar cualquier boton, llamara a la funcion de cambio color por medio de la instancia del objeto cerebro, este cambio color envia el texto del boton y utilizamos el elvis por si no tiene un texto el boton
//        - envia un elemento grafico que es el boton para cambiarle el color
//        - envia el contador
        cerebro.cambioColor(recibeRespuestaArray: sender.titleLabel?.text ?? "bien", recibeElementoGrafico: sender, recibeContador: contador)
//       que regrese a su color normal despues del tiempo, ejecutamos del Timer el metodo schedule que tiene un parametro de tiempo uno de repeticion y uno que ejecuta un closure, este closure lo que hace es cambiar el color al color original del boton, cuando cambia a verde se queda en verde, con este lo regresamos a su color orginal despues de medio segundo
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { timer in
            sender.backgroundColor = UIColor.secondarySystemBackground
        })
        
//        Cada que se precione el boton y despues de que se ejecute el cambio color, como en la funcion de cambio color se aumenta el puntaje en 1, aqui a la etiqueta puntaje le asignamos ese puntaje para que se vaya mostrando
        labelPuntajes.text = "Puntaje: \(cerebro.puntaje)"
        
//        Despues de que se aumente el puntaje aumentamos el contador en 1, para poder enviarlo con el nuevo valor a las demas funciones
        contador += 1
        
//        Despues en la barra de progreso para que pueda ir aumentando dependiendo el numero de preguntas, lo que hacemos asignarle a la barra, la suma de la funcion barra progreso que es 1 entre el tamaño del array
        progressView.progress += cerebro.barraProgreso()/Float(cerebro.arrayPreguntas.count)
        
//        Este if es para que no se desborde el array, si contador es menor que el tamaño del array entonces pone la siguiente pregunta, asigna a label pregunta la siguiente posicion del array con el contador
//        - En caso de que contador sea igual o mayor al tamaño del array, lo que hace es crear una alerta que mostrara el puntaje final en la etiqueta puntaje, ese puntaje final es que se fue aumentando en 1 cada que era boton verde
//        - Muestra un mensaje de si quieres volver a jugar y el estilo es po default
//        - Creamos un boton de con SI al presionarlo lo que hacemos es poner contador en 0, puntaje en 0, la barra de progreso en 0, la etiqueta de puntaje en 0 y el label pregunta tambien lo ponemos en la primera posicion que seria el contador
//        - Despues creamos un boton no, lo que hace el closure de ese boton es usar el metodo exit 0 esto finaliza la app y la cierra
//        - Agregamos los 2 botones a la alerta con el addaction
//        - Mostramos la alerta en la app (la presentamos)
        if contador < cerebro.arrayPreguntas.count{
            LabelPreguntas.text = cerebro.arrayPreguntas[contador].preguntaArray
        }else{
//            print("muere")
            let alerta = UIAlertController(title: "Tu puntaje es: \(cerebro.puntaje)", message: "Volver a jugar ??", preferredStyle: .alert)
            let botonJugar = UIAlertAction(title: "Si", style: .default) { UIAlertAction in
                self.contador = 0
                self.cerebro.puntaje = 0
                self.progressView.progress = 0
                self.labelPuntajes.text = "Puntaje: 0"
                self.LabelPreguntas.text = self.cerebro.arrayPreguntas[self.contador].preguntaArray
            }
            
            let botonNo = UIAlertAction(title: "No", style: .default) { UIAlertAction in
                exit(0)
            }
            
            alerta.addAction(botonJugar)
            alerta.addAction(botonNo)
            present(alerta, animated: true, completion: nil)
        }

    }
    
    }


