//
//  AddView.swift
//  Cheerify
//
//  Created by Jessica Chew on 1/5/24.
//

import SwiftUI

struct AddView: View {
    var body: some View {
        ZStack{
            //add text box to be able to add own quotes
            Color(red: 242/255, green: 247/255, blue: 228/255)
                .ignoresSafeArea()
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    AddView()
}
