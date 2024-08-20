//
//  PaintingsView.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI

struct PaintingsView: View {
    
    @StateObject var viewModel = PaintingsViewModel()
    
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
                
                Text("My paintings")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
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
                
                HStack {
                    
                    Text("\(viewModel.av)")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    
                    Text("\(viewModel.sol)")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    
                    Text("\(viewModel.ord)")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                }
                .padding(.bottom, 8)
                
                HStack {
                    
                    Text("List")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
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
                        .padding(5)
                        .padding(.horizontal, 5)
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim")))
                    })
                }
                
                if viewModel.paintings.isEmpty {
                    
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
                            
                            ForEach(viewModel.paintings.filter{($0.pStatus ?? "") == viewModel.currFilStatus}, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedPaint = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        
                                        HStack {
                                            
                                            Text(index.pName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "arrow.up.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 17, weight: .medium))
                                                .padding(8)
                                                .background(Circle().fill(Color("prim")))

                                        }
     
                                        HStack {
                                            
                                            Image(index.pPhoto1 ?? "")
                                                .resizable()
                                                .frame(width: 190, height: 190)
                                                .cornerRadius(15)
                                            
                                            VStack {
                                                
                                                Image(index.pPhoto2 ?? "")
                                                    .resizable()
                                                    .frame(height: 90)
                                                    .frame(maxWidth: .infinity)
                                                    .cornerRadius(15)
                                                
                                                Image(index.pPhoto3 ?? "")
                                                    .resizable()
                                                    .frame(height: 90)
                                                    .frame(maxWidth: .infinity)
                                                    .cornerRadius(15)
                                            }
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 220)
                                        
                                        HStack {
                                            
                                            Text(index.pDescr ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .medium))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Text("\(index.pPrice ?? "") $")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                                .padding(4)
                                                .padding(.horizontal, 4)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                    .padding(4)
                                })
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPaintings()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPaint(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PaiintDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    PaintingsView()
}
