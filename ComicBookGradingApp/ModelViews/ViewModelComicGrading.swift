//
//  ViewModelComicGrading.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import Foundation
import SwiftUI


class ComicGradingViewModel: ObservableObject{
    
    @Published var comicGraded: ComicToBeGraded?
    
    @Published var allComics: [ComicToBeGraded] = []
    
    
    init(){
    }
    
    func getAllComics(){
        FirestoreManager.firestoreService.readComic { (comics, error) in
            if let error = error {
                print("Error reading comics: \(error)")
            } else if let comics = comics {
                self.allComics = comics
            }
        }
    }
    
    func getOverallGrade(comic: ComicToBeGraded) -> Int{
        return (comic.overallCondition!.rawValue + getAvgPageGrade(comic: comic) + getAvgCoverGrade(comic: comic)) / 3
    }
    
    private func getAvgCoverGrade(comic: ComicToBeGraded) -> Int{
        let count = comic.coverCondition.count
        var total = 0
        if(count > 0){
            for grade in comic.coverCondition.values {
                if(grade == .noneSelected){
                    total += comic.overallCondition?.rawValue ?? 0
                }
                else{
                    total += grade.rawValue
                }
            }
            print("Total for covers : \(total)")
            return total / count
        }
        return comic.overallCondition?.rawValue ?? 0
    }
    
    private func getAvgPageGrade(comic: ComicToBeGraded) -> Int{
        let count = comic.damagedPages.count
        var total = 0
        if(count > 0){
            for grade in comic.damagedPages.values {
                if(grade == .noneSelected){
                    total += comic.overallCondition?.rawValue ?? 0
                }else{
                    total += grade.rawValue
                }
            }
            print("Total for pages : \(total)")
            
            return total / count
            
        }
        
        return comic.overallCondition?.rawValue ?? 0
    }
    
    func removePage(page: Int){
        comicGraded?.damagedPages.removeValue(forKey: page)
    }
    
    func startTracking(comicNew: ComicToBeGraded) {
        self.comicGraded = comicNew
    }
    
    func endTracking(){
        self.comicGraded = nil
    }
    
    func anyComics() -> Bool{
        return allComics.isEmpty
    }
    
    func deleteComic(id: String){
        FirestoreManager.firestoreService.deleteComic(id: id) { error in
            if let error = error {
                print("Error deleting comic: \(error)")
            } else {
                print("Comic deleted successfully")
                self.getAllComics()
            }
        }
    }
    
    func coverGrading(cover: Cover, condition:Condition ){
        comicGraded?.coverCondition.updateValue(condition, forKey: cover)
    }
    
    func saveComicGrading(grade: Condition){
        comicGraded?.overallCondition = grade
        if allComics.firstIndex(where: {$0.id == self.comicGraded!.id}) != nil{
            FirestoreManager.firestoreService.updateComic(id: self.comicGraded!.id, comic: comicGraded!) { error in
                if let error = error {
                    print("Error updating comic: \(error)")
                } else {
                    self.getAllComics()
                }
            }
        }else{
            FirestoreManager.firestoreService.createComic(comic: comicGraded!)
            self.getAllComics()

        }
        comicGraded = nil
    }
    
    func editComic(id: String){
        FirestoreManager.firestoreService.getComic(id: id){ (comic, error) in
            if let error = error {
                print("Error getting comic by ID: \(error)")
            } else if let comic = comic {
                self.comicGraded = comic
            } else {
                print("Comic not found")
            }
        }
    }
        
        func updateComicGraded(update: ComicToBeGraded){
            var editedComic = update
            
            editedComic.id = comicGraded?.id ?? ""
            
            comicGraded = editedComic
            
        }
        
        
        func addDamagedPage(page: Int, cond: Condition){
            comicGraded?.damagedPages.updateValue(cond, forKey: page)
        }
    }

