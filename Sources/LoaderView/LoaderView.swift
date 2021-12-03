//
//  File.swift
//  
//
//  Created by Andrey Petrovskiy on 03.12.2021.
//

import UIKit

import DeclarativeUIKit

final class LoaderView: UIView {

    private lazy var loaderView: UIActivityIndicatorView = .create {
        $0.removeAutoresizing()
            .withColor(.white)
            .withStyle(.large)
    }

    private lazy var blurEffectView: UIVisualEffectView = .createBlurEffectView(with: .dark) {
        $0.removeAutoresizing()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override func clipToSuperview() {
        if let suprView = superview {
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: 80),
                heightAnchor.constraint(equalToConstant: 80),
                centerXAnchor.constraint(equalTo: suprView.centerXAnchor),
                centerYAnchor.constraint(equalTo: suprView.centerYAnchor)
            ])
        }
    }

    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 5
        backgroundColor = .clear
        clipsToBounds = true
        alpha = 0

        addSubview(blurEffectView)
        blurEffectView.clipToSuperview()

        blurEffectView.contentView.layoutSubview(loaderView) { [
            $0.centerHorizontaly(centerXAnchor),
            $0.centerVerticaly(relativeTo: centerYAnchor)
        ] }
    }

    func start() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
        } completion: {[weak self] (_) in
            self?.loaderView.startAnimating()
        }
    }


    func stop() {
        loaderView.stopAnimating()
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        } completion: {[weak self] (_) in
            self?.removeFromSuperview()
        }

    }

}
