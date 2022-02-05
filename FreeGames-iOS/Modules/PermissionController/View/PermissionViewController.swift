//
//  PermissionViewController.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 4/2/22.
//

import UIKit
import UserNotifications

class PermissionViewController: UIViewController, PermissionViewContract {
    
    @IBOutlet weak var changeNotificationPermissionButton: UIButton! { didSet { changeNotificationPermissionButton.isEnabled = false; changeNotificationPermissionButton.setTitle("notification_change_permissions".localized, for: .normal) }}
    @IBOutlet weak var notificationButton: UIButton! { didSet { notificationButton.setTitle("notification_title_button".localized, for: .normal)}}
    @IBOutlet weak var notificationTitleLabel: UILabel! { didSet { notificationTitleLabel.text = "notification_title_label".localized }}
    @IBOutlet weak var notificationLabel: UILabel! { didSet { notificationLabel.text = "notification_wait_permission_label".localized }}
    @IBOutlet weak var messageNotificationLabel: UILabel! { didSet { messageNotificationLabel.text = "notification_information_label".localized; messageNotificationLabel.isHidden = true}}
    
    var presenter: PermissionPresenterContract?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setPushNotification(_ sender: Any) {
        presenter?.pushNotificationLocal()
        presenter?.didUpdatePermission()
    }
    
    @IBAction func changePermissionNotification(_ sender: Any) {
        presenter?.didUpdatePermission()
        presenter?.didPressPermissionButton()
    }
    
    func isNotificationOK() {
        DispatchQueue.main.async {
            self.notificationButton.isEnabled = true
            self.changeNotificationPermissionButton.isEnabled = false
            self.notificationLabel.text = "notification_ok_permission_label".localized
            self.notificationLabel.textColor = UIColor.green
        }
    }
    
    func isNotificationNotAllowed() {
        DispatchQueue.main.async {
            self.notificationButton.isEnabled = false
            self.changeNotificationPermissionButton.isEnabled = true
            self.notificationLabel.text = "notification_not_allowed_permission_label".localized
            self.notificationLabel.textColor = UIColor.red
            self.messageNotificationLabel.isHidden = true
        }
    }
    
    func showMessageAllowed() {
        self.messageNotificationLabel.isHidden = false
    }
    
    func openSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
    }
}
