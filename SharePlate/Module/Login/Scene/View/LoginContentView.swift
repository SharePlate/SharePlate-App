//
//  ContentView.swift
//  SharePlate
//
//  Created by Muhammad Yusuf on 21/08/24.
//

import SwiftUI
import UIKit

struct LoginContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                LogginginView()
                    } label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("Orange30"))
                            .frame(width: 353, height: 44)
                            .overlay {
                                Text("DONATE FOOD")
                                    .font(.system(size: 17).bold())
                                    .foregroundColor(.black)
                            }
                    }
                    .padding(.bottom, 20)
        }
    }
}

struct SignInUIView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return SignInView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
