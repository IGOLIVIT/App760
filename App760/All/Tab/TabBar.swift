//
//  TabBar.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray.opacity(0.4))
                            .frame(width: 15, height: 15)
//
//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray.opacity(0.4))
//                            .font(.system(size: 8, weight: .regular))
//
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 24)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg2")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Paintings = "Paintings"
    
    case Orders = "Orders"
                
    case Settings = "Settings"
    
}
