//
//  SwiftUIView.swift
//  Cheerify
//
//  Created by Jessica Chew on 1/5/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack{
            //add a back button to return to home page
            //have options to do things... what to do??
            //need to add title screen
            Color(red: 242/255, green: 247/255, blue: 228/255)
                .ignoresSafeArea()
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
    MenuView()
}
