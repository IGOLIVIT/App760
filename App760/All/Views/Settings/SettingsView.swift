//
//  SettingsView.swift
//  App760
//
//  Created by IGOR on 20/08/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()

            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Button(action: {
                                
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack {
                                
                                Image("star")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40)
                                
                                Text("Rate Us")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        })
                        
                        Button(action: {
                                
                            guard let url = URL(string: "https://www.termsfeed.com/live/84265962-970f-4649-b244-5c069e12146b") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack {
                                
                                Image("hz")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40)
                                
                                Text("Rate Us")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        })
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
