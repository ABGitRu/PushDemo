//
//  Notification.swift
//  PushDemo
//
//  Created by Mac on 29.07.2021.
//

import Foundation

class Notification {
    static let shared = Notification()
    
    private var notifications: [String] = []
    
    private init() {}
    
    func getNotifications() -> [String] {
         notifications = ["Local Notification",
                                "Local Notification with Action",
                                "Local Notification with Content"]
        return notifications
    }
}

