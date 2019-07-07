//
//  LoginViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyUserDefaults

class LoginViewController: UIViewController {
  
  /// instantiate
  internal static func instantiate() -> LoginViewController {
    return Storyboard.Login.instantiate(type: LoginViewController.self)
  }
  
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  
  let disposeBag = DisposeBag()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    bindingRx()
  }
  func setupUI() {
    loginButton.setStyle(.login)
  }
  
  func bindingRx() {
    loginButton.rx.tap.subscribe(onNext: { (_) in
      Defaults[.isLogin] = true
      UIAppDelegate.setupRootViewController()
    }).disposed(by: disposeBag)
  }
}
