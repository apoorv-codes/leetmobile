//
//  UserDetailModel.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//
import Foundation


// MARK: - UserProfileModel
struct UserProfileModel: Decodable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Decodable {
    let allQuestionsCount: [AllQuestionsCount]?
    let matchedUser: MatchedUser?
    let recentSubmissionList: [RecentSubmissionList]?
}

// MARK: - AllQuestionsCount
struct AllQuestionsCount: Codable {
    let difficulty: String?
    let count: Int?
}

// MARK: - MatchedUser
struct MatchedUser: Decodable {
    let username: String?
    let githubURL: String?
    let twitterURL: String?
    let linkedinURL: String?
    let contributions: Contributions?
    let profile: Profile?
    let badges: [Badge]?
    let upcomingBadges: [Badge]?
    let activeBadge: Badge?
    let submitStats: SubmitStats?
    let submissionCalendar: String?

    enum CodingKeys: String, CodingKey {
        case username
        case githubURL = "githubUrl"
        case twitterURL = "twitterUrl"
        case linkedinURL = "linkedinUrl"
        case contributions, profile, badges, upcomingBadges, activeBadge, submitStats, submissionCalendar
    }
}

// MARK: - Contributions
struct Contributions: Decodable {
    let points, questionCount, testcaseCount: Int?
}

// MARK: - Profile
struct Profile: Decodable {
    let realName: String?
    let userAvatar: String?
    let birthday: String?
    let ranking, reputation: Int?
    let websites: [String]?
    let countryName, company, school: String?
    let skillTags: [String]?
    let aboutMe: String?
    let starRating: Double?
}

// MARK: - SubmitStats
struct SubmitStats: Decodable {
    let totalSubmissionNum, acSubmissionNum: [SubmissionNum]?
}

// MARK: - SubmissionNum
struct SubmissionNum: Decodable {
    let difficulty: String?
    let count, submissions: Int?
}

// MARK: - UpcomingBadge
struct Badge: Decodable {
    let name, icon: String?
}

// MARK: - RecentSubmissionList
struct RecentSubmissionList: Decodable {
    let title, titleSlug, timestamp: String?
    let statusDisplay: StatusDisplay?
    let lang: Lang?
}

enum Lang: String, Decodable {
    case swift = "swift"
}

enum StatusDisplay: String, Decodable {
    case accepted = "Accepted"
    case runtimeError = "Runtime Error"
    case wrongAnswer = "Wrong Answer"
}
