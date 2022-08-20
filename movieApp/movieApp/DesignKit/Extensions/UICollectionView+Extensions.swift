//
//  UICollectionView+Extensions.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

import UIKit

extension UICollectionView {
    
    typealias ReusableCell = UICollectionViewCell & ReuseIdentifierable
    typealias ReusableView = UICollectionReusableView & ReuseIdentifierable
 
    // MARK: - Register
    
    func register<Cell: ReusableCell>(_ cellClass: Cell.Type) {
        let reuseIdentifier = Cell.reuseIdentifier
        register(Cell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func register<View: ReusableView>(
        _ viewClass: View.Type,
        forSupplementaryViewOfKind kind: String
    ) {
        let reuseIdentifier = View.reuseIdentifier
        register(
            View.self,
            forSupplementaryViewOfKind: kind,
            withReuseIdentifier: reuseIdentifier
        )
    }
    
    // MARK: - Dequeue
    
    func dequeueReusableCell<Cell: ReusableCell>(
        _ cellClass: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell {
        let reuseIdentifier = Cell.reuseIdentifier
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with identifier: \(reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<Cell: ReusableCell>(for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(Cell.self, for: indexPath)
    }
    
    func dequeueReusableView<View: ReusableView>(
        _ viewClass: View.Type,
        ofKind kind: String,
        for indexPath: IndexPath
    ) -> View {
        
        let reuseIdentifier = View.reuseIdentifier
        guard
            let view = dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: reuseIdentifier,
                for: indexPath
            ) as? View
        else {
            fatalError("Could not dequeue cell with identifier: \(reuseIdentifier)")
        }
        return view
    }
    
    func dequeueReusableView<View: ReusableView>(
        ofKind kind: String,
        for indexPath: IndexPath
    ) -> View {
        return dequeueReusableView(View.self, ofKind: kind, for: indexPath)
    }
}
