//
//  AppDelegate+Injection.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Resolver
import Alamofire
import Foundation

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerCommonServices()
        registerUserDetailServices()
    }
    
    private static func registerCommonServices() {
        register {
            createSessionManager()
        }.scope(.cached)
        
        register {
            NetworkManager(session: resolve())
        }
        .implements(NetworkManagerProtocol.self)
        .scope(.cached)
        
    }
    
    private static func registerUserDetailServices() {
        register {
            UserDetailsViewModel(repository: resolve())
        }
        .implements(UserDetailsViewController.Interactor.self)

        register {
            UserDetailDefaultRepository(remoteRepository: resolve())
        }
        .implements(UserDetailRepositoryProtocol.self)
        
        register {
            UserDetailRemoteRepository(networkManager: resolve())
        }
        .implements(UserDetailRemoteRepositoryProtocol.self)
    }
    
    private static func registerTabViewServices() {
        register {
            TabViewModel()
        }
        .implements(TabViewController.Interactor.self)
    }
    
    private static func createSessionManager() -> Session {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        return Session(configuration: configuration)
    }
}
