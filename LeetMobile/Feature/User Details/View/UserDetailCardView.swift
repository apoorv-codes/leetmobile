//
//  UserDetailCardView.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/14/24.
//
import UIKit
import Nuke

class UserDetailCardView: UIView {
    // MARK: Properties
    private let label: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    // MARK: Initializer
    init(name: String, userName: String, location: String, Rank: Int) {
        super.init(frame: .zero)
        let userName = UILabel()
        userName.text = name
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Functions
    private func setupSubViews() {
        
    }
}
