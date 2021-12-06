//
//  LocalNotificationsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Frank Bara on 12/3/21.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager() // singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "Alert notification"
        content.subtitle = "alert subtitle"
        content.sound = .defaultCritical
        content.badge = 1
        
        // Time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // Calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 11
        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Location
        let coord = CLLocationCoordinate2D(latitude: 37.33233, longitude: 122.03122)
        let region = CLCircularRegion(center: coord,
                                      radius: 50,
                                      identifier: UUID().uuidString)
        region.notifyOnExit = false
        region.notifyOnEntry = true
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
    }
}

struct LocalNotificationsBootcamp: View {
    
    
    var body: some View {
        
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notification") {
                NotificationManager.instance.scheduleNotifications()
            }
            Button("Cancel notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationsBootcamp()
    }
}
