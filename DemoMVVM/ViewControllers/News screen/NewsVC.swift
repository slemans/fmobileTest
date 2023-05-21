//
//  NewsVC.swift
//  shopDemo
//
//  Created by Павел on 17.05.23.
//

import SnapKit
import UIKit

final class NewsVC: BaseScreen {
    
    // MARK: External dependencies

    var viewModel: NewsViewModelInput?

    // MARK: UI
    
    private var table = UITableView()
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
    }

}

// MARK: - Private functions

private extension NewsVC {
    
    func setupView() {
        navigationItem.title = viewModel?.getTitlePage()
        navigationController?.navigationBar.topItem?.title = .emptyLine
        table = makeTableView()
    }
    func setupLayout() {
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero)
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        return tableView
    }

}

// MARK: - UITableViewDataSource

extension NewsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsCell.identifier,
            for: indexPath)
        as? NewsCell
        let model = viewModel?.cellViewModel(forIndexPath: indexPath)
        cell?.setupCell(model: model)
        return cell ?? UITableViewCell()
    }
    
}
