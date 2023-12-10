//
//  conditionEnum.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-23.
//

import Foundation

enum Condition: Int, CaseIterable, Codable {
    case noneSelected = 0
    case poor = 1
    case fr = 2
    case frGd = 3
    case gdMinus = 4
    case gd = 5
    case gdPlus = 6
    case gdVg = 7
    case vgMinus = 8
    case vg = 9
    case vgPlus = 10
    case vgFn = 11
    case fnMinus = 12
    case fn = 13
    case fnPlus = 14
    case fnVf = 15
    case vfMinus = 16
    case vf = 17
    case vfPlus = 18
    case vfNm = 19
    case nmMinus = 20
    case nm = 21
    case nmPlus = 22
    case nmMt = 23
    case mint = 24

    var name: String {
        switch self {
        case .noneSelected: return "None Selected"
        case .poor: return "Poor"
        case .fr: return "Fair"
        case .frGd: return "Fair/Good"
        case .gdMinus: return "Good-"
        case .gd: return "Good"
        case .gdPlus: return "Good+"
        case .gdVg: return "Good/Very Good"
        case .vgMinus: return "Very Good-"
        case .vg: return "Very Good"
        case .vgPlus: return "Very Good+"
        case .vgFn: return "Very Good/Fine"
        case .fnMinus: return "Fine-"
        case .fn: return "Fine"
        case .fnPlus: return "Fine+"
        case .fnVf: return "Fine/Very Fine"
        case .vfMinus: return "Very Fine-"
        case .vf: return "Very Fine"
        case .vfPlus: return "Very Fine+"
        case .vfNm: return "Very Fine/Near Mint"
        case .nmMinus: return "Near Mint-"
        case .nm: return "Near Mint"
        case .nmPlus: return "Near Mint+"
        case .nmMt: return "Near Mint/Mint"
        case .mint: return "Mint"
        }
    }
    
    public static func getNameFromValue(value: Int) -> String{
        switch value{
        case 0: return "None Selected"
        case 1: return "Poor"
        case 2: return "Fair"
        case 3: return "Fair/Good"
        case 4: return "Good-"
        case 5: return "Good"
        case 6: return "Good+"
        case 7: return "Good/Very Good"
        case 8: return "Very Good-"
        case 9: return "Very Good"
        case 10: return "Very Good+"
        case 11: return "Very Good/Fine"
        case 12: return "Fine-"
        case 13: return "Fine"
        case 14: return "Fine+"
        case 15: return "Fine/Very Fine"
        case 16: return "Very Fine-"
        case 17: return "Very Fine"
        case 18: return "Very Fine+"
        case 19: return "Very Fine/Near Mint"
        case 20: return "Near Mint-"
        case 21: return "Near Mint"
        case 22: return "Near Mint+"
        case 23: return "Near Mint/Mint"
        case 24: return "Mint"
        default:
            return "None Selected"
        }
    }
}
