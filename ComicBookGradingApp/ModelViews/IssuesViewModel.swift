//
//  IssuesViewModel.swift
//  ComicBookGradingApp
//
//  Created by Dylan on 2023-12-09.
//

import Foundation

class IssuesViewModel: ObservableObject{
    
    @Published var issues: IssueResponse? = nil
    
    func GetIssues(page:Int){
        print("In test fetch")
        MetronApiCallService.apiCallService.fetchAll(page: page, completion:{
            data in
            self.issues = data ?? nil
        }
)
    }
    
}
    
