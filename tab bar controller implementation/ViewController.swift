import UIKit
import Lottie
class ViewController: UIViewController {
    let lottieJsons = ["home", "search", "saved", "more"]
    let selectedImages = ["home-selected","search-selected","saved-selected","more-selected",]
    let deselectedImages = ["home-deselected","search-deselected","saved-deselected","more-deselected",]
    let tabBarVc = UITabBarController()
    var currentIndex = 0
    var lastFrameTimes : [AnimationFrameTime?] = [nil,nil,nil,nil]
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarVc.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func onPressed(_ sender: UIButton) {
        let vc1 = Screen1ViewController();
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
        
        present(tabBarVc, animated: true) {
        }
    }
}

extension ViewController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.selectedIndex
        
        if lastFrameTimes[currentIndex] != nil {
            let item = tabBarController.tabBar.items![currentIndex]
            viewDidLayoutSubviews()
            let itemImageView = item.view?.subviews.filter { uiview in
                uiview is UIImageView
            }.first
            let frame = itemImageView?.frame
            let animationView : AnimationView = .init(name: lottieJsons[currentIndex])
            animationView.frame = frame!
            item.view?.addSubview(animationView)
            animationView.play(fromFrame: lastFrameTimes[currentIndex], toFrame: 1.0, loopMode: .playOnce) { value in
            }
        }
        
        
        let item = tabBarController.tabBar.items![selectedIndex]
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
            self.lastFrameTimes[selectedIndex] = animationView.currentFrame
            animationView.removeFromSuperview()
            item.selectedImage = UIImage(named: self.selectedImages[selectedIndex])
            if(self.currentIndex != selectedIndex){
                tabBarController.tabBar.items![self.currentIndex].selectedImage = UIImage(named: self.deselectedImages[self.currentIndex])
            }
            self.currentIndex = selectedIndex
        }
    }
}
