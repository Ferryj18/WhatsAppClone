//
//  RecentChatTableViewController.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 22/11/24.
//

import UIKit

class RecentChatTableViewController: UITableViewController {
  // MARK: - Vars
  var allRecentChats: [RecentChat] = []
  var filteredRecentChats: [RecentChat] = []
  
  let searchController = UISearchController(searchResultsController: nil)
  // mark life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.tableFooterView = UIView()
    self.tableView.tableHeaderView = UIView()
    setupRefreshControl()
    fetchRecentChat()
    setupSearchController()
  }
  // MARK: - Setup UI
  private func setupRefreshControl() {
    self.refreshControl = UIRefreshControl()
    self.tableView.refreshControl = refreshControl
  }
  override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    guard let refreshControl = self.refreshControl else { return }
    
    if refreshControl.isRefreshing {
      self.fetchRecentChat()
      refreshControl.endRefreshing()
    }
  }
  private func setupSearchController() {
          navigationItem.searchController = searchController
          navigationItem.hidesSearchBarWhenScrolling = true
          
          searchController.obscuresBackgroundDuringPresentation = false
          searchController.searchBar.placeholder = "Search User"
          searchController.searchResultsUpdater = self
          definesPresentationContext = true
      }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "recentChat", for: indexPath) as! RecentChatTableViewCell
    let recentChat = searchController.isActive ? filteredRecentChats[indexPath.row] : allRecentChats[indexPath.row]
    cell.configure(recent: recentChat)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return searchController.isActive ? filteredRecentChats.count : allRecentChats.count
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let recentChat = searchController.isActive ? filteredRecentChats[indexPath.row] : allRecentChats[indexPath.row]
    
    // Update counter badge
    FirebaseRecentChatListener.shared.clearUnreadCounter(recentChat: recentChat)
    
    //          // Navigate to chat room
    //          navigateToChatRoom(recent: recentChat)
  }
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         return true
     }
     
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             let recentChat = searchController.isActive ? filteredRecentChats[indexPath.row] : allRecentChats[indexPath.row]
             FirebaseRecentChatListener.shared.delete(recentChat: recentChat)
             searchController.isActive ? filteredRecentChats.remove(at: indexPath.row) : allRecentChats.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .automatic)
         }
     }
  
  // mark : private func
  private func fetchRecentChat(){
 
    FirebaseRecentChatListener.shared.downloadRecentChatsFromFirestore { recentChats in
      
      print("fetching recent chat\(recentChats)")
      self.allRecentChats = recentChats
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  private func filterContent(text: String) {
        filteredRecentChats = allRecentChats.filter({ recentChat in
            return recentChat.receiverName.lowercased().contains(text.lowercased())
        })
        tableView.reloadData()
    }
}
extension RecentChatTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContent(text: searchController.searchBar.text!)
    }
}
