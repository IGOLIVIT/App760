//
//  R2.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Convenient functionality and editing")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(Rectangle().fill(.white))
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    R2()
}
