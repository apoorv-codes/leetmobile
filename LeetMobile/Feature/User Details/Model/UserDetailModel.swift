//
//  UserDetailModel.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//
import Foundation

struct UsersDataModel: Decodable {
    var username, name, birthday: String?
    var avatar: String?
    var ranking, reputation: Int?
    var gitHub: String?
    var twitter: String?
    var linkedIN: String?
    var website: [String]?
    var country, company, school: String?
    var skillTags: [String]?
    var about: String?
}
