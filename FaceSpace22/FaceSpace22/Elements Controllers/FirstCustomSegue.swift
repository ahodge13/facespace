//
//  HomeVCTB.swift
//  FaceSpace22
//
//  Created by Jonavon Smith on 5/28/20.
//  Copyright © 2020 FaceSpaceInc. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {

    override func perform() {
            let secondVCView = self.source
            let firstVCView = self.destination

            secondVCView.view.superview?.insertSubview(firstVCView.view, aboveSubview: secondVCView.view)
            firstVCView.view.transform = CGAffineTransform(translationX: -secondVCView.view.frame.size.width, y: 0)

            UIView.animate(withDuration: 0.25,
                                  delay: 0.0,
                                options: .curveEaseInOut,
                             animations: {
                                    firstVCView.view.transform = CGAffineTransform(translationX: 0, y: 0)
                                    },
                            completion: { finished in
                                    secondVCView.present(firstVCView, animated: false, completion: nil)
                                        }
                            )
        }
    }
