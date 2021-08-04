//
//  TableViewAlert.swift
//  PushDemo
//
//  Created by Mac on 30.07.2021.
//

import UIKit

class TableViewAlert {
    
    func showAlert(indexPath: IndexPath,
                   notifications: Notification,
                   notificationService: NotificationService) -> UIAlertController {
        
        
        let notificationType = notifications.getNotifications()[indexPath.row]
        
        let alert = UIAlertController(title: notificationType,
                                      message: "After 5 seconds " + notificationType + " will appear",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
            notificationService.scheduleNotification(notificationType: notificationType)
        }
        
        alert.addAction(okAction)
        return alert
    }

}
