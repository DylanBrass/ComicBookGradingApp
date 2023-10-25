//
//  ViewModelComicGrading.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import Foundation


class ComicGradingViewModel: ObservableObject{
    
    @Published var comic: ComicToBeGraded?
    
    init(){
        
    }
    
    func startTracking(comicNew: ComicToBeGraded) {
        self.comic = comicNew
    }
    
    func startGrading(){
        
    }
    
    
}
