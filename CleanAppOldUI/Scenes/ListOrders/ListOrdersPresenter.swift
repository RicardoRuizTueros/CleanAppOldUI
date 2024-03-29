//
//  ListOrdersPresenter.swift
//  CleanAppOldUI
//
//  Created by Ricardo Ruiz on 10/10/2019.
//  Copyright (c) 2019 Ricardo Ruiz. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListOrdersPresentationLogic
{
    func PresentProducts(response: ListOrders.LoadProducts.Response)
    func PresentDeletedProduct(response: ListOrders.DeleteProduct.Response)
    func PresentAddedProduct(response: ListOrders.AddProduct.Response)
}

class ListOrdersPresenter: ListOrdersPresentationLogic
{
    weak var viewController: ListOrdersDisplayLogic?
    
    // MARK: Do something
    
    func PresentProducts(response: ListOrders.LoadProducts.Response)
    {
        let viewModel = ListOrders.LoadProducts.ViewModel(products: response.products)
        viewController?.DisplayProducts(viewModel: viewModel)
    }
    
    func PresentDeletedProduct(response: ListOrders.DeleteProduct.Response) {
        let viewModel = ListOrders.DeleteProduct.ViewModel(productIndex: response.productIndex)
        viewController?.DisplayDeletedProduct(viewModel: viewModel)
    }
    
    func PresentAddedProduct(response: ListOrders.AddProduct.Response) {
        let viewModel = ListOrders.AddProduct.ViewModel(newProduct: response.newProduct)
        viewController?.DisplayNewProduct(viewModel: viewModel)
    }
}
