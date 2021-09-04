//
//  ViewController.swift
//  NofiricationAndFocusModeInIOS15
//
//  Created by ramil on 04.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { _, _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.scheduleNotification()
            }
        }
    }

    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "From SwiftUI"
        content.body = "New Notification in iOS 15"
        content.interruptionLevel = UNNotificationInterruptionLevel.active
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "iOS15", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error)
            } else {
                print("Success")
            }
        }
    }
}

