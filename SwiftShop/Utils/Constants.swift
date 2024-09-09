//
//  Constants.swift
//  GroupManager
//
//  Created by Jinu on 28/08/2024.
//

import Foundation

struct Constants {
    
    struct Urls {
        static let baseURL = "https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo"

    }
    
}


enum ApiEndPoints  {
    case listing
    case groupInfo
   
}

extension ApiEndPoints {
    var path: String {
        switch self {
        case .listing:
            return "/huddles/podium_dummy"
        case .groupInfo:
            return "/huddles/podium_dummy"
        
        }
    }
}
