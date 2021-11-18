//
//  CalcularViewController.swift
//  AlcoholMeter
//
//  Created by Natalia De Biasio on 16/11/2021.
//

import Foundation
import UIKit
import SwiftUI

class CalcularViewController: UIViewController {
    
    let userDefaults=UserDefaults()
   
    
    @IBOutlet weak var bac: UILabel!
    
    @IBOutlet weak var brac: UILabel!
    @IBOutlet weak var des: UILabel!
    
    @State var valorbac = 40
    @State var vbrac = 0
    @State var valorbrac = 0
    @State var valordes = 0
    
    
    
  func calculo(valorbrac:Float)->(Float,Float)
    {
        let vbac=(valorbrac*0.01)/0.05
        let tiempo=vbac/0.0025
        return(vbac,tiempo/60)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value=userDefaults.value(forKey: "brac") as? String{
            brac.text = value}
        let vbrac = userDefaults.string(forKey: "brac") ?? "0"
//        as? [String]
//        ?? [String]()
        print(vbrac)
        let intvbrac=Float(vbrac) ?? 0
        let valor=calculo(valorbrac:intvbrac)
        bac.text=String(valor.0)
        userDefaults.set(bac.text,forKey:"bac")
        des.text=String(valor.1)
        userDefaults.set(des.text,forKey:"des")
        
        
        
//        brac.text=userDefaults.string(forKey: "brAc")
//        brac.text=String(valorbac)
//        bac.text=String(valorbac)
    }
    
    @IBAction func Seguir(_ sender: Any) {
        let epv = storyboard?.instantiateViewController(identifier: "juegounoView") as! JuegoUnoViewController
        present(epv, animated: true)
    }
}
