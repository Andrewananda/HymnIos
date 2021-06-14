//
//  ViewController.swift
//  Hymn
//
//  Created by Andrew Ananda on 02/05/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private let viewModel =  HymnViewModel()
    private let bag = DisposeBag()
    
    private var selectedHymn: Hymn?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoading()
        tableView.rx.setDelegate(self).disposed(by: bag)
        searchBar.delegate = self
        bindTableView()
    }
    
    private func bindTableView() {
        tableView.register(UINib(nibName: K.tableCells.hymnTableCell, bundle: nil), forCellReuseIdentifier: K.tableCells.hymnCellIdentifier)
        
        viewModel.hymnObservable.bind(to: tableView.rx.items(cellIdentifier: K.tableCells.hymnCellIdentifier, cellType: HymnTableCell.self)) { [self]
            (row, item, cell) in
            cell.title.text = item.title
            cell.hymnNumber.text = String(item.songNumber)
            cell.chorus.text = item.chorus
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Hymn.self).subscribe(onNext: {[weak self] item in
            self?.selectedHymn = item
            self?.performSegue(withIdentifier: K.segueIdentifier.hymnSegue, sender: self)
        }).disposed(by: bag)
        
        viewModel.fetchHymns()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segueIdentifier.hymnSegue {
            let vc = segue.destination as! HymnViewController
            vc.titleLabel = selectedHymn?.title
            vc.hymnSong = selectedHymn?.song
        }
    }
    
    private func showLoading() {
        viewModel.showLoading.subscribe(onNext: {[weak self] value in
            if(value) {
                self?.loadingIndicator.startAnimating()
            } else {
                self?.loadingIndicator.stopAnimating()
                self?.loadingIndicator.hidesWhenStopped = true
            }
        }).disposed(by: bag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let hymnTitle = searchBar.text else {return}
        searchHymn(for: hymnTitle)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
    }
    
}

extension ViewController {
    private func searchHymn(for name: String) {
        self.loadingIndicator.startAnimating()
        viewModel.searchHymn(value: name)
    }
}
