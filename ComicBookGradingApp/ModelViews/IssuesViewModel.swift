//
//  IssuesViewModel.swift
//  ComicBookGradingApp
//
//  Created by Dylan on 2023-12-09.
//

import Foundation

class IssuesViewModel: ObservableObject{
    let service = MetronApiCallService()
    
    @Published var issues: IssueResponse? = nil
    
    func testGetIssues(page:Int){
        print("In test fetch")
        service.fetchAll(page: page, completion:{
            data in
            self.issues = data ?? nil
        }
)
    }
    
}
    
