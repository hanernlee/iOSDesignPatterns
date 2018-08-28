//
//  CopyState.swift
//  MirrorPad
//
//  Created by Christopher Lee on 28/8/18.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import UIKit

public class CopyState: DrawViewState {
    public override func copyLines(from source: DrawView) {
        drawView.layer.sublayers?.removeAll()
        drawView.lines = source.lines.deepCopy()
        drawView.lines.forEach { drawView.layer.addSublayer($0) }
        transitionToState(matching: AcceptInputState.identifier)
    }
}
