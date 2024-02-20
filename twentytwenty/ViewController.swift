import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    // Image
    
    @IBOutlet weak var eyeImage: UIImageView!
    
    @IBAction func toggleButton(_ sender: Any) {
        if(eyeImage.tintColor == UIColor.systemRed) { // Button Enable
            eyeImage.tintColor = UIColor.systemBlue
            let content = UNMutableNotificationContent()
            content.title = "twentytwenty"
            content.subtitle = "have a break, have a kitkat"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1200, repeats: true)

            let request = UNNotificationRequest(identifier: "twenty", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
        }
        else {
            eyeImage.tintColor = UIColor.systemRed
            UNUserNotificationCenter.current().getPendingNotificationRequests { (reqs) in
               var ids =  [String]()
               reqs.forEach {
                   if $0.identifier == "twenty" {
                      ids.append($0.identifier)
                   }
               }
               UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers:ids)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let content = UNMutableNotificationContent()
        content.title = "twentytwenty"
        content.subtitle = "have a break, have a kitkat"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1200, repeats: true)

        let request = UNNotificationRequest(identifier: "twenty", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}

