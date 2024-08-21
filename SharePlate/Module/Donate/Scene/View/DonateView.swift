//
//  ProductView.swift
//  SharePlate
//
//  Created by robert theo on 20/08/24.
//

import SwiftUI

struct ProductItemView: View {
    var product: DonatesModel
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("\(product.quantity)x")
                }
            }.padding(.bottom)
            VStack {
                HStack {
                    Text(product.isHalal ? "Halal" : "Non-Halal")
                        .font(.footnote)
                        .frame(width: 67, height: 16)
                        .background(product.isHalal ? Color.green : Color.red)
                        .cornerRadius(20)
                    Spacer()
                }
            }
        }.padding(.top)
    }
}

struct DonateView: View {
    @StateObject var viewModel = ProductViewModel()
    @StateObject var vmDonate = DonatesViewModel()

    var numbers = 1...10
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Details")) {
                        ForEach(viewModel.products) { product in
                            ProductItemView(product: product)
                                .onAppear() {
                                print(viewModel.products)
                            }
                        }
                        .onDelete(perform: viewModel.removeProduct)
                    }
                    .headerProminence(.increased)

                    
                    Section() {
                        Text("Name")
                        TextField("Example: Chitato", text: $viewModel.newProductName)
                            .frame(height: 28)
                            .background(.thickMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 5))

                        
                        Picker("Quantity", selection: $viewModel.newProductQuantity) {
                            ForEach(numbers, id: \.self) {
                                    Text("\($0)")
                            }
                        }

                                
                        Picker("", selection: $viewModel.newProductIsHalal) {
                            Text("Halal").tag(true)
                            Text("Non-Halal").tag(false)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Button(action: {
                            viewModel.addProduct()
                        }) {
                            HStack {
                                Spacer()
                                Image(systemName: "plus.circle.fill")
                                Text("Add New Item")
                                Spacer()
                            }
                        }
                        
                        
                    }
                    .listRowSeparator(.hidden)
                    
                    Section() {
                        Text("Notes")
                        TextField("Example: Chitato", text: $viewModel.newProductName)
                            .frame(height: 33)
                            .background(.thickMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    .listRowSeparator(.hidden)

                }
                
                Spacer()
                
                Button(action: {
                    // Action for the Next button
                    vmDonate.addItem(donatesModel: viewModel.products)
                }) {
                    Text("Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationBarTitle("Product", displayMode: .inline)
    }
}

struct DonateViewPreview: PreviewProvider {
    static var previews: some View {
        DonateView()
    }
}
