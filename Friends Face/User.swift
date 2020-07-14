//
//  User.swift
//  Friends Face
//
//  Created by Myat Thu Ko on 7/14/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import Foundation

class User: ObservableObject {
    @Published var items = [UserInfo]()
    
    init() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let decodedUsers = try decoder.decode([UserInfo].self, from: data)
                DispatchQueue.main.async {
                    self.items = decodedUsers
                }
            } catch let error {
                print("error: \(error)")
            }
        }.resume()
    }
    
    func findUser(byName name: String) -> UserInfo? {
        if let user = items.first(where: { $0.name == name }) {
            return user
        }
        
        return items.first
    }
}
