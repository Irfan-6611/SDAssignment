//
//  DetailViewController.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import UIKit
import Kingfisher

class MostViewedArticleDetailViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet var sourceLable: UILabel!
    @IBOutlet var subsectionLable: UILabel!
    @IBOutlet var thumbnilImageView: UIImageView!
    @IBOutlet var activityLoader: UIActivityIndicatorView!
    @IBOutlet var postTitleLable: UILabel!
    @IBOutlet var publishedDateLable: UILabel!
    @IBOutlet var postDetailLable: UILabel!
    @IBOutlet var authorLable: UILabel!

    var articleDetailItem: ArticleViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Article Detail"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let detail = articleDetailItem else { return }
        mapData(mostViewed: detail)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapData(mostViewed: ArticleViewModel) {
        sourceLable.text = mostViewed.source
        subsectionLable.text = mostViewed.subsection
        postTitleLable.text = mostViewed.title
        authorLable.text = "Author: " + mostViewed.byline
        publishedDateLable.text = "Published : " + mostViewed.publishedDate
        postDetailLable.text = mostViewed.abstract

        guard let imageURL = URL(string: mostViewed.media.thumbnailImageUrl) else {
            return
        }
        activityLoader.startAnimating()

        thumbnilImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: AppConstants.Theme.defultCellImageName), options: [.transition(.fade(1))], progressBlock: nil) { [weak self] (_) in
          self?.activityLoader.stopAnimating()
        }

    }
}
