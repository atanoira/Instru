//
//  EspereViewController.swift
//  AlcoholMeter
//
//  Created by Lorenza Vecino on 28/10/2021.
//

import UIKit
import SwiftUI

class EspereViewController: UIViewController {
    
    @IBAction func botonInicio(_ sender: Any) {
        timer.invalidate()
        let iv = storyboard?.instantiateViewController(identifier: "inicioView") as! InicioViewController
        present(iv, animated: true)
    }
    
    @IBAction func botonNuevoEstudio(_ sender: Any) {
        let nev = storyboard?.instantiateViewController(identifier: "nuevoEstudioView") as! NuevoEstudioViewController
        present(nev, animated: true)
    }
    
    @IBAction func botonHistorial(_ sender: Any) {
        timer.invalidate()
        let hv = storyboard?.instantiateViewController(identifier: "historialView") as! HistorialViewController
        present(hv, animated: true)
    }
    
    @IBAction func botonPerfil(_ sender: Any) {
        timer.invalidate()
        let pv = storyboard?.instantiateViewController(identifier: "perfilView") as! PerfilViewController
        present(pv, animated: true)
    }
    
    @IBAction func botonBack(_ sender: Any) {
        let nev = storyboard?.instantiateViewController(identifier: "nuevoEstudioView") as! NuevoEstudioViewController
        present(nev, animated: true)
    }
    
    @IBOutlet weak var labelTimer: UILabel!
    
    var segundos = 10
    var timer = Timer()
    var timerCorriendo = false
    
    // para milisegundos --> timeInterval: 0.001
    func correrTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(actualizarTimer)), userInfo: nil, repeats: true)
        timerCorriendo = true
    }
    
    @objc func actualizarTimer() {
        if segundos < 1 {
            timer.invalidate()
        } else {
            segundos -= 1
            labelTimer.text = tiempoString(tiempo: TimeInterval(segundos))
        }
    }
    
    func tiempoString(tiempo: TimeInterval) -> String {
        let segundos = Int(tiempo) % 60
        if segundos==0{
            let jue = storyboard?.instantiateViewController(identifier: "ingresarview") as! IngresarViewController
            present(jue, animated: true)
        }
        return String(format: "%02i", segundos)
    }
    
    
//    struct DestinationPageView: View {
//        var theme: ThemeCollection.Theme
//        var viewModel: EmojiMemoryGameViewModel
//        init(theme: ThemeCollection.Theme) {
//            self.theme = theme
//            self.viewModel = EmojiMemoryGameViewModel(theme: theme)
//        }
//        var body: some View {
//            viewModel.resetGame()
//            return EmojiMemoryGameView(viewModel: viewModel)
//        }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if timerCorriendo == false {
            
            let tiempoTI = TimeInterval(segundos)
            labelTimer.text = tiempoString(tiempo: tiempoTI)
            correrTimer()
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



struct EspereViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
