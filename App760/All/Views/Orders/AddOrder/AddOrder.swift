//
//  AddOrder.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI

struct AddOrder: View {

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
                    
                    Button(action: {
                        
                        viewModel.orPhoto = viewModel.currAdPhoto
                        viewModel.orStatus = viewModel.currForAddStatus
                        
                        viewModel.addOrder()
                        
                        viewModel.currAdPhoto = ""
                        viewModel.currForAddStatus = ""
                        viewModel.orName = ""
                        viewModel.orDescr = ""
                        viewModel.orPrice = ""
                        viewModel.orSize = ""
                        viewModel.orTechnic = ""
                        viewModel.orDeadline = ""
                        
                        viewModel.fetchOrders()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .opacity(viewModel.orName.isEmpty || viewModel.orDescr.isEmpty || viewModel.orPrice.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.orName.isEmpty || viewModel.orDescr.isEmpty || viewModel.orPrice.isEmpty ? true : false)
                    
                }
                .padding(.vertical)
                
                HStack {
                        
                    ForEach(viewModel.statuses, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currForAddStatus = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .padding(2)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.gray.opacity(viewModel.currForAddStatus == index ? 0.5 : 0)))
                        })
                    }
                }
                .padding(2)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 4).fill(.gray.opacity(0.2)))
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {

                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currAdPhoto = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currAdPhoto.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(width: 100, height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currAdPhoto)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(25)
                                        .padding(1)
                                }
                                
                            })
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 9) {
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orName)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            .padding(1)
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Text("Description")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.orDescr.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.orDescr)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                .padding(1)
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Price")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.orPrice.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.orPrice)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                    .padding(1)
                                }
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Size")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.orSize.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.orSize)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                    .padding(1)
                                }
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Technic")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.orTechnic.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.orTechnic)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                    .padding(1)
                                }
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Date of creation")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.orDeadline.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.orDeadline)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                    .padding(1)
                                }
                                
                            }
                            .padding(.bottom)
                            
                        }
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    AddOrder(viewModel: OrdersViewModel())
}
