//
//  ContentView.swift
//  Cheerify
//
//  Created by Jessica Chew on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var affirmation: String = "get started by pressing the refresh button"
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                Color(red: 242/255, green: 247/255, blue: 228/255)
                    .ignoresSafeArea()
                VStack{
                    HStack{
//                        NavigationLink(value: "NewView"){
//                            Text("help")
//                        }
//                        
                        Button {
                            path.append("MenuView")
                            print("Menu Button")
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .frame(width: 50, height: 50)
                                .background(Color(red:196/255, green: 197/255, blue: 202/255))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                        .navigationDestination(for: String.self)
                        { view in
                            MenuView()
                            
                        }
                        .padding([.leading], 10)
                        
                        Spacer()
                        
                    VStack {
                        
                        Text("Cheerify")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:63/255, green: 65/255, blue: 78/255))
                        Text("daily affirmation companion")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                    }
                        Spacer()
                        Button {
                            print("Button")
                        } label: {
                            Image(systemName: "plus")
                                .frame(width: 50, height: 50)
                                .background(Color(red:196/255, green: 197/255, blue: 202/255))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                        
                    .padding([.trailing], 10)
                }
                    Spacer()
                    Text(affirmation)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .onAppear {
                            fetchAffirmation()
                        }
                        .padding()
                    Spacer()
                    HStack{
                        Button {
                            print("Refresh Button")
                            fetchAffirmation()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .frame(width: 50, height: 50)
                                .background(Color(red:196/255, green: 197/255, blue: 202/255))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .font(.title)
                                .foregroundColor(Color.white)
                            
                        }
                        .padding(.leading, 10)
                        Spacer()
                        
                        Button {
                            print("Favorites Button")
                        } label: {
                            Image(systemName: "heart.fill")
                                .frame(width: 50, height: 50)
                                .background(Color(red:196/255, green: 197/255, blue: 202/255))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .font(.title)
                                .foregroundColor(Color.white)
                            
                        }
                        .padding(.trailing, 10)
                    }
                }
    //            .padding()

        }
                }
        
    }
    func fetchAffirmation() {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://www.affirmations.dev/")!)
                if let decodedResponse = try? JSONDecoder().decode(Affirmation.self, from: data) {
                    affirmation = decodedResponse.affirmation
                } else {
                    affirmation = "Failed to load affirmation"
                }
            } catch {
                print("Failed to fetch affirmation: \(error)")
                affirmation = "Error fetching affirmation"
            }
        }
    }
}

struct Affirmation : Decodable {
    let affirmation: String
}


#Preview {
    ContentView()
}
