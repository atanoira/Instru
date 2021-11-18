//
//  PerfilViewController.swift
//  AlcoholMeter
//
//  Created by Lorenza Vecino on 27/10/2021.
//

import UIKit
import SwiftUI


class PerfilViewController: UIViewController {
    
//@EnvironmentObject var env: GlobalEnviroment
    

//        @EnvironmentObject var nombre: Nombre
//        @EnvironmentObject var fechaDeNac: FechaDeNac
//        @EnvironmentObject var sexo: Sexo
//        @EnvironmentObject var peso: Altura
//        @EnvironmentObject var altura: Altura
//        @EnvironmentObject var limite: Limite
//
  
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var limit: UILabel!
    @IBOutlet weak var date: UILabel!
    let userDefaults=UserDefaults()
    
    @State var nombre = "Maria"
    @State var fechaDeNac = 30021998
    @State var sexo = "Femenino"
    @State var peso = 57
    @State var altura = 120
    @State var limite = 0
    
    

//    @EnvironmentObject var profile: Persona
    
    @IBAction func botonInicio(_ sender: Any) {
        let iv = storyboard?.instantiateViewController(identifier: "inicioView") as! InicioViewController
        present(iv, animated: true)
    }
    
    @IBAction func botonNuevoEstudio(_ sender: Any) {
        let nev = storyboard?.instantiateViewController(identifier: "nuevoEstudioView") as! NuevoEstudioViewController
        present(nev, animated: true)
    }
    
    @IBAction func botonHistorial(_ sender: Any) {
        let hv = storyboard?.instantiateViewController(identifier: "historialView") as! HistorialViewController
        present(hv, animated: true)
    }
    
    @IBAction func botonPerfil(_ sender: Any) {
    }
    
    @IBAction func botonEditarPerfil(_ sender: Any) {
        let epv = storyboard?.instantiateViewController(identifier: "editarPerfilView") as! EditarPerfilViewController
        present(epv, animated: true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let value=userDefaults.value(forKey: "name") as? String{
            name.text = value}
        if let value=userDefaults.value(forKey: "sexo") as? String{
            sex.text = value}
//        sex.text = sexo
        if let value=userDefaults.value(forKey: "peso") as? String{
            weight.text = value}
//        weight.text = String(peso)
        if let value=userDefaults.value(forKey: "altura") as? String{
            height.text = value}
        if let value=userDefaults.value(forKey: "limite") as? String{
            limit.text = value}
    
        if let value=userDefaults.value(forKey: "fecha") as? String{
            date.text = value}
//        height.text = String(altura)
//
//        limit.text=String(limite)
        // Do any additional setup after loading the view.
    }
    

}
