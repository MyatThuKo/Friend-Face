//
//  DetailView.swift
//  Friends Face
//
//  Created by Myat Thu Ko on 7/14/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var users: User
    
    var userInfo: UserInfo
    
    var body: some View {
        Form {
            Section(header: Text("Info")) {
                Text("Age: \(String(userInfo.age))")
                Text("Email: \(userInfo.email)")
                Text("Company: \(userInfo.company)")
            }
            
            Section(header: Text("About")) {
                Text(userInfo.about)
            }
            
            Section(header: Text("Tags")) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(userInfo.tags, id: \.self) { tag in
                            Text(tag)
                            .padding()
                        }
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [.red, .green, .blue]), startPoint: .leading, endPoint: .trailing))
                }
            }
            
            Section(header: Text("Friend List")) {
                List {
                    ForEach(userInfo.friends) { friend in
                        UserView(user: self.users.findUser(byName: friend.name)!)
                    }
                }
            }
        }
        .navigationBarTitle("\(userInfo.name)", displayMode: .inline)
        .navigationBarItems(trailing:
            Rectangle()
                .foregroundColor(userInfo.isActive ? .green : .red)
                .frame(width: 20, height: 20))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(users: User(), userInfo: UserInfo(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["one", "two", "three"], friends: [Friends(id: "", name: "asd"), Friends(id: "", name: "asd")]))
        }
    }
}
