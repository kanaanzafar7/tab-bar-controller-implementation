//
//  Screen2ViewController.swift
//  tab bar controller implementation
//
//  Created by Kanaan Zafar on 07/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol Screen2DisplayLogic: class
{
  func displaySomething(viewModel: Screen2.Something.ViewModel)
}

class Screen2ViewController: UIViewController, Screen2DisplayLogic
{
  var interactor: Screen2BusinessLogic?
  var router: (NSObjectProtocol & Screen2RoutingLogic & Screen2DataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = Screen2Interactor()
    let presenter = Screen2Presenter()
    let router = Screen2Router()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    view.backgroundColor = .white
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Screen2.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Screen2.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
