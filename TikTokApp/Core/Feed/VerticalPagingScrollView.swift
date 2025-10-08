//
//  VerticalPagingScrollView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/8/25.
//

import Foundation
import SwiftUI
import UIKit

/// A vertical paging container that hosts SwiftUI pages (works on Xcode < 15 / iOS 13+).
struct VerticalPagingScrollView<Content: View>: UIViewControllerRepresentable {
    let pageCount: Int
    private let contentBuilder: (Int) -> AnyView

    init(pageCount: Int, @ViewBuilder content: @escaping (Int) -> Content) {
        self.pageCount = pageCount
        self.contentBuilder = { index in AnyView(content(index)) }
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .clear

        // Scroll view
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = false
        // optional: make snapping feel snappy
        scrollView.decelerationRate = .fast

        vc.view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: vc.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor)
        ])

        // Vertical stack of pages inside the scrollview's content area
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0

        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            // Keep stack width equal to scroll view width (no horizontal scrolling)
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])

        // create UIHostingController for each page and pin its height to the scrollView's visible height
        var hosts: [UIHostingController<AnyView>] = []
        for i in 0..<pageCount {
            let host = UIHostingController(rootView: contentBuilder(i))
            host.view.backgroundColor = .clear
            vc.addChild(host)
            host.view.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(host.view)
            host.didMove(toParent: vc)

            // Make each page exactly the height of the scrollView's frame
            host.view.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor).isActive = true

            hosts.append(host)
        }

        // store references in coordinator for updates / programmatic scrolling
        context.coordinator.hostControllers = hosts
        context.coordinator.scrollView = scrollView
        context.coordinator.stackView = stackView

        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // If page count changed, rebuild children
        if context.coordinator.hostControllers.count != pageCount {
            // Remove old children
            for host in context.coordinator.hostControllers {
                host.willMove(toParent: nil)
                host.view.removeFromSuperview()
                host.removeFromParent()
            }
            context.coordinator.hostControllers.removeAll()

            guard let scrollView = context.coordinator.scrollView,
                  let stackView = context.coordinator.stackView else { return }

            // Add new hosts
            var newHosts: [UIHostingController<AnyView>] = []
            for i in 0..<pageCount {
                let host = UIHostingController(rootView: contentBuilder(i))
                host.view.backgroundColor = .clear
                uiViewController.addChild(host)
                host.view.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview(host.view)
                host.didMove(toParent: uiViewController)
                host.view.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor).isActive = true
                newHosts.append(host)
            }
            context.coordinator.hostControllers = newHosts
            return
        }

        // Otherwise just update the rootViews
        for (i, host) in context.coordinator.hostControllers.enumerated() where i < pageCount {
            host.rootView = contentBuilder(i)
        }
    }

    // Optional: helper to programmatically scroll to a page
    final class Coordinator {
        var hostControllers: [UIHostingController<AnyView>] = []
        weak var scrollView: UIScrollView?
        weak var stackView: UIStackView?

        /// scroll to page (0-based)
        func scrollTo(page: Int, animated: Bool) {
            guard let scrollView = scrollView else { return }
            let y = CGFloat(page) * scrollView.bounds.height
            scrollView.setContentOffset(CGPoint(x: 0, y: y), animated: animated)
        }

        /// current page index
        var currentPage: Int {
            guard let scrollView = scrollView, scrollView.bounds.height > 0 else { return 0 }
            return Int(round(scrollView.contentOffset.y / scrollView.bounds.height))
        }
    }
}

