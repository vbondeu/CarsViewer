//
//  CarsListTableViewController.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
@testable import BVCarSharing

class CarsListTableViewController: UITableViewController, CarsListTableViewControllerProtocol {

    let carCellIdentifier = "carCellIdentifier"
    var presenter : CarsListPresenter?
    var carsList : Results<Car>!
    var notificationToken: NotificationToken? = nil
    
    lazy var pullToRefreshControl: UIRefreshControl = {
        let pullToRefreshControl = UIRefreshControl()
        pullToRefreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return pullToRefreshControl
    }()
    
    // MARK: - UI Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.refreshData()
        self.addRealmNotifications()
        self.configureView()
    }

    func configureView() {
        self.tableView.addSubview(self.pullToRefreshControl)
    }
    
    // MARK: - Actions
    
    func refreshData() {
        self.presenter?.updateView()
        self.pullToRefreshControl.endRefreshing()
    }
    
    @IBAction func dismissViewController(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - CarsListTableViewControllerProtocol
    
    func showData(cars: Results<Car>) {
        self.carsList = cars
        self.reloadEntries()
    }
    
    func reloadEntries() {
        self.tableView.setEditing(false, animated: true)
        self.tableView.reloadData()
    }
    
    func showConnectionError(error: Error) {
        self.present(AlertController.okDialog(title: error.localizedDescription), animated: true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: carCellIdentifier, for: indexPath) as! CarTableViewCell

        cell.car = carsList[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let car = self.carsList[indexPath.row]
        self.navigationController?.dismiss(animated: true, completion: nil)
        self.presenter?.carsMapWireframe?.showCarOnMap(car: car)        
    }
    
    // Realm - Notifications
    
    func addRealmNotifications() {
        self.notificationToken = carsList.addNotificationBlock {
            [unowned self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                self.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: insertions.map( {
                    IndexPath(row: $0, section: 0)}), with: .fade)
                self.tableView.deleteRows(at: deletions.map( {
                    IndexPath(row: $0, section: 0) }),
                                          with: .fade)
                self.tableView.reloadRows(at: modifications.map( {
                    IndexPath(row: $0, section: 0) }),
                                          with: .automatic)
                self.tableView.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
}
