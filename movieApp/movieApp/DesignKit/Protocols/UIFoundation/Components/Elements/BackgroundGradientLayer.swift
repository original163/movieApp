//
//  BackgroundGradientLayer.swift
//  movieApp
//
//  Created by Денис Денисов on 21.08.2022.
//

import UIKit

final class BackgroundGradientLayer: CAGradientLayer {
    
    // MARK: - Initialize
    
    public override init() {
        super.init()
        setUpUI()
    }
    
    public override init(layer: Any) {
        super.init(layer: layer)
        setUpUI()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setUpUI() {
        startPoint = .zero
        endPoint = .init(x: 1, y: 1)
        colors = [
            UIColor(red: 0.9098039216, green: 0.8784313725, blue: 0.8392156863, alpha: 1),
            UIColor(red: 200 / 255, green: 200 / 255, blue: 28 / 255, alpha: 1)
        ]
    }
}
