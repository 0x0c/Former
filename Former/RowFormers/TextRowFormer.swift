//
//  LabelRowFormer.swift
//  Former-Demo
//
//  Created by Ryo Aoyama on 7/24/15.
//  Copyright © 2015 Ryo Aoyama. All rights reserved.
//

import UIKit

public protocol LabelFormableRow: FormableRow {
    
    func formTextLabel() -> UILabel?
    func formerSubTextLabel() -> UILabel?
}

public class LabelRowFormer<T: UITableViewCell where T: LabelFormableRow>
: CustomRowFormer<T> {
    
    // MARK: Public
    
    public var text: String?
    public var subText: String?
    public var textDisabledColor: UIColor? = .lightGrayColor()
    public var subTextDisabledColor: UIColor? = .lightGrayColor()
    
    required public init(instantiateType: Former.InstantiateType = .Class, cellSetup: (T -> Void)? = nil) {
        super.init(instantiateType: instantiateType, cellSetup: cellSetup)
    }
    
    public override func update() {
        super.update()
        
        let textLabel = cell.formTextLabel()
        let subTextLabel = cell.formerSubTextLabel()
        textLabel?.text = text
        subTextLabel?.text = subText
        
        if enabled {
            _ = textColor.map { textLabel?.textColor = $0 }
            _ = subTextColor.map { subTextLabel?.textColor = $0 }
            textColor = nil
            subTextColor = nil
        } else {
            if textColor == nil { textColor = textLabel?.textColor }
            if subTextColor == nil { subTextColor = subTextLabel?.textColor }
            textLabel?.textColor = textDisabledColor
            subTextLabel?.textColor = subTextDisabledColor
        }
    }
    
    // MARK: Private
    
    private var textColor: UIColor?
    private var subTextColor: UIColor?
}