import UIKit
import Lottie
class Home: UITabBarController {
    
    let lottieJsons = ["home", "search", "saved", "more"]
    let selectedImages = ["home-selected","search-selected","saved-selected","more-selected"]
    let deselectedImages = ["home-deselected","search-deselected","saved-deselected","more-deselected"]
    var animationViews : [AnimationView?] = []
    var currentIndex = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("-----+++++viewDidLayoutSubviews")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       print("-----+++++viewWillLayoutSubviews")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("-----+++++viewWillAppear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("-----+++++viewDidLoad")
        self.delegate = self
        setupTabbar()
//        self.tabBar.isHidden = true
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        populateNavigationBarItemsWithViews()
        
    }
    func setupTabbar(){
        let vc1 = Screen1ViewController()
        let vc2 = Screen2ViewController()
        let vc3 = Screen3ViewController()
        let vc4 = Screen4ViewController()
        self.setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        self.modalPresentationStyle = .fullScreen
        if let items  = self.tabBar.items {
            for item in items {
                item.image = UIImage(named: deselectedImages[items.firstIndex(of: item)!])
            }
        } else {
            print("items not found.")
        }
    }
    func populateNavigationBarItemsWithViews(){
        let itemsLength = self.tabBar.items?.count
        
        if let count = itemsLength {
            for i in 0...count - 1 {
                let item = self.tabBar.items![i]
                let itemImageView = item.view?.subviews.filter { uiview in
                    uiview is UIImageView
                }.first
                let frame = itemImageView?.frame
                let animationView : AnimationView = .init(name: lottieJsons[i])
                animationView.frame = frame!
                animationView.loopMode = .playOnce
                animationView.isUserInteractionEnabled = true
                animationView.tag = i
                let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onSelect(_:)))
                animationView.addGestureRecognizer(gestureRecognizer)
                animationViews.append(animationView)
                item.image = UIImage()
                item.selectedImage = UIImage()
                item.view?.addSubview(animationViews[i]!)
            }
        }
        animationViews[currentIndex]?.play(completion: { value in
//            self.tabBar.isHidden = false
        })
    }
    @objc func onSelect(_ sender : UITapGestureRecognizer){
        if let tag  = sender.view?.tag {
            self.onItemChanged(index: tag)
        }
   
    }
    
    func onItemChanged(index : Int){
        if currentIndex == index {
            return
        }
//        self.selectedViewController =
        let endFrame = animationViews[currentIndex]?.animation?.endFrame
        
        animationViews[currentIndex]?.play(fromFrame: endFrame, toFrame: 1.0, loopMode: .playOnce, completion: { value in
            
        })
        animationViews[index]?.play(completion: { value in
            self.currentIndex = index
        })
        
    }
}

extension Home : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        onItemChanged(index: tabBarController.selectedIndex)
    }
    
    
}
