//
//  MaskedContainerView.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

import UIKit

public final class MaskedContainerView: UIView {
    
    // MARK: - Initialize
    
    public init(
        containedView: UIView? = nil,
        configuration: ConfigurationModel = .default
    ) {
        super.init(frame: .zero)
        
        if let containedView = containedView {
            addSubview(containedView)
            containedView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                containedView.topAnchor.constraint(equalTo: self.topAnchor),
                containedView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                containedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                containedView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        }
        
        configure(with: configuration)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure(with: .default)
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateMaskFrame()
    }
    
    // MARK: - Private
    
    private func updateMaskFrame() {
        layer.mask?.frame = bounds
    }
}

// MARK: - SRConfigurableView

extension MaskedContainerView: ConfigurableView {
    
    public struct ConfigurationModel {
        
        // Static
        public static let `default`: ConfigurationModel = {
            let opacity = UIColor.clear.cgColor
            let transparent = UIColor.black.cgColor
            let colors = [opacity, transparent, transparent, opacity]
            
            return ConfigurationModel(
                startPoint: .topCenter,
                endPoint: .bottomCenter,
                locations: [0.0, 0.05, 0.95, 1.0],
                colors: colors
            )
        }()
        
        // Properties
        public let startPoint: CGPoint
        public let endPoint: CGPoint
        public let locations: [NSNumber]?
        public let colors: [CGColor]?
        
        // MARK: - Initialize
        
        public init(
            startPoint: CGPoint,
            endPoint: CGPoint,
            locations: [NSNumber]? = nil,
            colors: [CGColor]? = nil
        ) {
            self.startPoint = startPoint
            self.endPoint = endPoint
            self.locations = locations
            self.colors = colors
        }
    }
    
    public func configure(with model: ConfigurationModel) {
        let maskGradientLayer = CAGradientLayer()
        maskGradientLayer.startPoint = model.startPoint
        maskGradientLayer.endPoint = model.endPoint
        maskGradientLayer.locations = model.locations
        maskGradientLayer.colors = model.colors
        
        layer.mask = maskGradientLayer
        layer.masksToBounds = true
        
        updateMaskFrame()
    }
}

private extension CGPoint {
    
    // MARK: - Top
    
    static var topLeft: CGPoint {
        CGPoint(x: 0.0, y: 0.0)
    }
    
    static var topCenter: CGPoint {
        CGPoint(x: 0.5, y: 0.0)
    }
    
    static var topRight: CGPoint {
        CGPoint(x: 1.0, y: 0.0)
    }
    
    // MARK: - Bottom
    
    static var bottomLeft: CGPoint {
        CGPoint(x: 0.0, y: 1.0)
    }
    
    static var bottomCenter: CGPoint {
        CGPoint(x: 0.5, y: 1.0)
    }
    
    static var bottomRight: CGPoint {
        CGPoint(x: 1.0, y: 1.0)
    }
    
    // MARK: - Left
    
    static var leftCenter: CGPoint {
        CGPoint(x: 0.0, y: 0.5)
    }
    
    // MARK: - Right
    
    static var rightCenter: CGPoint {
        CGPoint(x: 1.0, y: 0.5)
    }
    
    // MARK: - Center
    
    static var center: CGPoint {
        CGPoint(x: 0.5, y: 0.5)
    }
}

