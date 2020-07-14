//
//  ContentView.swift
//  Friends Face
//
//  Created by Myat Thu Ko on 7/14/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user = User()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(user.items) { user in
                    NavigationLink(destination: DetailView(users: self.user, userInfo: user)) {
                        UserView(user: user)
                    }
                }
            }
            .navigationBarTitle("Friends Face")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
