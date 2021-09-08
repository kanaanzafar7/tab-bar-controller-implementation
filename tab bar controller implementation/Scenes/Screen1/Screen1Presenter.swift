//
//  Screen1Presenter.swift
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

protocol Screen1PresentationLogic
{
  func presentSomething(response: Screen1.Something.Response)
}

class Screen1Presenter: Screen1PresentationLogic
{
  weak var viewController: Screen1DisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Screen1.Something.Response)
  {
    let viewModel = Screen1.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
