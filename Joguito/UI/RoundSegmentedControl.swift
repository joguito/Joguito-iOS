//
//  RoundSegmentedControl.swift
//  Joguito
//
//  Created by Mohamed on 13/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit
@IBDesignable
class RoundSegmentedControl: UIControl {

    private var labels = [UILabel]()

    var thumbView = UIView()

    @IBInspectable var selectedIndex: Int = 0 {
        didSet {
            displaySelectedIndex()
        }
    }

    var items: [String] = ["Item 1", "Item 2"]
    
    @IBInspectable var itemsArray: String = "Item 1; Item 2" {
        didSet {
            items = itemsArray.components(separatedBy: "; ")
            setupLabels()
        }
    }
    
    @IBInspectable var thumbTintColor: UIColor = UIColor.clear {
        didSet {
            thumbView.backgroundColor = thumbTintColor
        }
    }
    
    @IBInspectable var thumbSelectedTitleColor: UIColor = UIColor.black
    
    @IBInspectable var thumbTitleColor: UIColor = UIColor.black
    
    @IBInspectable var thumbTitleFontSize: CGFloat = 17.0
    
    @IBInspectable var separatorWidth: CGFloat = 1.0
    
    @IBInspectable var separatorColor: UIColor = UIColor.white
    
    @IBInspectable var thumbTitleFont: String = ""

    @IBInspectable var edgeColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = edgeColor.cgColor
        }
    }

    @IBInspectable var edgeThikness: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = edgeThikness
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func prepareForInterfaceBuilder() {
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    fileprivate func setup() {
        self.layer.cornerRadius = self.frame.height / 2
        self.insertSubview(thumbView, at: 0)
        
        setupLabels()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        var selectedFrame = self.bounds
        let newWidth = selectedFrame.width / CGFloat(items.count)
        selectedFrame.size.width = newWidth
        thumbView.frame = selectedFrame
        self.clipsToBounds = true

        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(labels.count)

        for index in 0...labels.count - 1 {
            let label = labels[index]

            let xPos = CGFloat(index) * labelWidth
            label.frame = CGRect(x: xPos, y: 0, width: labelWidth, height: labelHeight)
        }
    }

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calculedIndex: Int?

        for(index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calculedIndex = index
            }
        }

        if calculedIndex != nil {
            selectedIndex = calculedIndex!
            sendActions(for: .valueChanged)
        }
        return false
    }

    fileprivate func setupLabels() {
        for label in labels {
            label.removeFromSuperview()
        }

        labels.removeAll(keepingCapacity: true)

        for index in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.text = items[index - 1]
            label.textAlignment = .center
            if index == selectedIndex + 1 {
                label.textColor = thumbSelectedTitleColor
            } else {
                label.textColor = thumbTitleColor
                label.layer.borderWidth = separatorWidth
                label.layer.borderColor = separatorColor.cgColor
            }
            label.font = label.font.withSize(thumbTitleFontSize)
            if (thumbTitleFont != "") {
                label.font = UIFont(name: thumbTitleFont, size: thumbTitleFontSize)
            }
            self.addSubview(label)
            labels.append(label)
        }
    }

    fileprivate func displaySelectedIndex() {
        let label = labels[selectedIndex]
        self.thumbView.frame = label.frame
        for index in 0...labels.count - 1 {
            if index != selectedIndex {
                labels[index].textColor = thumbTitleColor
            } else{
                labels[index].textColor = thumbSelectedTitleColor
            }
        }
    }

}
