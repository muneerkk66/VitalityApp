//
//  SwiftUI.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 10/03/2024.
//

import SwiftUI
extension SwiftUI.View {
	func toVC() -> UIViewController {
		let vc = UIHostingController(rootView: self)
		vc.view.frame = UIScreen.main.bounds
		return vc
	}
}
