import UIKit
import Lottie
class ViewController: UIViewController {
    let lottieJsons = ["home", "search", "saved", "more"]
    let selectedImages = ["home-selected","search-selected","saved-selected","more-selected",]
    let deselectedImages = ["home-deselected","search-deselected","saved-deselected","more-deselected",]
    let tabBarVc = UITabBarController()
    var currentSelectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarVc.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func onPressed(_ sender: UIButton) {
   /*     let vc1 = Screen1ViewController();
        let vc2 = Screen2ViewController();
        let vc3 = Screen3ViewController();
        let vc4 = Screen4ViewController();
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
        populateNavigationBarItemsWithViews()
    */
        present(Home(), animated: true) {
            
        }
//        present(tabBarVc, animated: true) {
//        }
    }
    func populateNavigationBarItemsWithViews(){
        let itemsLength = tabBarVc.tabBar.items?.count
        
        if let count = itemsLength {
            for i in 0...count - 1 {
                let item = tabBarVc.tabBar.items![i]
                let itemImageView = item.view?.subviews.filter { uiview in
                 uiview is UIImageView
                }.first
                let frame = itemImageView?.frame
                let animationView : AnimationView = .init(name: lottieJsons[i])
                animationView.frame = frame!
                animationView.loopMode = .loop
                
                item.view?.addSubview(animationView)
                animationView.play()
                
               
            }
            
        }
        
        
        
    }
    
}


extension ViewController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        let item = tabBarController.tabBar.items![tabBarController.selectedIndex]
        viewDidLayoutSubviews()
        let itemImageView = item.view?.subviews.filter { uiview in
            uiview is UIImageView
        }.first
        
        let frame = itemImageView?.frame
        let animationView : AnimationView = .init(name: lottieJsons[tabBarController.selectedIndex])
        animationView.frame = frame!
        animationView.loopMode = .playOnce
        item.view?.addSubview(animationView)
        animationView.play { value in
            
            animationView.removeFromSuperview()
            item.selectedImage = UIImage(named: self.selectedImages[tabBarController.selectedIndex])
            if(self.currentSelectedIndex != tabBarController.selectedIndex){
                tabBarController.tabBar.items![self.currentSelectedIndex].selectedImage = UIImage(named: self.deselectedImages[self.currentSelectedIndex])
            }
            self.currentSelectedIndex = tabBarController.selectedIndex
        }
    }
}
