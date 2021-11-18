//
//  HistorialViewController.swift
//  AlcoholMeter
//
//  Created by Lorenza Vecino on 27/10/2021.
//

import UIKit
import CoreData

class HistorialViewController:UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    var selectedNote: AlcoholMeter? = nil
    let userDefaults=UserDefaults()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd, HH:mm:ss"
        let date=model.fecha
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text=dateFormatter.string(from:date ?? Date())
        
        return cell
    }
//    func tableView(_tableView:UITableView,didSelectRowAt indexPath: IndexPath){
////        tableView.deselectRow(at: indexPath, animated: true)
////        let item=models[indexPath.row]
////        print(item)
////        print(indexPath.row)
////        userDefaults.set(item,forKey:"item")
////        userDefaults.set(indexPath.row,forKey:"indice")
//        self.performSegue(withIdentifier: "mostrar", sender: self)
//
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier=="mostrar")
//        {
//            let indexPath = tableView.indexPathForSelectedRow!
//            let noteDetail = segue.destination as? NoteViewController
//            let selectedNote : AlcoholMeter!
//            selectedNote = models[indexPath.row]
//            noteDetail!.selectedNote = selectedNote
//            tableView.deselectRow(at: indexPath, animated: true)
//
//        }
//    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            self.performSegue(withIdentifier: "mostrar", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if(segue.identifier == "mostrar")
            {
                let indexPath = tableView.indexPathForSelectedRow!
                
                let noteDetail = segue.destination as? NoteViewController
                let selectedNote : AlcoholMeter!
                selectedNote = models[indexPath.row]
                noteDetail!.selectedNote = selectedNote
                
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    
    private var models=[AlcoholMeter]()
    
//
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            // Do any additional setup after loading the view, typically from a nib.
//        }
//
//        override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//            // Dispose of any resources that can be recreated.
//        }
//
//        func tableView(tableView:UITableView!, numberOfRowsInSection section:Int) -> Int
//        {
//            return 20
//        }
//
//        func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
//        {
//            let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
//            cell.textLabel.text="row#\(indexPath.row)"
//            cell.detailTextLabel.text="subtitle#\(indexPath.row)"
//
//            return cell
//        }
//
//    @IBOutlet weak var tableView: UITableView!
    
//    func setupTableView() {
//            tableview.delegate = self
//            tableview.dataSource = self
//        }
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return 0 // your number of cells here
//        }
//
//        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//            // your cell coding
//            return UITableViewCell()
//        }
//
//        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//            // cell selected code here
//        }
//
//    let tableView:UITableView={
//        let table=UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
    
    
    
    

    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func getAllItems(){
        do{
            models=try context.fetch(AlcoholMeter.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            //error
        }
    }

//    func createItem(bac:String,brac:String){
//        let newItem=AlcoholMeter(context: context)
//        newItem.bac=bac
//        newItem.brac=brac
//        newItem.fecha=Date()
//        do{
//            try context.save()
//
//        }
//        catch{
//
//        }
//    }

    func deleteItem(item:AlcoholMeter){
        context.delete(item)
        do{
            try context.save()

        }
        catch{

        }

    }

//
//    @IBOutlet weak var Medicion: UILabel!
//
//
    @IBAction func botonInicio(_ sender: Any) {
        let iv = storyboard?.instantiateViewController(identifier: "inicioView") as! InicioViewController
        present(iv, animated: true)
    }
    
    @IBAction func botonNuevoEstudio(_ sender: Any) {
        let nev = storyboard?.instantiateViewController(identifier: "nuevoEstudioView") as! NuevoEstudioViewController
        present(nev, animated: true)
    }
    
    @IBAction func botonHistorial(_ sender: Any) {
    }
    
    @IBAction func botonPerfil(_ sender: Any) {
        let pv = storyboard?.instantiateViewController(identifier: "perfilView") as! PerfilViewController
        present(pv, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        getAllItems()
        tableView.delegate=self
        tableView.dataSource=self
        tableView.frame=view.bounds
        

        // Do any additional setup after loading the view.
    }
    

 

}

//extension HistorialViewController:UITableViewDelegate{
//    tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath){
//    print("hoal")
//    }
//}
//extension HistorialViewController:UITableViewDataSource{
//
//
//}
