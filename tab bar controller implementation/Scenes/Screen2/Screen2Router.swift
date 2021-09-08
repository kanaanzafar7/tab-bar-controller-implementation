//
//  Screen2Router.swift
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

@objc protocol Screen2RoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol Screen2DataPassing
{
  var dataStore: Screen2DataStore? { get }
}

class Screen2Router: NSObject, Screen2RoutingLogic, Screen2DataPassing
{
  weak var viewController: Screen2ViewController?
  var dataStore: Screen2DataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: Screen2ViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: Screen2DataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
