//
//  IngresarViewController.swift
//  AlcoholMeter
//
//  Created by Natalia De Biasio on 16/11/2021.
//

import Foundation
import UIKit
import SwiftUI

class IngresarViewController: UIViewController {
    let userDefaults=UserDefaults()
    
    
    @IBOutlet weak var guardarbrac: UITextField!
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var calcularViewController=segue.destination as! CalcularViewController
//        calcularViewController.brAc=Int(guardarbrac.text)
//    }
    
    
    @IBAction func Calcular(_ sender: Any) {
        if guardarbrac.text=="Ingrese la medición BrAC"{
            userDefaults.set("0",forKey:"brac")
        }
        else{
        userDefaults.set(guardarbrac.text,forKey:"brac")
        }
        let epv = storyboard?.instantiateViewController(identifier: "calcularView") as! CalcularViewController
        present(epv, animated: true)
    }
   
    
}
