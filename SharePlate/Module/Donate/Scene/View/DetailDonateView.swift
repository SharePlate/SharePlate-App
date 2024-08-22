//
//  DetailDonateView.swift
//  SharePlate
//
//  Created by robert theo on 21/08/24.
//

import SwiftUI

struct DetailDonateView: View {
    
    @State private var address: String = ""
    @State private var selectedTime = Date()
    @State var gotoSuccess: Bool = false

    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                // Character illustration
                Image("Detail-donate") // Replace with your actual image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 340)
                
                Spacer()
                
                VStack {
                    VStack {
                        HStack {
                            Text("Detail Address")
                                .padding(.leading, 11.0)
                                .font(.subheadline)
                            Spacer()
                        }
                        TextField("", text: $address)
                            .frame(width: 329, height: 33)
                            .background(Color("Neutral0"))
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 8)
                    
                    
                    VStack {
                        HStack {
                            Text("Time Pick Up")
                            .padding(.leading, 11.0)
                            .font(.subheadline)
                            Spacer()
                        }
                        HStack {
                            DatePicker("Time Pick Up", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                .background(Color("Neutral0"))
                                .background(.white)
                                .labelsHidden()
                                .cornerRadius(10)
                                .padding(.leading, 11.0)
                            
                            Spacer()
                        }
                        
                    }
                }
                .frame(width: 353, height: 182)
                .background(Color("Green10"))
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                
                // Donate Food Button
                VStack {
                    Button(action: {
                        // Action for donating food
                        gotoSuccess = true
                    }) {
                        Text("DONATE FOOD")
                            .foregroundColor(Color("Neutral10"))
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("Green80"))
                            .cornerRadius(10)
                    }
                    .frame(width: 353)
                    .navigationDestination(isPresented: $gotoSuccess){
                        SuccessView()
                    }
                }.frame(width: 500)
                Spacer()
            }.background(Color("Green50"))
        }
    }
}

struct DetailDonateView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDonateView()
    }
}
