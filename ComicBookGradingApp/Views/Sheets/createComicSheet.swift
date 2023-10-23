//
//  createComicSheet.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-23.
//

import Foundation
import SwiftUI



struct CreateComicSheet: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text("Enter Comic Information").font(.title)
            
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                })
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Confirm")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                })
            }
        }
    }
}

