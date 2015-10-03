//
//  FormTextCell.swift
//  Former-Demo
//
//  Created by Ryo Aoyama on 7/24/15.
//  Copyright © 2015 Ryo Aoyama. All rights reserved.
//

import UIKit

public class FormTextCell: FormCell, TextFormableRow {
    
    // MARK: Public
    
    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var subTextLabel: UILabel!
    
    public func formTextLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formerSubTextLabel() -> UILabel? {
        return subTextLabel
    }
    
    public override func updateWithRowFormer(rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)
        rightConst.constant = (accessoryType == .None) ? -15.0 : 0
    }
    
    public override func setup() {
        super.setup()
        
        let titleLabel = UILabel()
        titleLabel.setContentHuggingPriority(500, forAxis: .Horizontal)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.insertSubview(titleLabel, atIndex: 0)
        self.titleLabel = titleLabel
        
        let subTextLabel = UILabel()
        subTextLabel.textColor = .lightGrayColor()
        subTextLabel.textAlignment = .Right
        subTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.insertSubview(subTextLabel, atIndex: 0)
        self.subTextLabel = subTextLabel
        
        let constraints = [
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-0-[title]-0-|",
                options: [],
                metrics: nil,
                views: ["title": titleLabel]
            ),
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-0-[sub]-0-|",
                options: [],
                metrics: nil,
                views: ["sub": subTextLabel]
            ),
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-15-[title]-10-[sub(>=0)]",
                options: [],
                metrics: nil,
                views: ["title": titleLabel, "sub": subTextLabel]
            )
            ].flatMap { $0 }
        let rightConst = NSLayoutConstraint(
            item: subTextLabel,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Trailing,
            multiplier: 1.0,
            constant: 0
        )
        contentView.addConstraints(constraints + [rightConst])
        self.rightConst = rightConst
    }
    
    // MARK: Private
    
    private weak var rightConst: NSLayoutConstraint!
}