//
//  PreviewExtension.swift
//  HighSchoolFish_MVVM
//
//  Created by 강보현 on 2023/08/03.
//




#if canImport(SwiftUI) && DEBUG
import SwiftUI

public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    public let view: View
    public init(_ builder: @escaping () -> View) {
        view = builder()
    }
    // MARK: - UIViewRepresentable
    public func makeUIView(context: Context) -> UIView {
        return view
    }
    public func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    public let viewController: ViewController
    
    public init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }
    
    // MARK: - UIViewControllerRepresentable
    public func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    
    @available(iOS 13.0, tvOS 13.0, *)
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    public func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
        return
    }
}
#endif
