//
//  ArticleTableViewDataSource.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import UIKit

protocol MostViewedArticleTableViewCellProtocol {
    func didTapOnRow(_ article: ArticleViewModel)
}

class MostViewedArticleTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    var dataArray: [ArticleViewModel] = []
    var articleTableViewCellProtocol: MostViewedArticleTableViewCellProtocol?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MostViewedArticlesTableViewCell.identifier, for: indexPath) as? MostViewedArticlesTableViewCell {
            cell.articleViewModel = dataArray[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = articleTableViewCellProtocol {
            let selectedArticle = dataArray[indexPath.row]
            delegate.didTapOnRow(selectedArticle)
        }
    }
}
