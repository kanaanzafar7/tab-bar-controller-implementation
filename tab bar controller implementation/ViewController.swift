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
                //                ite
                item.image = UIImage(named: deselectedImages[items.firstIndex(of: item)!])
//                item.selectedImage = UIImage(named: selectedImages[items.firstIndex(of: item)!])
            }
        }else {
            print("items not found.")
        }
        
        present(tabBarVc, animated: true) {
        }
    }
    func frameForTab(atIndex index: Int) -> CGRect {
        var frames = tabBarVc.tabBar.subviews.compactMap { (view:UIView) -> CGRect? in
            if let view = view as? UIControl {
               return view.frame
            }
            return nil
        }
        frames.sort { $0.origin.x < $1.origin.x }
        if frames.count > index {
            return frames[index]
        }
        return frames.last ?? CGRect.zero
    }
    
}

extension ViewController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let item = tabBarController.tabBar.items![tabBarController.selectedIndex]
//        item.image = deselectedImages[]
//        item.selectedImage = nil
        let frame = frameForTab(atIndex: tabBarController.selectedIndex);
        let animationView : AnimationView = .init(name: lottieJsons[tabBarController.selectedIndex])
        animationView.frame = frame//CGRect(x: 0, y: 0, width: 300, height: 300)//view.bounds
//        animationView.center =
        animationView.loopMode = .playOnce
//        animationView.animationSpeed = 0.5
        animationView.contentScaleFactor = 0.9
        tabBarController.tabBar.addSubview(animationView)
//        animationView.play()
        
        animationView.play { value in
            animationView.isHidden = true
            item.selectedImage = UIImage(named: self.selectedImages[tabBarController.selectedIndex])}
    }
}
