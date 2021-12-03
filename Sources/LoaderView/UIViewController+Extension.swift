//
//  File.swift
//  
//
//  Created by Andrey Petrovskiy on 03.12.2021.
//

import UIKit

import DeclarativeUIKit

public extension UIViewController {
    func showLoader() {
        let loader = LoaderView()
        view.addSubview(loader)
        loader.clipToSuperview()
        loader.start()
    }

    func hideLoader() {
        (view.subviews.first(where: {$0 as? LoaderView != nil})
            as? LoaderView)?.stop()
    }
}
