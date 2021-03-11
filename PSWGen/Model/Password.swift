//
//  Password.swift
//  PSWGenerator
//
//  Created by Christian Coduri on 11/03/21.
//

import Foundation

struct Password {
    private let minuscoleList = Array("abcdefghijklmnopqrstuvwxyz")
    private let maiuscoleList = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private let numeriList = Array("1234567890")
    private let specialiList = Array("~`!@#$%^&*()-_+={}[]|\\/:;\"'<>,.?")
    
    func generaPassword(numeroChar: Int, minuscole: Bool, maiuscole: Bool, numeri: Bool, speciali: Bool) -> String {
        var array: [Character] = []
        var psw: String = ""
        
        if(minuscole){
            array.append(contentsOf: minuscoleList)
        }
        if(maiuscole){
            array.append(contentsOf: maiuscoleList)
        }
        if(numeri){
            array.append(contentsOf: numeriList)
        }
        if(speciali){
            array.append(contentsOf: specialiList)
        }
        
        for _ in 1 ... numeroChar {
            psw += String(array.randomElement()!)
        }
        
        return psw
    }
 
    

}
