//
//  NewsCell.swift
//  shopDemo
//
//  Created by Павел on 17.05.23.
//

import UIKit

final class NewsCell: UITableViewCell {
    
    // MARK: External dependencies
    
    private var servise: NewsServiceProtocol
    
    private lazy var image = UIImageView()
    private lazy var decription = UILabel()
        .decorated(with: .font(.sf(.body([.semibold]))))
        .decorated(with: .alignment(.left))
        .decorated(with: .multiline)
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.servise = NewsService.shared
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions

    func setupCell(model: NewsViewModel.Model?) {
        makeLayout(model: model)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        image.decorate(with: .backgroundColor(.gray))
    }
    
}

private extension NewsCell {
    
    func setupCell() {
        selectionStyle = .none
    }
    
    func makeLayout(model: NewsViewModel.Model?) {
        guard let model else { return }
        
        switch model {
        case .image(let url):
            fetchImage(url: url)
            setupimageView()
        case .decription(let text):
            decription.decorate(with: .text(text))
            setupDescription()
        }
    }
    
    func setupDescription() {
        addSubview(decription)
        decription.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(LayoutConstants.insert5)
        }
    }
    
    func setupimageView() {
        addSubview(image)
        image.snp.makeConstraints {
            $0.height.equalTo(LayoutConstants.height200)
            $0.top.bottom.width.equalToSuperview()
        }
    }
    
    func fetchImage(url: String) {
        servise.fetchImage(url: url) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.image.decorated(with: .image(image))
                }
            case .failure:
                self?.image.decorate(with: .backgroundColor(.gray))
            }
        }
    }
    
}

