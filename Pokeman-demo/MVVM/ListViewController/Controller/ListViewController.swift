//
//  ListViewController.swift
//  Pokeman-demo
//
//  Created by Apple on 03/06/2022.
//

import UIKit

class ListViewController: BaseViewController {
    let identifier = "ListTableViewCell"
    @IBOutlet weak var customView: ListView!
    var usersList = [UserInfo]()
    private var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOuputObservables()
        
    }
    override func configureView() {
        self.customView.tableView.delegate = self
        self.customView.tableView.dataSource = self
        self.customView.tableView.register( UINib(nibName: self.identifier, bundle: nil), forCellReuseIdentifier: self.identifier)
        self.customView.saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        
    }
    func setUpOuputObservables() {
        viewModel.reloadTable = {[weak self] in
            
            DispatchQueue.main.async {
                
                self?.customView.tableView.reloadData()
            }
        }
    }
    @objc func saveTapped(){
        
        
    }
    private func cellForListTableAt(indexPath: IndexPath) -> ListTableViewCell {
        let cell: ListTableViewCell = customView.tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! ListTableViewCell
        cell.configure(info: viewModel.cellInfo(for: indexPath.row))
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForListTableAt(indexPath: indexPath)
        
    }
}
extension ListViewController : TableViewCellDelegate{
    func statusChanged(_ index: Int, isSelected: Bool) {
    }
    
}
