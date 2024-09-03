//
//  AddPaint.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI

struct AddPaint: View {
    
    @StateObject var viewModel: PaintingsViewModel
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
                        
                        viewModel.pStatus = viewModel.currForAddStatus
                        
                        viewModel.pPhoto1 = viewModel.currAdPhoto
                        viewModel.pPhoto2 = viewModel.currAdPhoto2
                        viewModel.pPhoto3 = viewModel.currAdPhoto3
                        
                        if viewModel.currForAddStatus == "Available" {
                            
                            viewModel.av += 1
                            
                        } else if viewModel.currForAddStatus == "Sold" {
                            
                            viewModel.sol += 1
                            viewModel.profit += Int(viewModel.pPrice) ?? 0
                            
                        } else if viewModel.currForAddStatus == "To order" {
                            
                            viewModel.ord += 1
                            
                        }
                        
                        viewModel.addPaint()
                        
                        viewModel.currAdPhoto = ""
                        viewModel.currAdPhoto2 = ""
                        viewModel.currAdPhoto3 = ""
                        viewModel.pName = ""
                        viewModel.pPrice = ""
                        viewModel.pDescr = ""
                        viewModel.pSize = ""
                        viewModel.pTechnic = ""
                        viewModel.pDate = ""
                        viewModel.currForAddStatus = ""
                        
                        viewModel.fetchPaintings()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .opacity(viewModel.pName.isEmpty || viewModel.pDescr.isEmpty || viewModel.pPrice.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.pName.isEmpty || viewModel.pDescr.isEmpty || viewModel.pPrice.isEmpty ? true : false)
                    
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
                        
                        HStack {
                            
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
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currAdPhoto)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .cornerRadius(25)
                                        .padding(1)
                                }
                                
                            })
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currAdPhoto2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currAdPhoto2.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currAdPhoto2)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .cornerRadius(25)
                                        .padding(1)
                                }
                                
                            })
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currAdPhoto3 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currAdPhoto3.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currAdPhoto3)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .cornerRadius(25)
                                        .padding(1)
                                }
                                
                            })
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 9) {
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.pName)
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
                                        .opacity(viewModel.pDescr.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.pDescr)
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
                                            .opacity(viewModel.pPrice.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.pPrice)
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
                                            .opacity(viewModel.pSize.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.pSize)
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
                                            .opacity(viewModel.pTechnic.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.pTechnic)
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
                                            .opacity(viewModel.pDate.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.pDate)
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
    AddPaint(viewModel: PaintingsViewModel())
}
