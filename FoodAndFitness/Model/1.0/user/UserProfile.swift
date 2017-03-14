//
//  UserProfile.swift
//  CM
//
//  Created by DaoNV on 7/26/16.
//  Copyright © 2016 AsianTech Co., Ltd. All rights reserved.
//

import RealmSwift
import ObjectMapper
import RealmS

enum Gender: Int, CustomStringConvertible {
    case male = 1
    case female = 2
    case others = 3

    var description: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        case .others: return "Others"
        }
    }
}

final class UserProfile: Object, Mappable {
    
    private(set) dynamic var id = 0
    
    dynamic var nickname = ""
    
    private(set) dynamic var genderRaw = Gender.others.rawValue

    var gender: Gender {
        set {
            genderRaw = newValue.rawValue
        }
        get {
            let gender = Gender(rawValue: genderRaw)
            return gender ?? .others
        }
    }

    override class func primaryKey() -> String? {
        return "id"
    }

    convenience required init?(map: Map) {
        self.init()
        id <- map["user_id"]
    }
    
    func mapping(map: Map) {
        genderRaw <- map["gender"]
        nickname <- map["nickname"]
    }
}