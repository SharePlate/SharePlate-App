//
//  TestView.swift
//  SharePlate
//
//  Created by robert theo on 20/08/24.
//

import SwiftUI

struct ProductView: View {
    @State private var productName = "Koko Krunch"
    @State private var quantity = "3x"
    @State private var isHalal = true
    @State private var newItemName = ""
    @State private var newItemQuantity = ""
    @State private var notes = ""
    @State private var items: [(name: String, quantity: String)] = []

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    detailsSection
                    newItemSection
                    addNewItemButton
                    notesSection
                    nextButton
                }
                .padding()
            }
            .navigationTitle("Product")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: backButton, trailing: infoButton)
        }
    }

    var detailsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Details")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Text("\(productName)  \(quantity)")
                Spacer()
                Text("Halal")
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.2))
                    .foregroundColor(.blue)
                    .cornerRadius(4)
                Button(action: {
                    // Delete action
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(8)
                }
            }
        }
    }

    var newItemSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("Example: Chitato", text: $newItemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                TextField("02", text: $newItemQuantity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 60)
                
                Picker("", selection: $isHalal) {
                    Text("Halal").tag(true)
                    Text("Non-Halal").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
    }

    var addNewItemButton: some View {
        Button(action: {
            items.append((name: newItemName, quantity: newItemQuantity))
            newItemName = ""
            newItemQuantity = ""
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.orange)
                Text("Add New Item")
                    .foregroundColor(.orange)
            }
        }
    }

    var notesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Notes")
                .font(.headline)
            TextField("Example: if you need plastic bag", text: $notes)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }

    var nextButton: some View {
        Button(action: {
            // Next action
        }) {
            Text("Next")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }

    var backButton: some View {
        Button(action: {
            // Back action
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        }
    }

    var infoButton: some View {
        Button(action: {
            // Info action
        }) {
            Image(systemName: "info.circle")
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
