//
//  String+ToArray.swift
//  AlcoholMeter
//
//  Created by Natalia De Biasio on 12/11/2021.
//
import Foundation

extension String {
    func splitIntoArrayOfString() -> Array<String> {
        let charArr: Array<Character> = Array(self)
        var strArr: Array<String> = []
        for char in charArr {
            strArr.append(String(char))
        }
        return strArr
    }
}

extension Array where Element == String {
    func mergeIntoString() -> String {
        var str: String = ""
        for singleChar in self {
            str += singleChar
        }
        return str
    }
}
