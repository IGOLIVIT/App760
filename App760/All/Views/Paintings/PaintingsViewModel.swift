//
//  PaintingsViewModel.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI
import CoreData

final class PaintingsViewModel: ObservableObject {
    
    @Published var statuses: [String] = ["Available", "Sold", "To order"]
    @Published var currFilStatus = "Available"
    @Published var currForAddStatus = "Available"
    
    @AppStorage("profit") var profit: Int = 0
    @AppStorage("expenses") var expenses: Int = 0
    
    @AppStorage("av") var av: Int = 0
    @AppStorage("sol") var sol: Int = 0
    @AppStorage("ord") var ord: Int = 0

    @Published var photos: [String] = ["p1", "p2", "p3"]
    @Published var currAdPhoto = ""
    @Published var currAdPhoto2 = ""
    @Published var currAdPhoto3 = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var pName: String = ""
    @Published var pSize: String = ""
    @Published var pDate: String = ""
    @Published var pDescr: String = ""
    @Published var pPhoto1: String = ""
    @Published var pPhoto2: String = ""
    @Published var pPhoto3: String = ""
    @Published var pPrice: String = ""
    @Published var pTechnic: String = ""
    @Published var pStatus: String = ""

    
    @Published var paintings: [PainModel] = []
    @Published var selectedPaint: PainModel?
    
    func addPaint() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PainModel", into: context) as! PainModel

        loan.pName = pName
        loan.pSize = pSize
        loan.pDate = pDate
        loan.pDescr = pDescr
        loan.pPhoto1 = pPhoto1
        loan.pPhoto2 = pPhoto2
        loan.pPhoto3 = pPhoto3
        loan.pPrice = pPrice
        loan.pTechnic = pTechnic
        loan.pStatus = pStatus

        CoreDataStack.shared.saveContext()
    }

    func fetchPaintings() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PainModel>(entityName: "PainModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.paintings = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.paintings = []
        }
    }
}
