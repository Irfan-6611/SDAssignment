//
//  ArticleTableViewCell.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import UIKit

class MostViewedArticlesTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var bylineLable: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!

    static var identifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    var articleViewModel: ArticleViewModel? {
        didSet {
            guard let article = articleViewModel else { return }
            titleLable.text = article.title
            bylineLable.text = article.byline
            typeLable.text = article.type
            dateLable.text = article.publishedDate

        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 25
        profileImageView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
