//
//  ContentView.swift
//  Shiro
//
//  Created by Wilton Garcia on 12/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var castlesVisited: Int = 0
    var body: some View {
        VStack {
            Section {
                VStack {
                    Text("Profile.Home.Screen.Title", tableName: "Localizable")
                    Spacer()
                    HStack{
                        Text("Profile.Home.Name.Label", tableName: "Localizable")
                        Spacer()
                        Text("Wilton Garcia")
                    }
                    HStack{
                        Text("Profile.Home.Email.Label", tableName: "Localizable")
                        Spacer()
                        Text("wiltongarcia@gmail.com")
                    }
                    HStack{
                        Text("Profile.Home.Birthday.Label", tableName: "Localizable")
                        Spacer()
                        Text("25/04/1995")
                    }
                
                    Text("\(castlesVisited) Profile.Home.Reserves.Label")
                        .padding()
                    
                    Button {
                        castlesVisited += 1
                    } label: {
                        Text("Add Castle")
                    }

                    
                }
                Spacer()
            }
            
            Spacer()
            
            VStack{
                Text("Shiro App")
                Text("Developer by: Wilton Garcia")
                Text("V:0.0.03")
            }.font(.footnote)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
