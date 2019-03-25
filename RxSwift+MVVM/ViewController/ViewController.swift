//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by Bernard Hur on 25/03/2019.
//  Copyright © 2019 Bernard Hur. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // Variables
    var viewModel: ViewModel!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        rxInit()
        
    }
    
    func rxInit() {
        viewModel.number
            .map { "\($0)" }
            .bind(to: label.rx.text)
            .disposed(by: bag)
        
        button.rx.tap
            .bind(to: viewModel.didTapReplay)
            .disposed(by: bag)
    }
}

