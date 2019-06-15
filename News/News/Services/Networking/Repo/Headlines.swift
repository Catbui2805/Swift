//
//  HeadlinesRepo.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation

protocol HeadlinesRepoable {
    func getNewsArticle(page: Int, pageSize: Int,
                        compelite: @escaping (_ result: [Article]?, _ error: BaseResponseError?) -> Void)
    
}

class Headlines: HeadlinesRepoable {
    func getNewsArticle(page: Int = 1, pageSize: Int = 10,
                        compelite: @escaping (_ result: [Article]?, _ error: BaseResponseError?) -> Void) {
        RequestApi.request(.getNewsArticles(page: page, pageSize: pageSize), [Article.self]) { result, error in
            compelite(result, error)
        }
    }
    
}
