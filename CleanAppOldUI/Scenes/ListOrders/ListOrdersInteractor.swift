//
//  ListOrdersInteractor.swift
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

protocol ListOrdersBusinessLogic
{
    func LoadProducts(request: ListOrders.LoadProducts.Request)
    func DeleteProduct(request: ListOrders.DeleteProduct.Request)
    func AddProduct(request: ListOrders.AddProduct.Request)
}

protocol ListOrdersDataStore
{
    var selectedProduct : Product? { get set }
}

class ListOrdersInteractor: ListOrdersBusinessLogic, ListOrdersDataStore
{
    var selectedProduct: Product?
    
    var presenter: ListOrdersPresentationLogic?
    var worker: ListOrdersWorker = ListOrdersWorker()
    
    // MARK: Do something
    
    
    func LoadProducts(request: ListOrders.LoadProducts.Request)
    {
        worker.LoadProducts { products in
            let response = ListOrders.LoadProducts.Response(products: products)
            self.presenter?.PresentProducts(response: response)
        }
    }
    
    func AddProduct(request: ListOrders.AddProduct.Request)
    {
        worker.AddProduct{ product in
            let response = ListOrders.AddProduct.Response(newProduct: product)
            self.presenter?.PresentAddedProduct(response: response)
        }
    }
    
    func DeleteProduct(request: ListOrders.DeleteProduct.Request)
    {
        worker.DeleteProduct { () in
            let response = ListOrders.DeleteProduct.Response(productIndex: request.productIndex)
            self.presenter?.PresentDeletedProduct(response: response)
        }
    }
}
