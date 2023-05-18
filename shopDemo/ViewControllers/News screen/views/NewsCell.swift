//
//  NewsCell.swift
//  shopDemo
//
//  Created by Павел on 17.05.23.
//

import UIKit

final class NewsCell: UITableViewCell {
    
    private lazy var image = UIImageView()
    private lazy var decription = UILabel()
        .decorated(with: .font(.sf(.body([.semibold]))))
        .decorated(with: .alignment(.left))
        .decorated(with: .multiline)
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions

    func setupCell(model: NewsViewModel.Model) {
        makeLayout(model: model)
    }
    
}

private extension NewsCell {
    
    func setupCell() {
        selectionStyle = .none
    }
    
    func makeLayout(model: NewsViewModel.Model) {
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
        guard let urlImg = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlImg) { data, _, _ in
            let queue = DispatchQueue.global(qos: .utility)
            queue.async {
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image.decorated(with: .image(image))
                    }
                }
            }
        }.resume()
    }
    
}

