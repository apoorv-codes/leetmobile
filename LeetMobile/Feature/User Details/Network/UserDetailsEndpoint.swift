//
//  UserDetailsEndpoint.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Foundation
import Alamofire

enum UserDetailsEndpoint: GraphQLEndpoint {
    case getUserDetails(username: String)
}

extension UserDetailsEndpoint {
    var query: String {
         """
                query getUserProfile($username: String!) {
                    allQuestionsCount {
                        difficulty
                        count
                    }
                    matchedUser(username: $username) {
                        username
                        githubUrl
                        twitterUrl
                        linkedinUrl
                        contributions {
                            points
                            questionCount
                            testcaseCount
                        }
                        profile {
                            realName
                            userAvatar
                            birthday
                            ranking
                            reputation
                            websites
                            countryName
                            company
                            school
                            skillTags
                            aboutMe
                            starRating
                        }
                        badges {
                            id
                            displayName
                            icon
                            creationDate
                        }
                        upcomingBadges {
                            name
                            icon
                        }
                        activeBadge {
                            id
                            displayName
                            icon
                            creationDate
                        }
                        submitStats {
                            totalSubmissionNum {
                                difficulty
                                count
                                submissions
                            }
                            acSubmissionNum {
                                difficulty
                                count
                                submissions
                            }
                        }
                        submissionCalendar
                    }
                    recentSubmissionList(username: $username, limit: 20) {
                        title
                        titleSlug
                        timestamp
                        statusDisplay
                        lang
                    }
                }
                """
    }
    
    var variables: [String : Any]? {
        var variables = [String: Any]()
        switch self {
        case .getUserDetails(let username):
            variables["username"] = username
        }
        return variables
    }
}
