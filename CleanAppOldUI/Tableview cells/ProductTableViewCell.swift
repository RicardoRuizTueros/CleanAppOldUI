//
//  ProductTableViewCell.swift
//  CleanAppOldUI
//
//  Created by Ricardo Ruiz on 11/10/2019.
//  Copyright © 2019 Ricardo Ruiz. All rights reserved.
//

import Foundation
import UIKit

class ProductTableViewCell : UITableViewCell
{
    var productNameLabel : UILabel = UILabel()
    var productImage : UIImageView = UIImageView()
    
    convenience init(productName : String)
    {
        self.init(style: .default, reuseIdentifier: "ProductTableViewCell")
                
        productNameLabel.text = productName
        productImage.image = UIImage(systemName: "house")
        
        addSubview(productImage)
        addSubview(productNameLabel)
        
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productImage.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productImage.topAnchor.constraint(equalTo: topAnchor),
            productImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            productImage.widthAnchor.constraint(equalTo: heightAnchor),
            
            productNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
