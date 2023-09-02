//
//  UIView+Ext.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 31.08.23.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
