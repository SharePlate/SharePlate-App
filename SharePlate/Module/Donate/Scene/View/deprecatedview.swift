////
////  DonateView.swift
////  SharePlate
////
////  Created by robert theo on 19/08/24.
////
//
//import SwiftUI
//
//struct babi: View {
//    @State private var timePickup = defaultTimePickup
//    @State private var quantity = ""
//    @State private var notes = ""
//    
//    @State private var model = DonatesModel(
//        address: "Jl. Delima 1 No 3, Kec Serpong Selatan, Kota Tangerang Selatan, Banten 12047",
////        imageURL: nil,
//        isHalal: true,
//        quantity: 0,
//        timePickUp: Date(),
//        note: ""
//    )
////    @Binding var donate : DonatesModel
//
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
////                    addressSection
//                    halalToggle
//                    nameSection
//                    quantitySection
//                    notesSection
//                    timePickupSection
//                    pickupButton
//                }
//                .padding()
//            }
//            .navigationTitle("Details Donation")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(leading: BackButton())
//        }
//    }
//    
//    var addressSection: some View {
//        VStack(alignment: .leading) {
//            Text("Address")
//                .font(.headline)
//            Text(model?.address ?? "")
//                .font(.subheadline)
//        }
//    }
//    
//    var halalToggle: some View {
//        Picker("", selection: Binding(
//            get: { model?.isHalal ?? true },
//            set: { model = DonatesModel(name: <#String#>, address: model?.address ?? "", isHalal: $0, quantity: model?.quantity, timePickUp: model?.timePickUp, note: model?.note ?? "") ?? model }
//        )) {
//            Text("Halal").tag(true)
//            Text("Non - Halal").tag(false)
//        }
//        .pickerStyle(SegmentedPickerStyle())
//        .onAppear() {
//            print(model)
//        }
//
//    }
//    
//    var nameSection: some View {
//        VStack(alignment: .leading) {
//            Text("Name")
//                .font(.headline)
//            TextField("amount of food and drink", text: $quantity)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.alphabet)
//        }
//    }
//    
//    var quantitySection: some View {
//        VStack(alignment: .leading) {
//            Text("Quantity")
//                .font(.headline)
//            TextField("amount of food and drink", text: $quantity)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.numberPad)
//        }
//    }
//    
//    var notesSection: some View {
//        VStack(alignment: .leading) {
//            Text("Notes")
//                .font(.headline)
//            TextField("Example: if you need plastic bag", text: $notes)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//        }
//    }
//    
//    var timePickupSection: some View {
//        VStack(alignment: .leading) {
//            Text("Time pick up")
//                .font(.headline)
//            DatePicker("Please enter a time", selection: $timePickup, in: defaultTimePickup...endDate /*displayedComponents: .hourAndMinute*/)
//                .labelsHidden()
//            
//        }
//    }
//    
//    var pickupButton: some View {
//        Button(action: {
//            // Handle pickup action
//        }) {
//            Text("Pick up donation")
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(8)
//        }
//    }
//}
//
//struct BackButton: View {
//    var body: some View {
//        Button(action: {
//            // Handle back action
//        }) {
//            HStack {
//                Image(systemName: "chevron.left")
//                Text("Back")
//            }
//        }
//    }
//}
//
//#Preview {
//    DonateView()
//}
