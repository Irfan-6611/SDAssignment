//
//  ArticleListViewModel.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation
import UIKit

class ArticleListViewModel {

    var repository = ArticlesRepository(dataManager: APIManager.shared)

    var reloadTableViewClosure: (([ArticleViewModel]) -> Void)?
    var showAlertClosure: ((String) -> Void)?
    var updateLoadingStatus: (() -> Void)?

    private var articleViewModels: [ArticleViewModel] = [ArticleViewModel]() {
        didSet {
            self.reloadTableViewClosure?(articleViewModels)
        }
    }

    var alertMessage: String? {
        didSet {
            self.showAlertClosure?(alertMessage ?? "Some thing went wrong")
        }
    }

    func getMostViewedArticles() {

        repository.fetchMostViewedArticles(completion: { [weak self] (articles) in
            self?.prepareArticleViewModelFromBusinessModel(from: articles)
        }, failure: {  [weak self] (error) in
            self?.alertMessage = error ?? "Something went wrong"
            })
    }

    func prepareArticleViewModelFromBusinessModel( from articles: Articles) {
        var processedViewModelArray = [ArticleViewModel]()
        guard let results = articles.results else { return }
        for item in results {
            let media = MediaItemViewModel(thumbnailImageUrl: item.media?.first?.getTumbnailMedia()?.url ?? "")
          let viewModel = ArticleViewModel(
            media: media, source: item.source ?? "",
            subsection: item.subsection ?? "",
            title: item.title ?? "",
            byline: item.byline ?? "",
            type: item.type ?? "",
            publishedDate: item.publishedDate ?? "",
            abstract: item.abstract ?? ""
          )
            processedViewModelArray.append(viewModel)
        }

        self.articleViewModels = processedViewModelArray

    }

}

struct  ArticleViewModel {
    let media: MediaItemViewModel
    let source: String
    let subsection: String
    let title: String
    let byline: String
    let type: String
    let publishedDate: String
    let abstract: String

}

struct MediaItemViewModel {
    let thumbnailImageUrl: String
}
