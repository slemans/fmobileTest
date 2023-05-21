//
//  NewCell.swift
//  shopDemo
//
//  Created by Павел on 16.05.23.
//

import UIKit

final class ListNewsCell: UITableViewCell {
    
    // MARK: External dependencies
    
    private let serviсe: NewsServiceProtocol
    
    private let titleLabel = UILabel()
        .decorated(with: .font(.sf(.body([.semibold]))))
        .decorated(with: .alignment(.left))
        .decorated(with: .multiline)
    private let imageNewsView = UIImageView()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.serviсe = NewsService.shared
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions

    func setupCell(model: ListNewsViewModel.Model?) {
        guard let model else { return }
        
        titleLabel.decorated(with: .text(model.name))
        fetchImage(url: model.image)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageNewsView.image = nil
        imageNewsView.decorate(with: .backgroundColor(.gray))
    }
    
}

// MARK: - Private functions

private extension ListNewsCell {
    
    func setupLayout() {
        addSubview(imageNewsView)
        imageNewsView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(LayoutConstants.offset5)
            $0.width.height.equalTo(LayoutConstants.height40)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(imageNewsView)
            $0.leading.equalTo(imageNewsView.snp.trailing).offset(LayoutConstants.offset10)
            $0.trailing.equalToSuperview()
        }
    }
    
    func fetchImage(url: String) {
        serviсe.fetchImage(url: url) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imageNewsView.decorated(with: .image(image))
                }
            case .failure:
                self?.imageNewsView.decorate(with: .backgroundColor(.gray))
            }
        }
    }
    
}
