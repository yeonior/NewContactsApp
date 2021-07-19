//
//  ContactsViewController.swift
//  NewContactsApp
//
//  Created by ruslan on 18.07.2021.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let profile = User(fullname: "Alex Richards", imageString: "human1", firstCharacter: "A", id: 20)
    let favouriteUsers = Bundle.main.decode([User].self, from: "favouriteUsers.json")
    let contactUsers = Bundle.main.decode([User].self, from: "contactUsers.json")
    
    let groupsBarButtonItem = UIBarButtonItem(title: "Groups", style: .plain, target: self, action: #selector(groupsBarButtonItemTapped))
    let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemTapped))
        
    enum Section: Int {
        case profile
        case favourites
        case contacts
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, User>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<Section, User>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupCollectionView()
        createDataSource()
        reloadData()
    }

    private func setupNavigationBar() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        navigationItem.leftBarButtonItem = groupsBarButtonItem
        navigationItem.rightBarButtonItem = addBarButtonItem
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Contacts"
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .gray
        view.addSubview(collectionView)
        
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.reuseId)
        collectionView.register(FavouriteCell.self, forCellWithReuseIdentifier: FavouriteCell.reuseId)
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.reuseId)
        
    }
    
    private func reloadData() {
        currentSnapshot = NSDiffableDataSourceSnapshot<Section, User>()
        
        currentSnapshot.appendSections([.profile, .favourites, .contacts])
        currentSnapshot.appendItems([profile], toSection: .profile)
        currentSnapshot.appendItems(favouriteUsers, toSection: .favourites)
        currentSnapshot.appendItems(contactUsers, toSection: .contacts)
        
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    // MARK: - DataSource
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, User>(collectionView: collectionView, cellProvider: { collectionView, indexPath, user in
            
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknow section type") }
            
            switch section {
            case .profile:
                return self.configure(collectionView: collectionView, cellType: ProfileCell.self, with: user, for: indexPath)
            case .favourites:
                return self.configure(collectionView: collectionView, cellType: FavouriteCell.self, with: user, for: indexPath)
            case .contacts:
                return self.configure(collectionView: collectionView, cellType: ContactCell.self, with: user, for: indexPath)
            }
        })
    }
}

// MARK: - Actions
extension ContactsViewController {
    
    @objc func groupsBarButtonItemTapped() {
        print(#function)
    }
    
    @objc func addBarButtonItemTapped() {
        print(#function)
    }
}

// MARK: - UISearchBarDelegate
extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


