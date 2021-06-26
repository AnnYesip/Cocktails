//
//  AppDelegateExtension.swift
//  Cocktails
//
//  Created by Ann Yesip on 17.06.2021.
//

import UIKit
import UserNotifications

extension AppDelegate: UNUserNotificationCenterDelegate {
  
  func sendNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Time to rest"
    content.body = "What about cocktail?🍸😉"
    content.sound = UNNotificationSound.default
    let triget = UNTimeIntervalNotificationTrigger(timeInterval: 10 , repeats: false )
    let request = UNNotificationRequest(identifier: "notification", content: content, trigger: triget)
    notificationCenter.add(request) { error in
      print(error?.localizedDescription as Any)
    }
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.banner, .sound])
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
  }
}
