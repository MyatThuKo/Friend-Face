//
//  UserView.swift
//  Friends Face
//
//  Created by Myat Thu Ko on 7/14/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var user: UserInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .foregroundColor(user.isActive ? Color.green : Color.red)
                    .frame(width: 10, height: 10)
                Text("\(user.name) (\(user.age))")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: UserInfo(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["one", "two", "three"], friends: [Friends(id: "", name: "asd"), Friends(id: "", name: "asd")]))
    }
}
