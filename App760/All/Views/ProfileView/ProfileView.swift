//
//  ProfileView.swift
//  App760
//
//  Created by IGOR on 03/09/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
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
                
                Text("Profile")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                if viewModel.profName.isEmpty || viewModel.profPhoto.isEmpty {
                
                HStack {
                    
                    Image(viewModel.profPhoto)
                        .resizable()
                        .frame(width: 90, height: 90)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            
                            Text(viewModel.profName)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isProfile = true
                                }
                                
                            }, label: {
                                
                                Text("Edit")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        
                        Spacer()
                        
                        Text("\(viewModel.Age) years old")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("\(viewModel.education)")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("\(viewModel.experience)")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                
                } else {
                    
                    VStack {
                        
                        Text("Information about the artist has not been added")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {}, label: {
                            
                            HStack {
                                
                                Text("Add +")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            }
                        })
                        
                    }
                    .padding(25)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                }
                
                HStack {
                    
                    VStack{
                        
                        Text("$ \(viewModel.profit)")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                        
                        Text("Profit")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding(25)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    VStack{
                        
                        Text("$ \(viewModel.expenses)")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                        
                        Text("Expenses")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding(25)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                }
                
                HStack {
                    
                    Text("List")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                 
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddList = true
                        }
                        
                    }, label: {
                        
                        Text("Add +")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(RoundedRectangle(cornerRadius: 17).fill(Color("prim")))
                    })
                }
                    .padding(.vertical)
                
                if viewModel.lists.isEmpty {
                    
                    VStack {
                        
                        Image("star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        
                        Text("You haven't added any entries")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding(25)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.lists, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index.prName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("$\(index.prCost ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .regular))
                                    }
                                    
                                    Rectangle()
                                        .fill(.gray.opacity(0.3))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    }
                }

            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddList ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddList = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddList = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Add a new entry")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                        .padding()
                    
                    Text("This will help you keep track of expenses")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.prName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.prName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Cost")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.prCost.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.prCost)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    .padding(1)
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.prName = ""
                            viewModel.prCost = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddList = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.expenses += Int(viewModel.prCost) ?? 0
                            
                            viewModel.addList()
                            
                            viewModel.prName = ""
                            viewModel.prCost = ""
                            
                            viewModel.fetchLists()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddList = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bgq")))
                .padding()
                .offset(y: viewModel.isAddList ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchLists()
        }
    }
}

#Preview {
    ProfileView()
}
