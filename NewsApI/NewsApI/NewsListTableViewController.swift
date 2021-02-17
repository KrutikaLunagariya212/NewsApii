//
//  NewsListTableViewController.swift
//  NewsApI
//
//  Created by krutika on 2/16/21.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    var article = ArticleListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    func setUpView(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        article.didLoadChangeData = {
            print(self.article)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return article.numberOfSection
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.numberOfRowOfSection(section: section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? NewsTableViewCell else{
            fatalError("NewsTableViewCell not found")
        }
        cell.titlelbl.text = article.articleAtIndex(index: indexPath.row).title
        cell.descriptionLbl.text = article.articleAtIndex(index: indexPath.row).description
        return cell
    }
}
