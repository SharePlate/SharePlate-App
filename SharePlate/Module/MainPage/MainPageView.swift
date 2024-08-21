import SwiftUI

struct MainPageView: View {
    @State private var name: String = "Ages"
    @State private var isLoggedIn: Bool = true
    @State private var goToProfile: Bool = false
    
    
    var body: some View {
        
        ZStack{
            VStack {
                ZStack(alignment: .top){
                    Image("TopBar-design1")
                    Image("TopBar-design2")
                    Image("TopBar-design3")
                }
                .ignoresSafeArea(.all)
                Spacer()
            }
            
            VStack{
                VStack (alignment: .leading){
                    HStack {
                        Spacer()
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 20, height: 23)
                            //.padding(.top, 20)
                    }
                    HStack {
                        Circle()
                            .frame(width: 54, height: 54)
                            .onTapGesture {
                                goToProfile.toggle()
                            }
                        
                        VStack (alignment: .leading, spacing: 2){
                            Text("Hello ") .font(.system(size: 17))
                            +
                            Text(isLoggedIn ? "Ages" : "Guest")
                                .font(.system(size: 20))
                                .bold()
                            
                            ZStack{
                                Text("Complete your profile to play a role in changing Indonesia")
                                    .font(.system(size: 9))
                                    .foregroundStyle(Color("Purple30"))
                                    .padding(4)
                            }
                            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.95, green: 0.87, blue: 0.65), location: 0.00),
                                        Gradient.Stop(color: Color(red: 0.84, green: 0.65, blue: 0.12), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.52, y: 0),
                                    endPoint: UnitPoint(x: 0.52, y: 1.58)
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                    }
                    .padding(.bottom, 30)
                    .font(.system(size: 20))
                    
                    HStack (spacing: 16) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("Green10"))
                            .frame(width: 230, height: 62)
                            .overlay {
                                HStack {
                                    Image(systemName: "star.square.fill")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                    
                                    VStack (alignment: .leading){
                                        Text("Loyalty Member Card")
                                        Text(isLoggedIn ? "Green" : "")
                                    }
                                    .font(.system(size: 16))
                                }
                                .padding()
                            }
                            .onTapGesture {
                                print("loyalty")
                            }
                        
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("Green10"))
                            .frame(width: 107, height: 62)
                            .overlay {
                                VStack (alignment: .center){
                                    Text("Points")
                                    Text(isLoggedIn ? "30" : "")
                                        .fontWeight(.bold)
                                }
                                .font(.system(size: 16))
                            }
                            .onTapGesture {
                                print("points")
                            }
                    }
                    
                }
                
                VStack (alignment: .leading) {
                    Text("Food Rescue")
                        .font(.body.bold())
                        .foregroundStyle(Color("Neutral7"))
                    HStack {
                        VStack {
                            Image("PetaIndo")
                            HStack (alignment: .top, spacing: 30){
                                VStack (spacing: 12){
                                    Text("36,134")
                                        .font(.body.bold())
                                        .foregroundStyle(Color("Orange70"))
                                    Text("Excess food \n dismantled")
                                        .font(.caption2)
                                        .foregroundStyle(Color("Neutral7"))
                                        
                                }
                                VStack (spacing: 12){
                                    Text("17,402")
                                        .font(.body.bold())
                                        .foregroundStyle(Color("Orange70"))
                                    Text("Reduce waste (TPA)")
                                        .font(.caption2)
                                        .foregroundStyle(Color("Neutral7"))
                                       
                                }
                                VStack (spacing: 12){
                                    Text("141,338")
                                        .font(.body.bold())
                                        .foregroundStyle(Color("Orange70"))
                                    Text("CO2 emissions are \n prevented")
                                        .font(.caption2)
                                        .foregroundStyle(Color("Neutral7"))
                                }
                            
                            }
                            .multilineTextAlignment(.center)
                            .frame(width: 353, height: 92)
                            .background(Color("Green10"))
    
                            
                        }
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.07, green: 0.04, blue: 0.2), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.07, green: 0.04, blue: 0.2).opacity(0.85), location: 1.00),
                                ],
                            startPoint: UnitPoint(x: 0.72, y: 0.95),
                            endPoint: UnitPoint(x: 0.71, y: -0.05)
                            )
                        )
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        print("map")
                    }
                }
                .padding(.top, 24)
                Spacer()
                
                    NavigationLink {
                        //ContentView()
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
            .padding(.horizontal, 20)
        }
        .navigationDestination(isPresented: $goToProfile) {
            ProfileView()
        }
    }
}

#Preview {
    MainPageView()
}
