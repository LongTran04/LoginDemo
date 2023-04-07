//
//  ViewController.swift
//  LoginDemo
//
//  Created by Long Tran on 23/03/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginMicrosoftButton: CustomLoginButton!
    @IBOutlet weak var loginGoogleButton: CustomLoginButton!
    @IBOutlet weak var loginCodeButton: CustomLoginButton!
    @IBOutlet weak var loginSSOButton: CustomLoginButton!
    @IBOutlet weak var selectLanguageButton: CustomSelectLanguage!
    @IBOutlet weak var phoneNumberButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var warningAlertView: UIView!
    @IBOutlet weak var warningAlertLabel: UILabel!
    @IBOutlet weak var textFieldStackView: UIStackView!
    @IBOutlet weak var underAccountTextFieldLabel: UILabel!
    
    @IBOutlet weak var underPasswordTextFieldLabel: UILabel!
    let titlesLanguage = ["Tiếng Việt", "English"]
    let imagesLanguage = ["Vietnam", "English"]
    var checkInputTextField: Bool!
    var checkLanguage = true
    var underlineLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLanguageButton.configure(imageLanguageName: "Vietnam", labelLanguage: "Vie")
        underlineLabel = UIView(frame: CGRect(x: buttonStack.frame.origin.x, y: buttonStack.frame.origin.y + buttonStack.frame.height, width: (view.frame.width-50)/2, height: 2))
        view.addSubview(underlineLabel)
        underlineLabel.layer.zPosition = 100
        underlineLabel.backgroundColor = .customColor
        emailButton.tintColor = .customColor
        phoneNumberButton.tintColor = UIColor(red: 0.45, green: 0.46, blue: 0.51, alpha: 1.00)
        accountTextField.setupLeftTextField(imageNamed: "Icon-2")
        accountTextField.placeholder = "Email của bạn"
        accountTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        checkInputTextField = true
        warningAlertView.isHidden = true
        accountTextField.delegate = self
        passwordTextField.delegate = self
        underAccountTextFieldLabel.isHidden = true
        underPasswordTextFieldLabel.isHidden = true
        
        forgotPasswordButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        loginMicrosoftButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        loginGoogleButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        loginCodeButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        loginSSOButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        loginMicrosoftButton.configure(label: "Đăng nhập bằng Microsoft", imageName: "Microsoft_logo 1")
        loginGoogleButton.configure(label: "Đăng nhập bằng Google", imageName: "logo_googleg_48dp")
        loginCodeButton.configure(label: "Tiếp tục với mã định danh", imageName: "ic20-fill-id-card")
        loginSSOButton.configure(label: "Đăng nhập một lần SSO", imageName: "ic20-fill-person-circle")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        accountTextField.layer.borderWidth = 1
        accountTextField.layer.cornerRadius = 8
        passwordTextField.setupLeftTextField(imageNamed: "ic24-line15-lock")
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.setupRightTextField()
        loginButton.layer.cornerRadius = 8
        warningAlertView.layer.cornerRadius = 8
    }
    
    @objc func didTapButton() {
        print("Button did tap")
    }
    
    @IBAction func tapEmailButton(_ sender: Any) {
        if(!checkInputTextField) {
            emailButton.tintColor = .customColor
            phoneNumberButton.tintColor = UIColor(red: 0.45, green: 0.46, blue: 0.51, alpha: 1.00)
            UIView.animate(withDuration: 0.5, animations: {
                self.underlineLabel.frame.origin.x = self.buttonStack.frame.origin.x
            })
            accountTextField.setupLeftTextField(imageNamed: "Icon-2")
            accountTextField.placeholder = "Email của bạn"
            accountTextField.layer.borderColor = UIColor(red: 0.19, green: 0.66, blue: 0.38, alpha: 1.00).cgColor
            checkInputTextField = true
            accountTextField.text = ""
            passwordTextField.text = ""
            underAccountTextFieldLabel.isHidden = true
            accountTextField.keyboardType = .emailAddress
            if accountTextField.isFirstResponder {
                accountTextField.reloadInputViews()
            }
            else {
                accountTextField.becomeFirstResponder()
            }
            accountTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func tapPhoneNumberButton(_ sender: Any) {
        if(checkInputTextField) {
            phoneNumberButton.tintColor = .customColor
            emailButton.tintColor = UIColor(red: 0.45, green: 0.46, blue: 0.51, alpha: 1.00)
            UIView.animate(withDuration: 0.5, animations: {
                self.underlineLabel.frame.origin.x = self.buttonStack.frame.origin.x + self.buttonStack.frame.width/2
            })
            accountTextField.setupLeftTextField(imageNamed: "Icon")
            accountTextField.placeholder = "Số điện thoại của bạn"
            checkInputTextField = false
            accountTextField.text = ""
            passwordTextField.text = ""
            underAccountTextFieldLabel.isHidden = true
            accountTextField.layer.borderColor = UIColor.customColor.cgColor
            accountTextField.keyboardType = .phonePad
            if accountTextField.isFirstResponder {
                accountTextField.reloadInputViews()
            }
            else {
                accountTextField.becomeFirstResponder()
            }
        }
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        let account = accountTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if checkAccountTextField(account: account) {
            if checkPasswordTextField(password: password) {
                checkLogin()
            }
        }
    }
    
    @IBAction func tapWarningAlertButton(_ sender: Any) {
        warningAlertView.isHidden = true
    }
    
    @IBAction func selectLanguageButtonDidTap(_ sender: Any) {
        let vc = BottomSheetViewController()
        let languageTableView = UITableView()
        languageTableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "LanguageTableViewCell")
        vc.view.addSubview(languageTableView)
        languageTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            languageTableView.topAnchor.constraint(equalTo: vc.view.topAnchor),
            languageTableView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            languageTableView.leftAnchor.constraint(equalTo: vc.view.leftAnchor),
            languageTableView.rightAnchor.constraint(equalTo: vc.view.rightAnchor)
        ])
        languageTableView.dataSource = self
        languageTableView.delegate = self
        let navVC = UINavigationController(rootViewController: vc)
        navVC.isNavigationBarHidden = true
        
        if let sheet = navVC.sheetPresentationController {
            sheet.detents = [.custom { _ in
                return 100
            }]
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        self.present(navVC, animated: true)
    }
    
    func setupLanguage() {
        if(checkLanguage) {
            selectLanguageButton.configure(imageLanguageName: "Vietnam", labelLanguage: "Vie")
        }
        else {
            selectLanguageButton.configure(imageLanguageName: "English", labelLanguage: "Eng")
        }
    }
    
    func checkAccountTextField(account: String) -> Bool {
        if(account == "") {
            if(checkInputTextField) {
                underAccountTextFieldLabel.text = "Định dạng email không hợp lệ"
            }
            else {
                underAccountTextFieldLabel.text = "Số điện thoại không hợp lệ"
            }
            underAccountTextFieldLabel.isHidden = false
            accountTextField.layer.borderColor = UIColor.red.cgColor
            return false
        }
        else {
            if(checkInputTextField) {
                if(checkEmailAccount()) {
                    return true
                }
                else {
                    warningAlertLabel.text = "Email bạn cung cấp không hợp lệ. Bạn vui lòng kiểm tra lại"
                    warningAlertView.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.warningAlertView.isHidden = true
                    }
                    return false
                }
            }
            else {
                if(account.count == 10) {
                    if(checkPhoneNumberAccount()) {
                        return true
                    }
                    else {
                        warningAlertLabel.text = "Số điện thoại không hợp lệ. Bạn vui lòng kiểm tra lại"
                        warningAlertView.isHidden = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            self.warningAlertView.isHidden = true
                        }
                        return false
                    }
                }
                else {
                    underAccountTextFieldLabel.text = "Số điện thoại không đúng định dạng"
                    underAccountTextFieldLabel.isHidden = false
                    accountTextField.layer.borderColor = UIColor.red.cgColor
                    return false
                }
            }
        }
    }
    
    func checkPasswordTextField(password: String) -> Bool {
        if(password == "") {
            self.view.endEditing(true)
            underPasswordTextFieldLabel.text = "Mật khẩu không được để trống"
            underPasswordTextFieldLabel.isHidden = false
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            return false
        }
        else {
            if(checkPassword()){
                self.view.endEditing(true)
                return true
            }
            else {
                self.view.endEditing(true)
                warningAlertLabel.text = "Mật khẩu của bạn không chính xác. Bạn vui lòng kiểm tra lại"
                warningAlertView.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.warningAlertView.isHidden = true
                }
                return false
            }
        }
    }
          
    func checkLogin() {
        
    }
    
    func checkPhoneNumberAccount() -> Bool {
        return true
    }
    
    func checkEmailAccount() -> Bool {
        return true
    }
    
    func checkPassword() -> Bool {
        return false
    }
    
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.customColor.cgColor
        underPasswordTextFieldLabel.isHidden = true
        underAccountTextFieldLabel.isHidden = true
        becomeFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension UITextField {
    func setupLeftTextField(imageNamed: String) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 24, height: 24))
        imageView.image = UIImage(named: imageNamed)
        let imageViewContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageViewContainerView.addSubview(imageView)
        leftView = imageViewContainerView
        leftViewMode = .always
    }
    
    func setupRightTextField() {
        let button = UIButton(frame: CGRect(x: -10, y: 0, width: 40, height: 40))
        if(isSecureTextEntry) {
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
        else {
            button.setImage(UIImage(systemName: "eye"), for: .normal)
        }
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        containerView.addSubview(button)
        rightView = containerView
        rightViewMode = .always
    }
    
    @objc func didTapButton(){
        if(isSecureTextEntry) {
            isSecureTextEntry = false
            setupRightTextField()
        }
        else {
            isSecureTextEntry = true
            setupRightTextField()
        }
    }
}

extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesLanguage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell") as! LanguageTableViewCell
        cell.labelLanguage.text = titlesLanguage[indexPath.row]
        cell.imageLanguage.image = UIImage(named: imagesLanguage[indexPath.row])
        if(checkLanguage) {
            if(cell.imageLanguage.image == UIImage(named: "Vietnam")) {
                cell.imageStatusLanguage.image = UIImage(systemName: "record.circle.fill")
                cell.imageStatusLanguage.tintColor = .customColor
            }
            else {
                cell.imageStatusLanguage.image = UIImage(systemName: "circle")
                cell.imageStatusLanguage.tintColor = .lightGray
            }
        }
        else {
            if(cell.imageLanguage.image == UIImage(named: "English")) {
                cell.imageStatusLanguage.image = UIImage(systemName: "record.circle.fill")
                cell.imageStatusLanguage.tintColor = .customColor
            }
            else {
                cell.imageStatusLanguage.image = UIImage(systemName: "circle")
                cell.imageStatusLanguage.tintColor = .lightGray
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(checkLanguage) {
            if(titlesLanguage[indexPath.row] != "Tiếng Việt") {
                checkLanguage = false
                setupLanguage()
            }
        }
        else {
            if(titlesLanguage[indexPath.row] != "English") {
                checkLanguage = true
                setupLanguage()
            }
        }
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension UIColor {
    public static let customColor = UIColor(red: 0.19, green: 0.66, blue: 0.38, alpha: 1.00)
}
