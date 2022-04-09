//
//  SaveData.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 8/04/22.
//

import Foundation

class SaveData {
    var email: String = ""
    var password: String = ""
    var name: String = ""
    
    func saveData(email: String, password: String, name: String) -> Bool {
        
        print("Data: \(email) + \(password) + \(name)")
        
        UserDefaults.standard.set([email, password, name], forKey: "userData")
        
        return true
    }
    
    
    func retrieveData() -> [String] {
        let userData: [String] = UserDefaults.standard.stringArray(forKey: "userData")!
        print("Values: \(userData)")
        return userData
    }
    
    
    func validate(email: String, password: String) -> Bool {
        var savedEmail = ""
        var savedPassword = ""
        
        print("\(email) - \(password)")
        
        if UserDefaults.standard.object(forKey: "userData") != nil {
            savedEmail = UserDefaults.standard.stringArray(forKey: "userData")![0]
            savedPassword = UserDefaults.standard.stringArray(forKey: "userData")![1]
            
            print("We have \(savedEmail) - \(savedPassword)")
            
            if(email == savedEmail && password == savedPassword){
                return true
            } else {
                return false
            }
            
        }else {
            print("No data...")
            return false
        }
    }
}
