//
//  UIViewExtensionsSpec.swift
//  MultiProgressView_Tests
//
//  Created by Mac Gallagher on 2/22/19.
//  Copyright © 2019 Mac Gallagher. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import MultiProgressView

class UIViewExtensionsSpec: QuickSpec {
    override func spec() {
        let width: CGFloat = 15
        let height: CGFloat = 20
        let padding: CGFloat = 10
        
        var superview: UIView!
        var subject: UIView!
        
        beforeEach {
            subject = UIView()
            superview = UIView()
            superview.addSubview(subject)
        }
        
        fdescribe("anchor") {
            
            context("when calling the anchor function on a view") {
                var topConstraint: NSLayoutConstraint!
                var rightConstraint: NSLayoutConstraint!
                var leftConstraint: NSLayoutConstraint!
                var bottomConstraint: NSLayoutConstraint!
                
                var expectedConstraints: [NSLayoutConstraint]!
                var actualConstraints: [NSLayoutConstraint]!
                
                beforeEach {
                    topConstraint = subject.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding)
                    rightConstraint = subject.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -padding)
                    leftConstraint = subject.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: padding)
                    bottomConstraint = subject.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding)
                    
                    expectedConstraints = [
                        topConstraint,
                        rightConstraint,
                        leftConstraint,
                        bottomConstraint
                    ]
                    
                    actualConstraints = subject.anchor(top: superview.topAnchor, left: superview.leftAnchor, bottom: superview.bottomAnchor, right: superview.rightAnchor, paddingTop: 0, paddingLeft: padding, paddingBottom: padding, paddingRight: 0, width: 0, height: 0)
                }
                
                it("should add the correct constraints to the view") {
                    expect(actualConstraints.count).to(equal(expectedConstraints.count))
                    
                    for constraint in actualConstraints {
                        print("💏 \(constraint)")
                    }
                    
                    print("\n")
                    
                    for constraint in expectedConstraints {
                        print("💪 \(constraint)")
                    }
                    
                    expect(actualConstraints.contains(topConstraint)).to(beTrue())
                    expect(actualConstraints.contains(leftConstraint)).to(beTrue())
                    expect(actualConstraints.contains(rightConstraint)).to(beTrue())
                    expect(actualConstraints.contains(bottomConstraint)).to(beTrue())
                }
            }
        }
    }
}

//MARK: - NSLayoutConstraint Test Helper

extension NSLayoutConstraint {
    open override func isEqual(_ object: Any?) -> Bool {
        guard let constraint = object as? NSLayoutConstraint else { return false }
        
        guard let firstItem = firstItem as? UIView else { return false }
        guard let secondItem = secondItem as? UIView else { return false }
        
        guard let constraintFirstItem = constraint.firstItem as? UIView else { return false }
        guard let constraintSecondItem = constraint.secondItem as? UIView else { return false }
        
        if constraintFirstItem != firstItem { return false }
        if constraintSecondItem != secondItem { return false }
        
        if constraint.constant != constant { return false }
        if constraint.multiplier != multiplier { return false }
        if constraint.relation != relation { return false }
        
        return true
    }
}
