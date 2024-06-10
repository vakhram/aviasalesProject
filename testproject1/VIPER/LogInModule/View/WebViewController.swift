//
//  WebViewController.swift
//  testproject1
//
//  Created by Guest Acc on 09.06.2024.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    private let webView = WKWebView()
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: urlString) else {
            self.dismiss(animated: true)
            return
        }
        self.webView.load(URLRequest(url: url))
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonDidTap))
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        
        self.view.addSubview(webView)
        self.webView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }

    @objc
    private func doneButtonDidTap() {
        self.dismiss(animated: true)
    }
}
