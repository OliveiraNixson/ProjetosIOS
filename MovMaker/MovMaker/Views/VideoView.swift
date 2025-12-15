//
//  VideoView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 14/12/25.
//

import Foundation
import WebKit
import SwiftUI

struct VideoView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = .clear
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let embedHTML = """
        <!DOCTYPE html>
        <html>
        <body style="margin:0;">
        <iframe width="100%" height="100%"
            src="https://www.youtube.com/embed/\(videoID)"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen>
        </iframe>
        </body>
        </html>
        """

        webView.loadHTMLString(embedHTML, baseURL: nil)
    }
}
