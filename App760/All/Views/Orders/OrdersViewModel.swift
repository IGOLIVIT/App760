//
//  OrdersViewModel.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI
import SwiftUI
import CoreData

final class OrdersViewModel: ObservableObject {
    
    @Published var statuses: [String] = ["In process", "Completed", "Sent"]
    @Published var currFilStatus = "In process"
    @Published var currForAddStatus = "In process"
    
    @AppStorage("profit") var profit: Int = 0
    @AppStorage("expenses") var expenses: Int = 0
    
    @AppStorage("av") var av: Int = 0
    @AppStorage("sol") var sol: Int = 0
    @AppStorage("ord") var ord: Int = 0

    @Published var photos: [String] = ["m1", "m2"]
    @Published var currAdPhoto = ""
    @Published var currAdPhoto2 = ""
    @Published var currAdPhoto3 = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var orName: String = ""
    @Published var orSize: String = ""
    @Published var orDeadline: String = ""
    @Published var orDescr: String = ""
    @Published var orPhoto: String = ""
    @Published var orPrice: String = ""
    @Published var orTechnic: String = ""
    @Published var orStatus: String = ""

    
    @Published var orders: [OrderModel] = []
    @Published var selectedOrder: OrderModel?
    
    func addOrder() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "OrderModel", into: context) as! OrderModel

        loan.orName = orName
        loan.orSize = orSize
        loan.orDeadline = orDeadline
        loan.orDescr = orDescr
        loan.orPhoto = orPhoto
        loan.orPrice = orPrice
        loan.orTechnic = orTechnic
        loan.orStatus = orStatus

        CoreDataStack.shared.saveContext()
    }

    func fetchOrders() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<OrderModel>(entityName: "OrderModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.orders = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.orders = []
        }
    }
}
