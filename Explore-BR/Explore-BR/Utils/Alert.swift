import Foundation

import Foundation
import UIKit

class Alert: NSObject {
    
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showAlert(title: String, message: String, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { action in
            completion?()
        }
        
        alertController.addAction(action)
        
        self.viewController.present(alertController, animated: true, completion: completion)
    }
    
}
