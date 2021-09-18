//
//  HomeInteractor.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

protocol HomeInteractor: AnyObject {
    func retrieve(_ completionHandler: (Result<Any, Error>) -> Void)
}

class HomeInteractorImpl: HomeInteractor {
    func retrieve(_ completionHandler: (Result<Any, Error>) -> Void) {
        print(#function)
    }
}
