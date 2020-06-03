//
//  Utilities.swift
//  FaceSpace22
//
//  Created by Jonavon Smith on 5/26/20.
//  Copyright © 2020 FaceSpaceInc. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func isPasswordValid(_ password : String) -> Bool{
          
          let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
          return passwordTest.evaluate(with: password)
}

}
