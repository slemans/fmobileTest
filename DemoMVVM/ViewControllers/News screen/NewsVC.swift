//
//  NewsVC.swift
//  shopDemo
//
//  Created by Павел on 17.05.23.
//

import SnapKit
import UIKit

final class NewsVC: UIViewController {

    // MARK: - Public
    
    // MARK: External dependencies

    var viewModel: NewsViewModelInput!
    
    // MARK: - Private

    // MARK: UI
    
    private lazy var table: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        return tableView
    }()
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupView()
    }

}

// MARK: - Private functions

private extension NewsVC {
    
    func setupLayout() {
        view.backgroundColor = .white
        navigationItem.title = viewModel.getTitlePage()
        navigationController?.navigationBar.topItem?.title = .emptyLine
    }
    
    func setupView() {
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}

// MARK: - UITableViewDataSource

extension NewsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsCell.identifier,
            for: indexPath)
        as? NewsCell
        let model = viewModel.cellViewModel(forIndexPath: indexPath)
        cell?.setupCell(model: model)
        return cell ?? UITableViewCell()
    }
    
}
