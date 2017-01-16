//
//  File.swift
//  instruction
//
//  Created by Isabelly Damascena on 16/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation
import Instructions

@objc public class InstructionsManager : NSObject, CoachMarksControllerDataSource {
    
    var highLightedView : UIView!
    
    var viewController : UIViewController
    
    private var coachMarksController : CoachMarksController?
    
    init(parentViewController viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func startTour(){
        self.coachMarksController = CoachMarksController()
        self.coachMarksController?.overlay.color = UIColor.gray
        self.coachMarksController?.dataSource = self
        
        self.highLightedView.layer.cornerRadius = 4.0
        
        self.coachMarksController?.startOn(self.viewController)
    }
    
    
    public func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
    public func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        
        
        return coachMarksController.helper.makeCoachMark(for: self.highLightedView, pointOfInterest: nil, cutoutPathMaker: nil)
    }
    
    public func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
        var tuple = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, withNextText: true, arrowOrientation: CoachMarkArrowOrientation.bottom)
        
        tuple.bodyView.hintLabel.text = "This is a a view"
        tuple.bodyView.nextLabel.text = "ok"
        
        return (bodyView: tuple.bodyView, arrowView: tuple.arrowView)
    }
    
    public func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, constraintsForSkipView skipView: UIView, inParent parentView: UIView) -> [NSLayoutConstraint]? {
        return nil
    }
}
