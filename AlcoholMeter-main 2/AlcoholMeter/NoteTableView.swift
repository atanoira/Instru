//
//  NoteTableView.swift
//  AlcoholMeter
//
//  Created by Natalia De Biasio on 16/11/2021.
//

import UIKit
import CoreData

var noteList = [AlcoholMeter]()

class NoteTableView: UITableViewController{

    
    
    
//    @IBAction func borrar(_ sender: Any) {
//    }
//    override func viewDidLoad()
//        {
//            super.viewDidLoad()
//            if(selectedNote != nil)
//            {
//                titleTF.text = selectedNote?.title
//                descTV.text = selectedNote?.desc
//            }
//        }
    
//    var noteList=[AlcoholMeter]()
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt idexPath: IndexPath)->UITableViewCell
//    {
//        let noteCell=tableView.dequeueReusableCell(withIdentifier: "noteCellId") as! NoteCell
//        
//        return noteCell
//    }
    
//    var firstLoad = true
//        
//        func nonDeletedNotes() -> [AlcoholMeter]
//        {
//            var noDeleteNoteList = [AlcoholMeter]()
//            for note in noteList
//            {
//                if(note.deletedDate == nil)
//                {
//                    noDeleteNoteList.append(note)
//                }
//            }
//            return noDeleteNoteList
//        }
//        
//        override func viewDidLoad()
//        {
//            if(firstLoad)
//            {
//                firstLoad = false
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
//                do {
//                    let results:NSArray = try context.fetch(request) as NSArray
//                    for result in results
//                    {
//                        let note = result as! AlcoholMeter
//                        noteList.append(note)
//                    }
//                }
//                catch
//                {
//                    print("Fetch Failed")
//                }
//            }
//        }
//        
//        
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//        {
//            let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCellID", for: indexPath) as! NoteCell
//            
//            let thisNote: AlcoholMeter!
//            thisNote = nonDeletedNotes()[indexPath.row]
//            
//            noteCell.titleLabel.text = thisNote.title
//            noteCell.descLabel.text = thisNote.desc
//            
//            return noteCell
//        }
//        
//        
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//        {
//            return nonDeletedNotes().count
//        }
//        
//        override func viewDidAppear(_ animated: Bool)
//        {
//            tableView.reloadData()
//        }
//        
//        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//        {
//            self.performSegue(withIdentifier: "editNote", sender: self)
//        }
//        
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//        {
//            if(segue.identifier == "editNote")
//            {
//                let indexPath = tableView.indexPathForSelectedRow!
//                
//                let noteDetail = segue.destination as? NoteDetailVC
//                
//                let selectedNote : AlcoholMeter!
//                selectedNote = nonDeletedNotes()[indexPath.row]
//                noteDetail!.selectedNote = selectedNote
//                
//                tableView.deselectRow(at: indexPath, animated: true)
//            }
//        }
    
}
