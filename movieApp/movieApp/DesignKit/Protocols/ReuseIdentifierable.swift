//
//  ReuseIdentifierable.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

import UIKit

// MARK: - ReuseIdentifierable

protocol ReuseIdentifierable: AnyObject {
    
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifierable {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

// MARK: - IdentifiableNibReusableView

protocol NibReuseIdentifierable: ReuseIdentifierable {
    static var nib: UINib { get }
}

extension NibReuseIdentifierable {
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
