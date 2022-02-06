//
//  PermissionPresenter.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 4/2/22.
//

import Foundation
import UserNotifications

class PermissionPresenter: PermissionPresenterContract {
    var interactor: PermissionInteractorContract?
    weak var view: PermissionViewContract?
    
    private let userNotification: UNUserNotificationCenter
    init(userNotification: UNUserNotificationCenter = UNUserNotificationCenter.current()) {
        self.userNotification = userNotification
    }
    
    func pushNotificationLocal() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                self.view?.isNotificationOK()
            }
        }
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "push_notification_title".localized
        content.body = "push_notification_body".localized
        content.sound = .default
        
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { error in
            if error != nil { print("Error: \(error?.localizedDescription ?? "error local notification")")}
        }
        view?.showMessageAllowed()
    }
    
    func didUpdatePermission() {
        userNotification.getNotificationSettings(completionHandler: { settings in
            switch settings.authorizationStatus {
            case .authorized: self.view?.isNotificationOK()
            case .denied, .notDetermined: self.view?.isNotificationNotAllowed()
            case .provisional, .ephemeral: break
            @unknown default: break
            }
        })
    }
    
    func didPressPermissionButton() {
        userNotification.getNotificationSettings(completionHandler: { settings in
            switch settings.authorizationStatus {
            case .authorized: break
            case .denied: self.view?.openSettings()
            case .notDetermined: break
            case .provisional, .ephemeral: break
            @unknown default: break
            }
        })
    }
}
