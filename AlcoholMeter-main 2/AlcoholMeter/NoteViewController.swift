//
//  NoteViewController.swift
//  AlcoholMeter
//
//  Created by Natalia De Biasio on 16/11/2021.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class NoteViewController: UIViewController {
    
    let userDefaults=UserDefaults()
    private var models=[AlcoholMeter]()
    var selectedNote: AlcoholMeter? = nil
    
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func deleteItem(item:AlcoholMeter){
        context.delete(item)
        do{
            try context.save()

        }
        catch{

        }

    }

    
    @IBOutlet weak var fechamedicion: UILabel!
    @IBOutlet weak var valorbrac: UILabel!
    @IBOutlet weak var valorbac: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var memoria: UILabel!
    
    @IBAction func borrar(_ sender: Any) {
        deleteItem(item:selectedNote ?? selectedNote!)
        let iv = storyboard?.instantiateViewController(identifier: "historialView") as! HistorialViewController
        present(iv, animated: true)
      
    }
    
   
    
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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
                if(selectedNote != nil)
                {
                    valorbac.text = selectedNote?.bac
                    valorbrac.text = selectedNote?.brac
                    des.text=selectedNote?.des
                    memoria.text = selectedNote?.memoria
                    let date=selectedNote?.fecha
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "YY/MM/dd, HH:mm:ss"
                    fechamedicion.text=dateFormatter.string(from:date ?? Date())
                                    }
        
//        let vbrac = userDefaults.String(forKey: "indice")
        
    }
}




