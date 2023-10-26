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
        VStack{
            Text("Page Damage Report")
            Text(comic.comic?.title ?? "")
     
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))

    }
}
