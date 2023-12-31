//
//  Extension.swift
//  TheStreet
//
//  Created by Ashraful Islam Rupu on 7/18/23.
//

import UIKit

//MARK: - Because i dont use StoryBoard

extension UIColor {

    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }

}

extension UIView {
  func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, width: NSLayoutDimension? = nil, height: NSLayoutDimension? = nil, topConstant: CGFloat = 0, leadingConstant: CGFloat = 0, trailingConstant: CGFloat = 0, bottomConstant: CGFloat = 0, centerXConstant: CGFloat = 0, centerYConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    var anchors = [NSLayoutConstraint]()

    if let top = top {
      anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
    }

    if let leading = leading {
      anchors.append(leadingAnchor.constraint(equalTo: leading, constant: leadingConstant))
    }

    if let trailing = trailing {
      anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstant))
    }

    if let bottom = bottom {
      anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
    }

    if let centerX = centerX {
      anchors.append(centerXAnchor.constraint(equalTo: centerX, constant: centerXConstant))
    }

    if let centerY = centerY {
      anchors.append(centerYAnchor.constraint(equalTo: centerY, constant: centerYConstant))
    }

    if let width = width {
      anchors.append(widthAnchor.constraint(equalTo: width, constant: widthConstant))
    } else if widthConstant != 0 {
      anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
    }

    if let height = height {
      anchors.append(heightAnchor.constraint(equalTo: height, constant: heightConstant))
    } else if heightConstant != 0 {
      anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
    }

    anchors.forEach({$0.isActive = true})
  }
}

extension UIColor {
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
  }

  convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
    self.init(r: r, g: g, b: b, a: 1)
  }
}


