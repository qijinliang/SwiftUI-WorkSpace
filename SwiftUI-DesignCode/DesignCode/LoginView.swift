//
//  LoginView.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-13.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var isDragging = false
    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertMessage = "Something went wrong."
    @State var isLoading = false
    @State var isSuccess = false
    @EnvironmentObject var user: UserStore
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func login() {
        self.isFocused = false
        self.hideKeyboard()
        self.isLoading = true
//        self.showAlert = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isSuccess = true
            self.isLoading = false
            self.user.isLogged = true
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Color("background2")
                .frame(maxWidth: 600, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Text("Learn design & code\nFrom scratch.")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 100)
                    .multilineTextAlignment(.center)
                    .offset(x: viewState.width/15, y: viewState.height/15)
//                    .rotation3DEffect(Angle(degrees: isDragging ? 2 : 0), axis: (x: viewState.height/10, y: viewState.width/10, z: 0))
                
                Text("80 hours of courses for SwiftUI, React and design tools.")
                    .font(.subheadline)
                    .frame(width: 250)
                    .padding(.top, 16)
                    .multilineTextAlignment(.center)
                    .offset(x: viewState.width/20, y: viewState.height/20)
//                    .rotation3DEffect(Angle(degrees: isDragging ? 4 : 0), axis: (x: viewState.height/10, y: viewState.width/10, z: 0))
                
                Spacer()
                
                Image("Card3")
                    .offset(x: viewState.width/25, y: viewState.height/25)
                    .scaleEffect(1.05)
//                    .rotation3DEffect(Angle(degrees: isDragging ? 5 : 0), axis: (x: viewState.height/10, y: viewState.width/10, z: 0))
            }
            .frame(height: 477)
            .frame(maxWidth: 600)
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -150, y: -200)
                    .rotationEffect(Angle(degrees: show ? 360*5 : 90))
                    .blendMode(.plusDarker)
                    .animation(Animation.linear(duration: 100*8))
                    .onAppear { self.show.toggle()}
            )
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -200, y: -250)
                    .rotationEffect(Angle(degrees: show ? 360*5 : 0), anchor: .bottomLeading)
                    .animation(Animation.linear(duration: 300*5))
            )
            .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .scaleEffect(isDragging ? 0.92 : 1)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .rotation3DEffect(Angle(degrees: 5), axis: (x: viewState.height/10, y: viewState.width/10, z: 0))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                        self.isDragging = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.isDragging = false
                }
            )
            
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color("background3"))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.1647058824, green: 0.1882352941, blue: 0.3882352941, alpha: 1)).opacity(0.1), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    TextField("Your Email".uppercased(), text: $email)
                        .keyboardType(.emailAddress)
                        .font(.subheadline)
                        .padding(.leading)
                        .onTapGesture {
                            self.isFocused = true
                        }
                    Spacer()
                }
                Divider()
                    .padding(.leading, 80)
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color("background3"))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.1647058824, green: 0.1882352941, blue: 0.3882352941, alpha: 1)).opacity(0.1), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    SecureField("Password".uppercased(), text: $password)
                        .font(.subheadline)
                        .padding(.leading)
                        .onTapGesture {
                            self.isFocused = true
                        }
                    Spacer()
                }
            }
            .frame(width: 343, height: 136)
            .background(BlurView(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.1647058824, green: 0.1882352941, blue: 0.3882352941, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: 460)
            
            HStack {
                Text("Forgot password?")
                    .font(.subheadline)
                
                Spacer()
                
                Button(action: { self.login() }) {
                    Text("Log in".uppercased())
                        .foregroundColor(.black)
                }
                .padding(12)
                .padding(.horizontal, 30)
                .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 20)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Bad login"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: 400)
            .offset(y: 620)
            
            if isLoading {
                LoadingView()
            }
            
            if isSuccess {
                SuccessView()
                    .onTapGesture {
                        self.isSuccess = false
                        self.email = ""
                        self.password = ""
                        self.user.showLogin = false
                }
                .edgesIgnoringSafeArea(.all)
            }
            
        }
        .offset(y: isFocused ? -300 : 0)
        .animation(isFocused ? .timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8) : .none)
        .onTapGesture {
            self.isFocused = false
            self.hideKeyboard()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
//            .colorScheme(.dark)
    }
}
