//
//  OrderDetail.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI

struct OrderDetail: View {
    
    @StateObject var viewModel: OrdersViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        }
                    })
                    
                    Spacer()

                    
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text(viewModel.selectedOrder?.orName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.selectedOrder?.orStatus ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    }
                    .padding(.vertical)
                                            
                        Image(viewModel.selectedOrder?.orPhoto ?? "")
                            .resizable()
                            .frame(width: 190, height: 190)
                            .cornerRadius(15)
                    
                    VStack {
                        
                        Text("Description")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedOrder?.orDescr ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical)
                    
                    VStack(spacing: 8) {
                        
                        Text("Specifications")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Price: \(viewModel.selectedOrder?.orPrice ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Size: \(viewModel.selectedOrder?.orSize ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Technic: \(viewModel.selectedOrder?.orTechnic ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Deadline: \(viewModel.selectedOrder?.orDeadline ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Spacer()
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .medium))
                            
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .medium))
                        }
                    })
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteOrder(withOrName: viewModel.selectedOrder?.orName ?? "", completion: {
                            
                            viewModel.fetchOrders()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    OrderDetail(viewModel: OrdersViewModel())
}
