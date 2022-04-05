//
//  SearchGame.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 4/04/22.
//

import Foundation

class SearchGame : ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    func search(gameName: String) {
        
        gamesInfo.removeAll()
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
        
            do {
                if let jsonData = data {
                    print("Json size: \(jsonData)")
        
                    let decodeData = try
                        JSONDecoder().decode(Result.self, from: jsonData)
        
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData.results)
                    }
                }
        
            } catch {
                print("Error: \(error)")
            }
        
        }.resume()
    }
    
}
