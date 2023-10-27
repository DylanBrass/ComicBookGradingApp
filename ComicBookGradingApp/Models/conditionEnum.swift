//
//  conditionEnum.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-23.
//

import Foundation

enum Condition: Int, CaseIterable {
    case noneSelected = 0
    case cvls = 1
    case poor = 2
    case fr = 3
    case frGd = 4
    case gdMinus = 5
    case gd = 6
    case gdPlus = 7
    case gdVg = 8
    case vgMinus = 9
    case vg = 10
    case vgPlus = 11
    case vgFn = 12
    case fnMinus = 13
    case fn = 14
    case fnPlus = 15
    case fnVf = 16
    case vfMinus = 17
    case vf = 18
    case vfPlus = 19
    case vfNm = 20
    case nmMinus = 21
    case nm = 22
    case nmPlus = 23
    case nmMt = 24
    case mint = 25

    var name: String {
        switch self {
        case .noneSelected: return "None Selected"
        case .cvls: return "Coverless"
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
