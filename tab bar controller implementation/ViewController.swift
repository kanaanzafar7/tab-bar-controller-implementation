import UIKit
import Lottie
class ViewController: UIViewController {
    let lottieJsons = ["home", "search", "saved", "more"]
    let selectedImages = ["home-selected","search-selected","saved-selected","more-selected",]
    let deselectedImages = ["home-deselected","search-deselected","saved-deselected","more-deselected",]
    let tabBarVc = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarVc.delegate = self
    }
    
    
    @IBAction func onPressed(_ sender: UIButton) {
        let vc1 = Screen1ViewController();
        let vc2 = Screen2ViewController();
        let vc3 = Screen3ViewController();
        let vc4 = Screen4ViewController();
        //        let vc5 = Screen5ViewController();
        tabBarVc.setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        tabBarVc.modalPresentationStyle = .fullScreen
        if let items  = tabBarVc.tabBar.items {
            for item in items {
                item.image = UIImage(named: deselectedImages[items.firstIndex(of: item)!])
                item.selectedImage = UIImage(named: selectedImages[items.firstIndex(of: item)!])
            }
        }else {
            print("items not found.")
        }
        
        present(tabBarVc, animated: true) {
        }
    }
}

extension ViewController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        //get image of ui tab bar item.
        let item = tabBarController.tabBar.items![tabBarController.selectedIndex]
        
        let itemImageView = item.view?.subviews.filter { uiview in
            uiview is UIImageView
        }.first
        
        let frame = itemImageView?.frame
        let animationView : AnimationView = .init(name: lottieJsons[tabBarController.selectedIndex])
        animationView.frame = frame!
        animationView.loopMode = .playOnce
        animationView.contentScaleFactor = 0.9
        item.view?.addSubview(animationView)
        
        animationView.play { value in
            animationView.isHidden = true
            item.selectedImage = UIImage(named: self.selectedImages[tabBarController.selectedIndex])}
    }
}
