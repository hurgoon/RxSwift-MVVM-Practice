//
//  ViewModel.swift
//  RxSwift+MVVM
//
//  Created by Bernard Hur on 25/03/2019.
//  Copyright © 2019 Bernard Hur. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    let model: Model!
    let bag = DisposeBag()
    
    // Output
    let number: Observable<Int>
    
    // Input
    let didTapReplay = PublishRelay<Void>()
    
    init() { // Model에서 발생한 notification을 ViewModel init에서 처리함
        model = Model()
        self.number = model.number.asObservable()
        
        didTapReplay
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.model.number.accept(self.model.number.value + 1)
            }).disposed(by: bag)
    }
}
