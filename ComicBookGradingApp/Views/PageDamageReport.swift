//
//  PageDamageReport.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct PageDamageReport: View {
    
    @ObservedObject var comic:ComicGradingViewModel
    
    var body: some View {
        Text("Page Damage Report")
        Text(comic.comic!.title)
    }
}
