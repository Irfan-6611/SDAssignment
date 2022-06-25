//
//  ArticleViewController.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import UIKit

let kEstimatedRowHeight: CGFloat = 600

class MostViewedArticleViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: ShadesView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    let dataSource = MostViewedArticleTableViewDataSource()
    let viewModel = ArticleListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - Custom Methods
    func configureTableView() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.register(MostViewedArticlesTableViewCell.nib, forCellReuseIdentifier: MostViewedArticlesTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = kEstimatedRowHeight
    }
    func configureViewModel() {
        activityIndicatorView.startAnimating()
        viewModel.getMostViewedArticles()
        viewModel.reloadTableViewClosure = { [weak self] (viewModelList) in
            guard let self = self else { return }
            self.dataSource.dataArray  = viewModelList
            self.dataSource.articleTableViewCellProtocol = self
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicatorView.stopAnimating()
            }
        }

        viewModel.showAlertClosure = { (error) in
            // here we can display alert view controller
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
            }
        }
    }

}

extension MostViewedArticleViewController: MostViewedArticleTableViewCellProtocol {
    func didTapOnRow(_ article: ArticleViewModel) {
        // Initialize Detail View Controller
        if let detailViewController = UIStoryboard.instantiateViewController(for: .Main, indentifier: AppConstants.detailViewController) as? MostViewedArticleDetailViewController {
            detailViewController.articleDetailItem = article
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }

}
