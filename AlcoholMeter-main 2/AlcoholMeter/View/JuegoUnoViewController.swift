//
//  JuegoUnoViewController.swift
//  AlcoholMeter
//
//  Created by Natalia De Biasio on 06/11/2021.
//

import Foundation
import UIKit
import SwiftUI

class JuegoUnoViewController: UIViewController {
//    var seconds=0
////    var timer=Timer()
//
//    var timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
//
//    @objc fileprivate func count(){
//        seconds=seconds+1
////        print(seconds)
//    }
    let userDefaults=UserDefaults()
    var timer=Timer()
    var count:Int=0
    @objc func TimerCounter()->Void{
        count=count+1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        userDefaults.set(timeString,forKey:"memoria")
        }
        
    
    func secondsToHoursMinutesSeconds(seconds:Int)->(Int,Int,Int)
    {
        return((seconds/3600),((seconds%3600)/60),((seconds%3600)%60))
    }
    func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String
        {
            var timeString = ""
            timeString += String(format: "%02d", hours)
            timeString += " : "
            timeString += String(format: "%02d", minutes)
            timeString += " : "
            timeString += String(format: "%02d", seconds)
            return timeString
        }
        
    @IBAction func seguir(_ sender: Any) {
                let epv = storyboard?.instantiateViewController(identifier: "resultadosView") as! ResultadosViewController
                present(epv, animated: true)
    }
    
//    @IBAction func siguiente(_ sender: Any) {
//
//        let epv = storyboard?.instantiateViewController(identifier: "resultadosView") as! ResultadosViewController
//        present(epv, animated: true)
//    }
 
    @IBOutlet weak var theContainer: UIView!

    //    @IBAction func botonInicio(_ sender: Any) {
////        timer.invalidate()
//        let iv = storyboard?.instantiateViewController(identifier: "inicioView") as! InicioViewController
//        present(iv, animated: true)
//    }
//
//    @IBAction func botonNuevoEstudio(_ sender: Any) {
//        let nev = storyboard?.instantiateViewController(identifier: "nuevoEstudioView") as! NuevoEstudioViewController
//        present(nev, animated: true)
//    }
//
//    @IBAction func botonHistorial(_ sender: Any) {
////        timer.invalidate()
//        let hv = storyboard?.instantiateViewController(identifier: "historialView") as! HistorialViewController
//        present(hv, animated: true)
//    }
//
//    @IBAction func botonPerfil(_ sender: Any) {
////        timer.invalidate()
//        let pv = storyboard?.instantiateViewController(identifier: "perfilView") as! PerfilViewController
//        present(pv, animated: true)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timer=Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(TimerCounter), userInfo: nil, repeats: true)
        
    
        let contentViewInHC=UIHostingController(rootView:EmojiMemoryGameView(viewModel: EmojiMemoryGame()))
        addChild(contentViewInHC)
        contentViewInHC.view.frame=theContainer.bounds
        theContainer.addSubview(contentViewInHC.view)
    }
    

//    fileprivate func setupHC(){
//        addChild(contentViewInHC)
//        view.addSubview(contentViewInHC.view)
//        contentViewInHC.didMove(toParent: self)
        
    }


//    @IBOutlet weak var labelTimer: UILabel!
//
//    var segundos = 5
//    var timer = Timer()
//    var timerCorriendo = false
//
//    // para milisegundos --> timeInterval: 0.001
//    func correrTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(actualizarTimer)), userInfo: nil, repeats: true)
//        timerCorriendo = true
//    }
//
//    @objc func actualizarTimer() {
//        if segundos < 1 {
//            timer.invalidate()
//        } else {
//            segundos -= 1
//            labelTimer.text = tiempoString(tiempo: TimeInterval(segundos))
//        }
//    }
//
//    func tiempoString(tiempo: TimeInterval) -> String {
//        let segundos = Int(tiempo) % 60
//
//
//        return String(format: "%02i", segundos)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//
//        if timerCorriendo == false {
//
//            let tiempoTI = TimeInterval(segundos)
//            labelTimer.text = tiempoString(tiempo: tiempoTI)
//            correrTimer()
//        }
//    }







