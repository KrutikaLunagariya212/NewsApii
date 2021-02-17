//
//  NewsServiceManager.swift
//  NewsApI
//
//  Created by krutika on 2/16/21.
//

import Foundation
struct NewsService {
    
    private var urlSession = URLSession()
    init(urlSession : URLSession = .shared) {
        self.urlSession = urlSession
    }
    func getServiceForNewsApi(url : URL? , completionHandler : @escaping ([Article]? , NewsJsonError?) -> Void){
        guard let urlStr = url else{
            completionHandler (nil , NewsJsonError.invalidUrl)
            return
        }
        let task = urlSession.dataTask(with: urlStr) { (data, response, error) in
         
            if let responseError = error{
                completionHandler(nil, NewsJsonError.failed(description: responseError.localizedDescription))
                return
            }
            if let data = data{
               if let jsondecode = try? JSONDecoder().decode(ArticleList.self, from: data){

                completionHandler(jsondecode.articles , nil)
            }else{
                completionHandler(nil , NewsJsonError.invalidResponse)
            }
            
            }}
        task.resume()
        
    }
    
}
