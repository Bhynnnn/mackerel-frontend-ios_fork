//
//  FCMRequest.swift
//  HighSchoolFish
//
//  Created by 강보현 on 1/11/24.
//

import Foundation

// MARK: - SendFCM
struct FCMRequest: Codable {
    let title, body: String
}
