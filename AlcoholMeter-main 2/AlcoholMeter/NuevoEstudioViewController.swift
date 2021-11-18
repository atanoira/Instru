//
//  NuevoEstudioViewController.swift
//  AlcoholMeter
//
//  Created by Lorenza Vecino on 28/10/2021.
//

import UIKit

class NuevoEstudioViewController: UIViewController {
    let userDefaults=UserDefaults()
    
   
    @IBOutlet weak var ultimabebida: UITextField!
    
    let comidas = ["Si", "No"]
    @IBOutlet weak var comida: UISegmentedControl!
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userDefaults.setValue(comidas[row], forKey:"comida")
        print(comidas[row])
    }
    
    @IBAction func botonInicio(_ sender: Any) {
        let iv = storyboard?.instantiateViewController(identifier: "inicioView") as! InicioViewController
        present(iv, animated: true)
    }
    
    @IBAction func botonNuevoEstudio(_ sender: Any) {
    }
    
    @IBAction func botonHistorial(_ sender: Any) {
        let hv = storyboard?.instantiateViewController(identifier: "historialView") as! HistorialViewController
        present(hv, animated: true)
    }
    
    @IBAction func botonPerfil(_ sender: Any) {
        let pv = storyboard?.instantiateViewController(identifier: "perfilView") as! PerfilViewController
        present(pv, animated: true)
    }
    
    @IBAction func botonIniciarMedicion(_ sender: Any) {
        
        userDefaults.setValue(ultimabebida.text, forKey:"tiempobebida")
        userDefaults.set(Date(),forKey:"fechamedicion")

        
        
        let ev = storyboard?.instantiateViewController(identifier: "espereView") as! EspereViewController
        present(ev, animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func memoria(_ sender: Any) {
        userDefaults.setValue(ultimabebida.text, forKey:"tiempobebida")
        userDefaults.set("0",forKey:"bac")
        userDefaults.set("0",forKey:"des")
        userDefaults.set("0",forKey:"brac")
        userDefaults.set(Date(),forKey:"fechamedicion")

        let ev = storyboard?.instantiateViewController(identifier: "juegounoView") as! JuegoUnoViewController
        present(ev, animated: true)
       
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
