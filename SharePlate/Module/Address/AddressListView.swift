//
//  AddressListView.swift
//  SharePlate_Test313
//
//  Created by Ali Haidar on 8/20/24.
//

import SwiftUI

struct AddressListView: View {
    
    @State private var goToMap: Bool = false
    @State private var selectedAddress: Int? = nil
    
    var body: some View {
        VStack {
            List {
                ForEach(1..<5, id: \.self) { item in
                    AddressListCell(isSelected: Binding<Bool>(
                        get: { self.selectedAddress == item },
                        set: { newValue in
                            if newValue {
                                self.selectedAddress = item
                            } else {
                                self.selectedAddress = nil
                            }
                        })
                    )
                    .onTapGesture {
                        goToMap.toggle()
                    }
                    .listRowBackground(Color.clear)
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)
            
            Spacer()
            
            Button {
                goToMap = true
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "plus.circle").foregroundStyle(.orange)
                    Text("Add New Address").foregroundStyle(.black)
                    Spacer()
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(.horizontal)
        .background(.thinMaterial)
        .navigationTitle("Address")
        .navigationDestination(isPresented: $goToMap) {
            AddAddresView()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            // Handle deletion logic here
        }
    }
}

#Preview {
    AddressListView()
}

struct AddressListCell: View {
    @Binding var isSelected: Bool

    var body: some View {
        VStack(spacing: 10) {
            HStack{
                
                    Toggle(isOn: $isSelected) {
                                    EmptyView()
                                }
                    .toggleStyle(RadioButtonStyle())
                                .labelsHidden()
                VStack(alignment: .leading){
                    Text(UserDefaults.standard.string(forKey: "AddressAddress") ?? "").bold()
                    Text("Address detail").font(.footnote)
                }
                
                Spacer()
            }
            
        }
    }
}


