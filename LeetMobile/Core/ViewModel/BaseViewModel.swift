//
//  BaseViewModel.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 1/10/25.
//

import UIKit

class BaseViewModel: NSObject {
    enum LoadingState {
        case loading
        case loaded
        case error
    }
    
    private var loadingState: LoadingState = .loaded
    
    func setLoadingState(_ state: LoadingState) {
        loadingState = state
    }
}
