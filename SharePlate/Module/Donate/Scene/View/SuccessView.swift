//
//  SuccessView.swift
//  SharePlate
//
//  Created by robert theo on 21/08/24.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack {
            Image("complete") // Replace with your actual image name
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 560)
            
            Spacer()
            VStack {
                VStack {
                    Text("Success Donation!")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.top, 15)
                
                VStack {
                    Text("You've earned coins!\nkeep making an impact!").fixedSize(horizontal: false, vertical: true)
                        .font(.headline)
                }.padding(.top, 15)
                
                VStack {
                    Button(action: {
                    // TODO
                    }) {
                        Text("Back to home")
                            .foregroundColor(Color("Neutral10"))
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("Green70"))
                            .cornerRadius(10)
                    }
                    .frame(height: 292)
                    .padding(.horizontal, 20)
                }
            }.background(.white)
            Spacer()
        }
        .ignoresSafeArea()
        .background(Color("Green50"))
    
    }
}

#Preview {
    SuccessView()
}
