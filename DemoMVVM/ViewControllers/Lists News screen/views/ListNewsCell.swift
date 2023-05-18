//
//  NewCell.swift
//  shopDemo
//
//  Created by Павел on 16.05.23.
//

import UIKit

final class ListNewsCell: UITableViewCell {
    
    private let titleLabel = UILabel()
        .decorated(with: .font(.sf(.body([.semibold]))))
        .decorated(with: .alignment(.left))
        .decorated(with: .multiline)
    private let imageNewsView = UIImageView()
        .decorated(with: .backgroundColor(.gray))
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions

    func setupCell(model: ListNewsViewModel.Model) {
        titleLabel.decorated(with: .text(model.name))
        fetchImage(url: model.image)
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
        guard let urlImg = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlImg) { data, _, _ in
            let queue = DispatchQueue.global(qos: .utility)
            queue.async {
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageNewsView.decorated(with: .image(image))
                    }
                }
            }
        }.resume()
    }
    
}
