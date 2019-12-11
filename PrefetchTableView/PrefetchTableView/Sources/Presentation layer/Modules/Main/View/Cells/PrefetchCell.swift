//
//  PrefetchCell.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

class PrefetchCell: UITableViewCell {
    
    let loadingIndicator: UIActivityIndicatorView = {
        let ac = UIActivityIndicatorView(style: .gray)
        ac.startAnimating()
        ac.translatesAutoresizingMaskIntoConstraints = false
        return ac
    }()
    
    let numberLabel: UILabel = {
        let nl = UILabel()
        nl.translatesAutoresizingMaskIntoConstraints = false
        nl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return nl
    }()
    
    let avatarImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 100
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    static let reuseId = "PrefetchCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Routine
    
    private func addSubviews() {
        addSubview(loadingIndicator)
        addSubview(avatarImageView)
        addSubview(numberLabel)
    }
    
    private func addConstraints() {
        // Activity indicator
        loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // Number label
        numberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // Avatar image
        avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    // MARK: - Update image -
    
    func updateAppearanceFor(_ image: UIImage?) {
        DispatchQueue.main.async { [unowned self] in
            self.displayImage(image)
        }
    }
    
    private func displayImage(_ image: UIImage?) {
        if let image = image {
            avatarImageView.image = image
            loadingIndicator.stopAnimating()
        } else {
            loadingIndicator.startAnimating()
            avatarImageView.image = .none
        }
    }
    
}
