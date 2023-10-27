//
//  AllComics.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct AllComics: View {
    
    @ObservedObject var comicVM: ComicGradingViewModel
    
    var body: some View {
        VStack{
            Text("All Comics")
            
            ForEach(comicVM.allComics, id: \.id){
                comic in
                Button(action: {
                    comicVM.editComic(id: comic.id)
                }, label: {
                    Text("\(comic.id) : \(comic.title)")
                })
            }
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))

    }
}
