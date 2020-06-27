//
//  GameStroeController.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/25.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

class MainViewController: UIViewController {
    
    var games: [Game] = []
    lazy var gameStore = GameStore.shared
    
    var collectionView : UICollectionView! = nil
    var sections:[SectionLayoutKind] = []
    
    var selectedGenres: Set<GenerType> = []
    var selectedPlatfrom: Set<PlatformType> = []
    var selectedSort: SortType = .popularity
    
    var dataSource: UICollectionViewDiffableDataSource<SectionLayoutKind, Item>! = nil
    
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        
        configureCollectionView()
        configureDataSource()
        configureSearchController()
        
        self.loadGames()
        
    }
    
    private func configureSearchController(){
        searchController.showsSearchResultsController = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
    }
    
    private func loadGames() {
        gameStore.fetchGame(with: .games) { (result) in
            switch result{
            case .success(let games):
                DispatchQueue.main.async { [weak self] in
                    self?.navigationItem.titleView = self?.searchController.searchBar
                    self?.games = games
                    self?.updateUI()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func updateUI(){
        let snapshots = createSnapShots()
        dataSource.apply(snapshots, animatingDifferences: true)
    }
    
    // MARK: - DataSource
    private func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<SectionLayoutKind, Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            switch item.itemType {
            case .genre(let type as CustomStringConvertible, let isSelected),
                 .platfrom(let type as CustomStringConvertible, let isSelected),
                 .sort(let type as CustomStringConvertible, let isSelected):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BageItemCollectionViewCell.reusedId, for: indexPath) as! BageItemCollectionViewCell
                cell.configure(text: type.description, isSelected: isSelected)
                return cell
                
            case .game(let game):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameItemCollectionViewCell.reusedId, for: indexPath) as! GameItemCollectionViewCell
                cell.configure(game: game)
                return cell
            }
        })
        
        let snapShots = createSnapShots()
        dataSource.apply(snapShots, animatingDifferences: false)
        
    }
    
    
    private func createSnapShots() -> NSDiffableDataSourceSnapshot<SectionLayoutKind, Item> {
        var snapShots = NSDiffableDataSourceSnapshot<SectionLayoutKind, Item>()
        var sections = [SectionLayoutKind]()
        
        // genre
        let genreSectionKind = createGenreSectionKind()
        snapShots.appendSections([genreSectionKind])
        snapShots.appendItems(genreSectionKind.kind.items)
        sections.append(genreSectionKind)
        
        // platform
        let platfromSectionKind = createPlatformSectionKind()
        snapShots.appendSections([platfromSectionKind])
        snapShots.appendItems(platfromSectionKind.kind.items)
        sections.append(platfromSectionKind)
        
        
        // games
        let sortSectionKind = createSortSectionKind()
        snapShots.appendSections([sortSectionKind])
        snapShots.appendItems(sortSectionKind.kind.items)
        sections.append(sortSectionKind)
        
        let gameSectionKind = createGameSection()
        snapShots.appendSections([gameSectionKind])
        snapShots.appendItems(gameSectionKind.kind.items)
        sections.append(gameSectionKind)
        
        self.sections = sections
        return snapShots
    }
    
    private func createGameSection() -> SectionLayoutKind {
        var games: [Game] = []
        
        // search
        let searchText = (self.searchController.searchBar.text ?? "")
        if !searchText.isEmpty {
            games = self.games.filter{ $0.name.contains(searchText) }.sorted{ $0.name > $1.name}
        } else {
            games = self.games
        }
        
        // genre
        if self.selectedGenres.count > 0 {
            // 选中的游戏类型
            let selectedGenresIds = self.selectedGenres.map{ $0.id }
            games = games.filter{
                // 一条游戏本身属于的类型
                let gameGenresIds = Set( $0.genres.map{ Int($0.id) })
                return gameGenresIds.intersection(selectedGenresIds).count > 0
            }
        }
        
        // platform
        if self.selectedPlatfrom.count > 0 {
            let selectedPlatformIds = self.selectedPlatfrom.map{ $0.id }
            games = games.filter{
                let gamePlatfromIds = Set( $0.platforms.map{ Int($0.id) })
                return gamePlatfromIds.intersection(selectedPlatformIds).count > 0
            }
        }
        
        
        switch self.selectedSort {
        case .popularity:
            games = games.sorted{ $0.popularity > $1.popularity}
            
        case .rating:
            games = games.sorted{ $0.id > $1.id}   //BUG: 因为rating会存在没值，所以用ID
            
        case .releaseData:
            games = games.sorted{ $0.firstReleaseDate > $1.firstReleaseDate}
            
        }
        
        return SectionLayoutKind(kind: GameSection(items: games.map{ Item(itemType: .game($0) )}))
    }
    
    // SortSection
    private func createSortSectionKind() -> SectionLayoutKind {
        let items = SortType.allCases.map{ s -> Item in
            let isSelected = self.selectedSort == s
            return Item(itemType: .sort(type: s, isSelected: isSelected))
        }
        return SectionLayoutKind(kind: SortSection(items: items))
    }
    
    
    // PlatformSection
    private func createPlatformSectionKind() -> SectionLayoutKind {
        let items = PlatformType.allCases.map{ p ->Item in
            let isSelected: Bool
            switch p {
            case .all:
                isSelected = self.selectedPlatfrom.isEmpty ? true : false
            default:
                isSelected = self.selectedPlatfrom.contains(p)
            }
            return Item(itemType: .platfrom(type: p, isSelected: isSelected))
        }
        
        return SectionLayoutKind(kind: PlatfromSection(items: items))
    }
    
    // GenreSection
    private func createGenreSectionKind() -> SectionLayoutKind {
        let items = GenerType.allCases.map{ g ->Item in
            let isSelected: Bool
            switch g {
            case .all:
                isSelected = self.selectedGenres.isEmpty ? true : false
            default:
                isSelected = self.selectedGenres.contains(g)
            }
            return Item(itemType: .genre(type: g, isSelected: isSelected))
        }
        
        return SectionLayoutKind(kind: GenerSection(items: items))
    }
    
    // MARK: - CollectionView
    private func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        
        view.addSubview(collectionView)
        
        collectionView.register(BageItemCollectionViewCell.self, forCellWithReuseIdentifier: BageItemCollectionViewCell.reusedId)
        collectionView.register(GameItemCollectionViewCell.self, forCellWithReuseIdentifier: GameItemCollectionViewCell.reusedId)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        
        self.collectionView = collectionView
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (selctionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard !self.sections.isEmpty else {
                return nil
            }
            switch self.sections[selctionIndex].kind {
                
            case is GenerSection, is PlatfromSection, is SortSection:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(150), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(150), heightDimension: .absolute(40))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 8
                section.contentInsets = .init(top: 4, leading: 8, bottom: 4, trailing: 8)
                section.orthogonalScrollingBehavior = .continuous
                
                return section
                
            case is GameSection:
                
                let imageWidth:CGFloat = 150
                let imageMutipler = 200.0 / imageWidth
                
                let containerWidth = layoutEnvironment.container.effectiveContentSize.width
                let itemCount = containerWidth / imageWidth
                let itemWidth = imageWidth * (itemCount / ceil(itemCount))
                let itemHeight = itemWidth * imageMutipler
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(itemHeight))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 8, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            default:
                return nil
                
            }
        }
        return layout
    }
    
    
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        
        switch item.itemType {
        case .genre(let type, let isSelected):
            switch type {
            case .all:
                self.selectedGenres = []
            default:
                if isSelected {
                    self.selectedGenres.remove(type)
                } else {
                    self.selectedGenres.insert(type)
                }
            }
        case .platfrom(let type, let isSelected):
               switch type {
               case .all:
                   self.selectedPlatfrom = []
               default:
                   if isSelected {
                       self.selectedPlatfrom.remove(type)
                   } else {
                       self.selectedPlatfrom.insert(type)
                   }
               }
        case .sort(let type, _):
            self.selectedSort = type
        default:
            return
        }
        updateUI()
    }
}


extension MainViewController : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        updateUI()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
