//
//  Model.swift
//  RxSwift+MVVM
//
//  Created by Bernard Hur on 25/03/2019.
//  Copyright © 2019 Bernard Hur. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Model {
    let number = BehaviorRelay<Int>(value: 50)
}
