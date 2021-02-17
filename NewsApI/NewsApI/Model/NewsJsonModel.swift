//
//  NewsJsonModel.swift
//  NewsApI
//
//  Created by krutika on 2/16/21.
//

import Foundation

struct ArticleList : Decodable{
    let articles : [Article]
    }
struct Article : Decodable{
    let title : String
    let description : String
 
}
struct constant {
    static let newsURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=a344ca8c9daa4932869c8add3a6b4509"
}
