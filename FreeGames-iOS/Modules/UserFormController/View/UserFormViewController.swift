//
//  UserFormViewController.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import UIKit

struct UserFormViewModel {
    let name: String?
    let lastName: String?
    let phone: String?
    let mail: String?
    let bio: String?
}

class UserFormViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var mailInput: UITextField!
    @IBOutlet weak var bioTextArea: UITextView!
    
    var presenter: UserFormPresenterContract?
    
    @IBAction func scrollViewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func inputDidChange(_ textField: UITextField) {
        self.textFieldDidChange(textField)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        presenter?.saveDataUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputDelegate()
        presenter?.viewDidLoad()
    }
}

extension UserFormViewController: UserFormViewContract {
    
    func textFieldDidChange(_ textField: UITextField) {
        switch textField {
        case nameInput: presenter?.didUpdateName(textField.text)
        case lastNameInput: presenter?.didUpdateLastName(textField.text)
        case phoneInput: presenter?.didUpdatePhone(textField.text)
        case mailInput: presenter?.didUpdateMail(textField.text)
        default: break
        }
    }
    
    func configure(with viewModel: UserFormViewModel) {
        DispatchQueue.main.async {
            self.nameInput.text = viewModel.name
            self.lastNameInput.text = viewModel.lastName
            self.phoneInput.text = viewModel.phone
            self.mailInput.text = viewModel.mail
            self.bioTextArea.text = viewModel.bio
        }
    }
    
    func didValidateName(_ valid: Bool) {
        didUpdateValidation(input: nameInput, valid: valid)
    }
    
    func didValidateLastName(_ valid: Bool) {
        didUpdateValidation(input: lastNameInput, valid: valid)
    }
    
    func didValidatePhone(_ valid: Bool) {
        didUpdateValidation(input: phoneInput, valid: valid)
    }
    
    func didValidateMail(_ valid: Bool) {
        didUpdateValidation(input: mailInput, valid: valid)
    }
}

extension UserFormViewController {
    
    private func inputDelegate() {
        bioTextArea.delegate = self
        [nameInput, lastNameInput, phoneInput, mailInput].forEach { input in
            input?.delegate = self
        }
    }
    
    private func didUpdateValidation(input: UITextField, valid: Bool) {
        DispatchQueue.main.async {
            input.backgroundColor = valid ? .systemBackground : .systemRed
        }
    }
    
    func showValidationError() {
        DispatchQueue.main.async {
            self.presentAlert(withTitle: "Error", message: "Por favor, introduzca valor en todos los campos")
        }
    }
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = 0
    }
}

extension UserFormViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        presenter?.didUpdateBio(textView.text)
    }
}

extension UserFormViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldDidChange(textField)
    }
    
    //return button in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInput: lastNameInput.becomeFirstResponder()
        case lastNameInput: phoneInput.becomeFirstResponder()
        case phoneInput: mailInput.becomeFirstResponder()
        case mailInput: textField.resignFirstResponder() // hide keyboard
        default: break
        }
        return true
    }
}
