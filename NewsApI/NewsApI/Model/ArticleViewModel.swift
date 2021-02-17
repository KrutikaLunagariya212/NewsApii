//
//  ArticleViewModel.swift
//  NewsApI
//
//  Created by krutika on 2/17/21.
//

import Foundation

class ArticleListViewModel : NSObject{
    var serviceObj = NewsService()
    private(set) var articles : [Article] = [] {
    didSet{
        self.didLoadChangeData()
    }
    }
    var didLoadChangeData : (() -> ()) = {}
    
    override init() {
        super.init()
        ApiService()
    }
}
extension ArticleListViewModel{
    var numberOfSection : Int{
        return 1
    }
    func numberOfRowOfSection(section : Int) -> Int{
        if articles.count > 0{
            return articles.count}
        return 0
    }
    func articleAtIndex(index : Int) -> ArticleViewModel{
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
     func ApiService(){
        guard let newsUrl = URL(string: constant.newsURL) else{
            return
        }
        serviceObj.getServiceForNewsApi(url: newsUrl) { [self] (response, error) in
            guard let responseArticle = response else{
                fatalError("Error while parsing")
            }
            articles = responseArticle
        }
    }
}

struct ArticleViewModel {
    var article : Article
}

extension ArticleViewModel{
    init(_ article : Article) {
        self.article = article
    }
    
    var title : String {
        return article.title
    }
    var description : String{
        return article.description
    }
}







