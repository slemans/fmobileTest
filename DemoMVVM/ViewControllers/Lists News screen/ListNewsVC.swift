//
//  ListNewsVC.swift
//  shopDemo
//
//  Created by Павел on 16.05.23.
//

import SnapKit
import UIKit

final class ListNewsVC: BaseScreen {
    
    // MARK: External dependencies

    var viewModel: ListNewsViewModelInput?

    // MARK: UI
    
    private var table = UITableView()
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        settingTableView()
        viewModel?.fetchNews { [weak self] in
            self?.setupTableView()
        }
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }

}

// MARK: - Private functions

private extension ListNewsVC {
    
    func setupView() {
        navigationItem.title = viewModel?.getTitle()
    }
    func setupLayout() {
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    func setupTableView() {
        table.reloadData()
    }
    func settingTableView() {
        table = makeTableView()
    }
    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero)
        tableView.register(ListNewsCell.self, forCellReuseIdentifier: ListNewsCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        tableView.separatorStyle = .singleLine
        return tableView
    }
    
}

// MARK: - UITableViewDataSource

extension ListNewsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ListNewsCell.identifier,
            for: indexPath
        ) as? ListNewsCell
        let model = viewModel?.cellViewModel(forIndexPath: indexPath)
        cell?.setupCell(model: model)
        return cell ?? UITableViewCell()
    }
    
}

// MARK: - UITableViewDelegate

extension ListNewsVC: UITableViewDelegate {

    func tableView(_: UITableView, didSelectRowAt: IndexPath) {
        viewModel?.goToScreenFullNews(model: didSelectRowAt)
    }

}
