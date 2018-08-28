//
//  ClearState.swift
//  MirrorPad
//
//  Created by Christopher Lee on 28/8/18.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import UIKit

public class ClearState: DrawViewState {
    public override func clear() {
        drawView.lines = []
        drawView.layer.sublayers?.removeAll()
        transitionToState(matching: AcceptInputState.identifier)
    }
}
