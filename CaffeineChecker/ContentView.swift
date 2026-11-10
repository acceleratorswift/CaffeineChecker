//
//  ContentView.swift
//  CaffeineChecker
//
//  Created by Z MacPro on 6/11/26.
//
//  Button: Caffeine += 1
//  Text Input = Limit
//  Alert: if Caffeine == Limit


import SwiftUI

struct ContentView: View {
    @State private var Caffeine = 0
    @State private var Limit = ""
    @State private var showingAlert = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var showingAlert4 = false
    var body: some View {
        TabView {
            Tab("Limit Setting", systemImage: "gearshape.2") {
                GeometryReader { geometry in
                    ZStack {
                        // Background
                        Image("Coffee2")
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: geometry.size.width,
                                height: geometry.size.height
                            )
                            .clipped()
                        
                        VStack(spacing: 15) {
                            Text("Set Your Coffee Limit")
                                .font(.title2)
                                .bold()

                            TextField("Enter limit", text: $Limit)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 280)

                            Button("Save Limit") {
                                
                                if Int(Limit) == nil || Int(Limit)! <= 0 {
                                    showingAlert2 = true
                                } else {
                                    showingAlert4 = true
                                }
                            }
                            .alert("Invalid Limit", isPresented: $showingAlert2) {
                                Button("OK", role: .cancel) { }
                            } message: {
                                Text("Please enter a (positive) number!")
                            }
                            .alert("Saved", isPresented: $showingAlert4) {
                                Button("OK", role: .cancel) { }
                            } message: {
                                Text("Your limit right now is \(Limit)")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }
                }
                .ignoresSafeArea()
            }
            //end of tab
            Tab("Logging", systemImage: "calendar.badge.checkmark.rtl") {
                ZStack {
                    Image("Coffee")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    VStack {
                        Text("\(Caffeine) drank")
                            .padding()
                            .background(Color(.brown))
                            .clipShape(.rect)
                            .shadow(color: .brown, radius: 5)
                        Button {
                            Caffeine += 1
                            if let limit = Int(Limit) {
                                if Caffeine > limit {
                                    showingAlert3 = true
                                }
                            }
                        } label: {
                            Text("I have drank a cup of Coffee")
                        }
                        .alert("You haven't even drank coffee stupid🫩", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                        .alert("Coffee Limit Exceeded! ☕", isPresented: $showingAlert3) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text("You have drank \(Caffeine) cups, exceeding your limit of \(Limit) cups!")
                        }
                        .buttonStyle(.plain)
                        .padding()
                        .background(Color(.brown))
                        .clipShape(.capsule)
                        Button{
                            if Caffeine > 0 {
                                Caffeine -= 1
                            } else {
                                showingAlert = true
                            }
                        } label: {
                            Text("Oops I realised I did not")
                        }
                        .buttonStyle(.plain)
                        .padding()
                        .background(Color(.brown))
                        .clipShape(.capsule)
                    }
                }
                //end of ZStack
            }
            //end of tab
        }
        .toolbarBackground(.hidden, for: .tabBar)
        //end of tabView
    }
    //end of body view
}


#Preview {
    ContentView()
}
