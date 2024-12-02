//
//  ContactsTableViewController.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 21/11/24.
//

import UIKit

class ContactsTableViewController: UITableViewController {
  
  var allUsers: [User] = []
  var filteredUsers: [User] = []
  
  let searchController = UISearchController(searchResultsController: nil)
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //    createDummyUsers()
    setupRefreshControl()
    fetchUsersData()
    setupSearchBar()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
  }
  override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
         
         navigationItem.largeTitleDisplayMode = .always
         navigationController?.navigationBar.prefersLargeTitles = true
     }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchController.isActive ? filteredUsers.count : allUsers.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // #warning Incomplete implementation, return the number of rows
    let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as! ContactsTableViewCell
    let user = searchController.isActive ? filteredUsers[indexPath.row] : allUsers[indexPath.row]
    cell.configure(user: user)
    return cell
  }
  // MARK: - Table view delegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
              let user = searchController.isActive ? filteredUsers[indexPath.row] : allUsers[indexPath.row]
              navigateToProfileScreen(user)
  }
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              // Hapus data dari array
            allUsers.remove(at: indexPath.row)
              // Hapus baris dari tabel dengan animasi
              tableView.deleteRows(at: [indexPath], with: .fade)
          }
      }
  override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
          // Hapus data
        self.allUsers.remove(at: indexPath.row)
          self.tableView.deleteRows(at: [indexPath], with: .fade)
          completionHandler(true)
      }
      
      return UISwipeActionsConfiguration(actions: [deleteAction])
  }
  //  setup UI
  private func setupSearchBar() {
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = true
    
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Contact"
    searchController.searchResultsUpdater = self
    definesPresentationContext = true
  }
  private func setupRefreshControl() {
         self.refreshControl = UIRefreshControl()
         self.tableView.refreshControl = refreshControl
     }
  override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         guard let refreshControl = self.refreshControl else { return }
         
         if refreshControl.isRefreshing {
             self.fetchUsersData()
             refreshControl.endRefreshing()
         }
     }
    
  //  SetupData
  private func fetchUsersData() {
    FirebaseUserListener.shared.downloadAllUsersFromFirestore { users in
      self.allUsers = users
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  private func filterUser(text: String) {
         filteredUsers = allUsers.filter({ (user) -> Bool in
             return user.username.lowercased().contains(text.lowercased())
         })
         tableView.reloadData()
     }
  // MARK: - Navigation
     private func navigateToProfileScreen(_ user: User) {
       let profileView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileView") as! ProfileTableViewController
    
//         let profileView = ProfileViewController()
         profileView.viewModel = ProfileViewModel(user: user)
         self.navigationController?.pushViewController(profileView, animated: true)
     }
 }
     
extension ContactsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterUser(text: searchController.searchBar.text!)
    }
}
