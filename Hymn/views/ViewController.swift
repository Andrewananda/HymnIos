//
//  ViewController.swift
//  Hymn
//
//  Created by Andrew Ananda on 02/05/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel =  HymnViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rx.setDelegate(self)
        bindTableView()
    }
    
    private func bindTableView() {
        tableView.register(UINib(nibName: K.tableCells.hymnTableCell, bundle: nil), forCellReuseIdentifier: K.tableCells.hymnCellIdentifier)
        viewModel.hymns.bind(to: tableView.rx.items(cellIdentifier: K.tableCells.hymnCellIdentifier, cellType: HymnTableCell.self)) {
            (row, item, cell) in
            cell.title.text = item.title
            cell.hymnNumber.text = String(item.songNumber)
            cell.chorus.text = item.chorus
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Hymn.self).subscribe(onNext: { item in
            print("selected \(item.title)")
        }).disposed(by: bag)
        
        viewModel.fetchHymns()
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
