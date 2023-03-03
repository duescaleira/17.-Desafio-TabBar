//
//  ViewController.swift
//  17. DesafioTabBar
//
//  Created by Eduardo Escaleira on 03/03/23.
//

import UIKit

class Tela01VC: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editPictureButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cameraButton: UIButton!
    
    var data: [Profile] = []
    let imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        configTableView()
        configImagePicker()
//        view.backgroundColor =
    }
    
    func configImagePicker() {
        imagePicker.delegate = self
    }
    
    func configElements() {
        nameLabel.text = "Nome:"
        profileImageView.image = UIImage(systemName: "person.circle.fill")
//        profileImageView.tintColor = .black
        profileImageView.clipsToBounds = true // AS BORDAS PODEM SOFRER ALTERAÇÕES
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.contentMode = .scaleAspectFill
        nameTextField.placeholder = "Digite o seu nome:"
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    
    @IBAction func tappedCameraButton(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true)
        
    }
    @IBAction func tappedEditPictureButton(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        data.append(Profile(name: nameTextField.text ?? "", photo: profileImageView.image ?? UIImage()))
        nameTextField.text = "" // PARA DEIXAR A TXT VAZIA DEPOIS QUE CLICAR EM ADICIONAR
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        tableView.reloadData()
    }
    
}

extension Tela01VC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.setupCell(profile: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
}


extension Tela01VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImageView.image = image
        }
        
        picker.dismiss(animated: true)
        
    }
    
}
