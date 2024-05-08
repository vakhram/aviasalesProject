//
//  cellProtocol.swift
//  testproject1
//
//  Created by Guest Acc on 22.03.2024.
//


import Foundation
import UIKit

protocol ReusableCellProtocol {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension ReusableCellProtocol {
    static var identifier: String {
        String(describing: self)
    }

    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}

extension UITableViewCell: ReusableCellProtocol {}
extension UICollectionViewCell: ReusableCellProtocol {}
extension UITableViewHeaderFooterView: ReusableCellProtocol {}
extension UICollectionReusableView: ReusableCellProtocol {}
