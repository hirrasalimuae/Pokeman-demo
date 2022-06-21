//
//  ViewController.swift
//  Pokeman-demo
//
//  Created by Apple on 02/06/2022.
//

import UIKit
import CoreData
class HomeViewController: BaseViewController {
    @IBOutlet weak var customView : HomeView!
    var viewModel = HomeViewModel()
    var context: NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createAction()
    }

    override func configureView() {
        self.customView.userImageView.layer.cornerRadius =  self.customView.userImageView.frame.height/2
        self.customView.topLabel.text = viewModel.topLabelTitle
        self.customView.topLabel.font = UIFont.fontName(.RobotoRegular, size: 20)
        self.customView.listButton.setTitle(viewModel.listButtonTitle, for: .normal)
        self.customView.listButton.createButton(color: .black,font: UIFont.fontName(.MontserratMedium, size: 12),borderColor: .black,bortherWidth: 1,cornerRadius: 8)
        self.customView.bottomView.createView()
        self.customView.toggleView.layer.cornerRadius = 5
        self.customView.listButton.addTarget(self, action: #selector(self.listButton(_:)), for: .touchUpInside)

        
    }
    @objc func listButton(_ sender: UIButton){
        
    }
    func createAction(){
        
        let alert = UIAlertController(title: "Enter Credentials", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Username"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Password"
        }
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0].text ?? "" // Force unwrapping because we know it exists.
            let textField2 = alert?.textFields![1].text ?? ""  // Force unwrapping because we know it exists.
            DatastoreManager.shared.save(username: textField, password: textField2)
            
            print(DatastoreManager.shared.fetchAllSavedOptions())
            print("Text field: \(textField)")
        }))

        // 4. Present the alert.

        self.presentAlertController(alert)
    }

    
}

extension HomeViewController {
    
}
