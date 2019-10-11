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
        
        backgroundColor = UIColor.red

        productNameLabel.text = productName
        productImage.image = UIImage(systemName: "house")

        productImage.backgroundColor = UIColor.green
        productNameLabel.backgroundColor = UIColor.blue
        
        addSubview(productImage)
        addSubview(productNameLabel)
        
        NSLayoutConstraint.activate([
            // Try out with constraints
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
