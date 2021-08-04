//
//  TableViewModel.swift
//  PushDemo
//
//  Created by Mac on 29.07.2021.
//

import Foundation

class TableViewModel {
    
    var tableviewDelegate: TableViewModelDelegate?
    
    lazy var notification = Notification.shared
    lazy var notificationService = NotificationService.shared
    lazy var alert = TableViewAlert()
    
    func numberOfRows() -> Int {
        notification.getNotifications().count
    }
    
    func getCell(at indexPath: IndexPath) -> String {
        let notification = notification.getNotifications()[indexPath.row]
        return notification
    }
    
    func didTapOnCell(at indexPath: IndexPath) {
        let alert = alert.showAlert(indexPath: indexPath,
                                    notifications: notification,
                                    notificationService: notificationService)
        tableviewDelegate?.showNotificationAlert(alert: alert)
    }

}
