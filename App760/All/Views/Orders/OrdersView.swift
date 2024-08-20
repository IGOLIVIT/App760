//
//  OrdersView.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI

struct OrdersView: View {

    @StateObject var viewModel = OrdersViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("bgi")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Orders")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                HStack {
                    
                    Image("hz")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                    
                    Text("All your masterpieces are in one place. Don't lose any.")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("+")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim")))
                })
                
                HStack {
                    
                    ForEach(viewModel.statuses, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currFilStatus = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .padding(2)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.gray.opacity(viewModel.currFilStatus == index ? 0.5 : 0)))
                        })
                    }
                }
                .padding(2)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 4).fill(.gray.opacity(0.2)))
                .padding(.top)

                HStack {
                    
                    Text("Customers")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                
                if viewModel.orders.isEmpty {
                    
                    VStack(spacing: 16) {
                        
                        Image("star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90)
                        
                        Text("You haven't added any entries")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {

                        LazyVStack {
                            
                            ForEach(viewModel.orders.filter{($0.orStatus ?? "") == viewModel.currFilStatus}, id: \.self) { index in
                            
                                HStack {
                                    
                                    Image(index.orPhoto ?? "")
                                        .resizable()
                                        .frame(width: 80, height: 120)
                                        .cornerRadius(20)
                                        .padding(.trailing)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(index.orName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                            .padding(.bottom, 6)
                                        
                                        Text(index.orDescr ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(.bottom, 8)
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedOrder = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("Details")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .medium))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 20)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                        })
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 140)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        }
                        
                    }
                    
                }
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchOrders()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddOrder(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            OrderDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    OrdersView()
}
