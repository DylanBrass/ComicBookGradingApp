//
//  conditionEnum.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-23.
//

import Foundation

enum Condition: Int, CaseIterable {
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
}
