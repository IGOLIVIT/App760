//
//  AddProfile.swift
//  App760
//
//  Created by IGOR on 03/09/2024.
//

import SwiftUI

struct AddProfile: View {

    @StateObject var viewModel: ProfileViewModel
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

                        viewModel.profPhoto = viewModel.currentProfPhoto
                        viewModel.profName = viewModel.addName
                        viewModel.Age = viewModel.addAge
                        viewModel.experience = viewModel.addExp
                        viewModel.education = viewModel.addEduc
                                                
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .regular))
                        
                    })

                }
                .padding(.vertical)

                ScrollView(.vertical, showsIndicators: false) {
                    
                        VStack(spacing: 9) {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.ProfPhotos, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentProfPhoto = index
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text(index)
                                            
                                            Spacer()
                                            
                                            Image(index)
                                        }
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentProfPhoto.isEmpty {
                                    
                                    VStack(spacing: 15) {
                                        
                                        Image(systemName: "photo")
                                            .foregroundColor(Color.gray)
                                            .font(.system(size: 32, weight: .regular))
               
                                     
                                        Text("Add image")
                                            .foregroundColor(Color.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    .frame(width: 120, height: 120)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                                    
                                } else {
                                    
                                    Image(viewModel.currentProfPhoto)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(15)

                                }
                                
                            })
                            .padding(.bottom)
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.addName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.addName)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            .padding(1)
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Age")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.addAge.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.addAge)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                    .padding(1)
                                }
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Experience")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.addExp.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.addExp)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                    .padding(1)
                                }
                                
                            }
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Education")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.addEduc.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.addEduc)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                    .padding(1)
                                }

                        }
                    }
            }
            .padding()
        }
    }
}

#Preview {
    AddProfile(viewModel: ProfileViewModel())
}
