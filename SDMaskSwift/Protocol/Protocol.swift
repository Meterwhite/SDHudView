//
//  Protocol.swift
//  SDMaskSwiftDemo
//
//  Created by me on 2024/9/5.
//

import Foundation
import UIKit

typealias SDMaskModelClosure<UserView: UIView> = (_ model: SDMaskModel<UserView>) -> (Void)

typealias SDMaskBindingEventClosure<UserView: UIView> = (_ event: SDMaskBindingEvent<UserView>) -> (Void)

protocol SDMask<UserView> {
    
    associatedtype UserView where UserView: UIView
    
    var userView: UserView? { get set }
    
    var model: SDMaskModel<UserView> { get set }
    
    init(userView: UserView)
    
    func display()
    
    func dismiss()
}

protocol SDMaskUserViewSteps<UserView> {
    
    associatedtype UserView where UserView: UIView
        
    func userViewDidLoad(_ closure: SDMaskModelClosure<UserView>) -> any SDMask
    
    func userViewDidDisappear(_ closure: SDMaskModelClosure<UserView>) -> any SDMask
    
}

protocol SDMaskAnimationSupport<UserView> {
    
    associatedtype UserView where UserView: UIView
    
    func usingAutoDismiss() -> any SDMask
    
    func disableDefaultAnimation() -> any SDMask
    
    func userViewPresentAnimation(will closure: SDMaskModelClosure<UserView>) -> any SDMask<UserView>
    
    func userViewPresentAnimation(todo closure: SDMaskModelClosure<UserView>) -> any SDMask<UserView>
    
    func userViewPresentAnimation(completed closure: SDMaskModelClosure<UserView>) -> any SDMask<UserView>
    
    func userViewDismissAnimation(will closure: SDMaskModelClosure<UserView>) -> any SDMask<UserView>
    
    func userViewDismissAnimation(todo closure: SDMaskModelClosure<UserView>) -> any SDMask<UserView>
    
    func userViewDismissAnimation(completed closure: SDMaskModelClosure<UserView>) -> any SDMask<UserView>
}

protocol SDMaskBindingSupport<UserView> {
    
    associatedtype UserView where UserView: UIView
    
    func bindEvent(for views: any Sequence<UserView>) -> any SDMask<UserView>
    
    func bindCancelEvent(for view: UIView) -> any SDMask<UserView>
    
    func configBindingEventsIn(_ closure: SDMaskBindingEventClosure<UserView>) -> any SDMask<UserView>
    
    func configBindingCancelEvent(_ closure: SDMaskBindingEventClosure<UserView>) -> any SDMask<UserView>
    
    func configBindingEvent(for indexer: Any, _ closure: SDMaskBindingEventClosure<UserView>) -> any SDMask<UserView>
}


protocol SDMaskToast: SDMask, SDMaskUserViewSteps, SDMaskAnimationSupport, SDMaskBindingSupport { 
    
}

protocol SDMaskGuid: SDMask, SDMaskUserViewSteps {
    
}
