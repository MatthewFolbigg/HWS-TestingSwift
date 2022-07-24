import Foundation

//Excerpt From
//Hacking with Swift - Testing Swift
//by Paul Hudson
struct User {
    static let upgradedNotification = Notification.Name("UserUpgraded")
    
    func upgrade(using center: NotificationCenter = NotificationCenter.default) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: User.upgradedNotification, object: nil)
        }
    }
}

