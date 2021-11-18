//
//  EditarPerfilViewController.swift
//  AlcoholMeter
//
//  Created by Lorenza Vecino on 28/10/2021.
//

import UIKit
import SwiftUI

// class EditarPerfilViewController: UIViewController {
class EditarPerfilViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let userDefaults=UserDefaults()
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerSexo: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sexos.count
    }
    func pickerView(_ pickerSexo: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sexos[row]
    }
    
    @State var sex="Fem"
    
   
    @IBOutlet weak var sexodisplay: UILabel!
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexodisplay.text = sexos[row]
        userDefaults.setValue(sexodisplay.text, forKey:"sexo")
    }
   
 
    @IBOutlet weak var pickerSexo: UIPickerView!
    let sexos = ["Femenino", "Masculino", "Otro"]
   
   
    
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
        let pv = storyboard?.instantiateViewController(identifier: "perfilView") as! PerfilViewController
        present(pv, animated: true)
    }
    
    @IBOutlet weak var nombreIngresado: UITextField!
    @IBOutlet weak var fechaIngresada: UIDatePicker!
    @IBOutlet weak var pesoIngresado: UITextField!
    @IBOutlet weak var alturaIngresada: UITextField!
    @IBOutlet weak var limiteIngresado: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if nombreIngresado.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields."
        }
        
        return nil
    }
    
    
    @IBAction func botonGuardar(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
//            showError(error!)
        }
        else{
        
        let name = nombreIngresado.text
        let date = fechaIngresada.date
//            let sex = pickerSexo.inputView
        let weight=Double(pesoIngresado.text!)!
        let height = Double(alturaIngresada.text!)!
        let limit = Float(limiteIngresado.text!)
        let persona1 = Persona()
        
        
            userDefaults.setValue(nombreIngresado.text, forKey:"name")
            userDefaults.setValue(fechaIngresada.date, forKey:"fecha")
            userDefaults.setValue(pesoIngresado.text, forKey:"peso")
            userDefaults.setValue(alturaIngresada.text, forKey:"altura")
            userDefaults.setValue(limiteIngresado.text, forKey:"limite")
//            userDefaults.setValue(sexo, forKey:"sexo")
            
        persona1.nombre = name
//        persona1.fechaDeNac = date
//        persona1.sexo = sex
        persona1.peso = weight
        persona1.altura = height
        persona1.limite = limit
            
            let pv = storyboard?.instantiateViewController(identifier: "perfilView") as! PerfilViewController
            present(pv, animated: true)
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerSexo.delegate = self
        pickerSexo.dataSource = self
        
    }
    
}
//func showError(_ message:String) {
//
//    errorLabel.text = message
//    errorLabel.alpha = 1
//}



class Persona: ObservableObject {
    @Published var nombre:String?
    @Published var edad:Int?
    @Published var fechaDeNac:String?
    @Published var sexo:String?
    @Published var peso:Double?
    @Published var altura:Double?
    @Published var limite:Float?
    
    init(){
        nombre = ""
        edad = 0
        fechaDeNac = ""
        sexo = ""
        peso = 0
        altura = 0
        limite = 0
    }
    
    
    init(nombre:String, edad:Int, fechaDeNac:String, sexo:String, peso:Double, altura:Double, limite:Float) {
        self.nombre = nombre
        self.edad = edad
        self.fechaDeNac = fechaDeNac
        self.sexo = sexo
        self.peso = peso
        self.altura = altura
        self.limite = limite
    }
//    func transitionToHome() {
//
//        let PerfilViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.PerfilViewController) as? PerfilViewController
//
//        view.window?.rootViewController = PerfilViewController
//        view.window?.makeKeyAndVisible()
//
//    }
}
