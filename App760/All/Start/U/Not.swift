//
//  Not.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 29, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Spacer()
                
                VStack(spacing: 39) {

                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Enable notifications")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
