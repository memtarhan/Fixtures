//
//  HomePresenter.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

protocol HomePresenter: AnyObject {
    var view: HomeViewController? { get set }
    var interactor: HomeInteractor? { get set }
    
    func present()
}

class HomePresenterImpl: HomePresenter {
    weak var view: HomeViewController?
    weak var interactor: HomeInteractor?
    
    func present() {
        print(#function)
        interactor?.retrieve({ result in
            
        })
    }
}
