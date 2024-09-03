//
//  ProfileViewModel.swift
//  App760
//
//  Created by IGOR on 03/09/2024.
//

import SwiftUI
import CoreData

final class ProfileViewModel: ObservableObject {
    
    @Published var types: [String] = ["Expenses", "Profit"]
    @Published var curType: String = ""

    @Published var ProfPhotos: [String] = ["girl", "p1", "p2", "p3"]
    
    @AppStorage("profit") var profit: Int = 0
    @AppStorage("expenses") var expenses: Int = 0

    @AppStorage("profPhoto") var profPhoto: String = ""
    @AppStorage("profName") var profName: String = ""
    @AppStorage("Age") var Age: String = ""
    @AppStorage("experience") var experience: String = ""
    @AppStorage("education") var education: String = ""

    @Published var currentProfPhoto = ""
    @Published var addName = ""
    @Published var addAge = ""
    @Published var addExp = ""
    @Published var addEduc = ""
    
    @Published var isProfile: Bool = false
    @Published var isAddList: Bool = false


    @Published var prName: String = ""
    @Published var prCost: String = ""
    
    @Published var lists: [ProfModel] = []
    @Published var selectedList: ProfModel?
    
    func addList() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ProfModel", into: context) as! ProfModel

        loan.prName = prName
        loan.prCost = prCost

        CoreDataStack.shared.saveContext()
    }

    func fetchLists() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProfModel>(entityName: "ProfModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.lists = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.lists = []
        }
    }

}
