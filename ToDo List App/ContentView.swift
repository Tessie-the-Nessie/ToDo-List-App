//
//  ContentView.swift
//  ToDo List App
//
//  Created by Tessa Delsener on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack {
                
                Text("ToDo List!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                
                Spacer()
                
                Button {
                    
                    withAnimation {
                        
                        self.showNewTask = true
                    }
                    
                } label: {
                    Text("+")
                }
                .buttonBorderShape(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=shape: ButtonBorderShape@*/.circle/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
            }
            
            Spacer()
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        if showNewTask {
            NewToDoView()
        }
        
    }
}

#Preview {
    ContentView()
}
