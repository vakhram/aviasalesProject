//
//  LoginViewController.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    public let contentView: LoginView = .init()
    private let headerView: CustomHeaderView = .init(title: "Sign in", subtitle: "Sign in your account")
    var presenter: LoginViewPresenter?
    
    init(presenter: LoginViewPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
        self.contentView.textView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        addButtonsTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        contentView.addSubview(headerView)
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
    }
    private func addButtonsTarget() {
        contentView.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonDidTapped), for: .touchUpInside)
        contentView.newUserButton.addTarget(self, action: #selector(newUserButtonDidTapped), for: .touchUpInside)
        contentView.signInButton.addTarget(self, action: #selector(signInButtonDidTapped), for: .touchUpInside)
    }
    @objc
    private func forgotPasswordButtonDidTapped() {
        presenter?.forgotPasswordButtonDidTapped()
    }
    @objc
    private func newUserButtonDidTapped() {
        presenter?.newUserButtonDidTapped()
    }
    @objc
    private func signInButtonDidTapped() {
        presenter?.signInButtonDidTapped()
    }
}
extension LoginViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.scheme == "terms" {
            self.showWebViewer(with: "https://policies.google.com/terms?hl=en-US")
        } else if URL.scheme == "privacy" {
            self.showWebViewer(with: "https://policies.google.com/privacy?hl=en-US")
        }
        return true
    }
    private func showWebViewer(with url: String) {
        let webviewer = WebViewController(urlString: url)
        let nav = UINavigationController(rootViewController: webviewer)
        self.present(nav, animated: true)
    }
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
