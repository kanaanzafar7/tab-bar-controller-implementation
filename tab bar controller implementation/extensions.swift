import UIKit
public extension UITabBarItem {

    var view: UIView? {
        guard let view = self.value(forKey: "view") as? UIView else {
         
            return nil
        }
     return view
    }

}
