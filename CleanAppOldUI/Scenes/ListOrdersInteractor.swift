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
}

protocol ListOrdersDataStore
{
    var products : [Product] { get set }
}

class ListOrdersInteractor: ListOrdersBusinessLogic, ListOrdersDataStore
{
    var products: [Product] = []
    
    var presenter: ListOrdersPresentationLogic?
    var worker: ListOrdersWorker?
    
    // MARK: Do something
    
    func LoadProducts(request: ListOrders.LoadProducts.Request)
    {
        worker = ListOrdersWorker()
        worker?.LoadProducts { products in
            self.products = products
         
            let response = ListOrders.LoadProducts.Response(products: products)
            self.presenter?.PresentProducts(response: response)
        }
    }
}