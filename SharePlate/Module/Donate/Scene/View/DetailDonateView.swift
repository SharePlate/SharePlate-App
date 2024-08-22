//
//  DetailDonateView.swift
//  SharePlate
//
//  Created by robert theo on 21/08/24.
//

import SwiftUI

//struct DetailDonateView: View {
//    @State private var address = "10th block number 2"
//    @State private var pickupTime = Date(timeIntervalSince1970: 43200) // 12:00 pm
//
//        var body: some View {
//            VStack(spacing: 20) {
//                TextField("Details address", text: $address)
//                    .padding()
//                    .background(Color(.systemGray6))
//                    .cornerRadius(10)
//
//                DatePicker(
//                    "Time Pick Up",
//                    selection: $pickupTime,
//                    displayedComponents: [.hourAndMinute]
//                )
//                .datePickerStyle(WheelDatePickerStyle())
//                .labelsHidden()
//
//                Button(action: {
//                    // Perform the food donation action
//                }) {
//                    Text("DONATE FOOD")
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.green)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//        }
//}
//
//#Preview {
//    DetailDonateView()
//}
import SwiftUI

struct DonateFoodView: View {
    @State private var address: String = ""
    @State private var selectedTime = Date()

    var body: some View {
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
//                            .frame(height: 20)
                            .padding(.leading, 11.0)
                            .font(.subheadline)
                        Spacer()
                    }
                    TextField("", text: $address)
                        .frame(width: 329, height: 33)
                        .background(.thinMaterial)
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
                            .background(.thinMaterial)
                            .labelsHidden()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.leading, 11.0)
                        Spacer()
                    }
                    
                }
            }
            .frame(width: 353, height: 182)
            .background(.gray)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            
            // Donate Food Button
            Button(action: {
                // Action for donating food
            }) {
                Text("DONATE FOOD")
                    .foregroundColor(Color("Neutral10"))
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Green70"))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .background(Color("Orange20"))
    }
}

struct DonateFoodView_Previews: PreviewProvider {
    static var previews: some View {
        DonateFoodView()
    }
}
