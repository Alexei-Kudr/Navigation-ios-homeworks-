//
//  ProfileViewController.swift
//  Navigation
//
//

import UIKit
import StorageService

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var userService: User?

    
    static let headerIdent = "header"
    static let photoIdent = "photo"
    static let postIdent = "post"
    
    static var postTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: headerIdent)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: photoIdent)
        table.register(PostTableViewCell.self, forCellReuseIdentifier: postIdent)
        return table
    }()
    
    public let post = ProfilePost.posts()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = UIView() //Хедер таблицы
//        tableView.tableFooterView = UIView(frame: .zero) //Футер таблицы (обычно нулевой)
        tableView.rowHeight = UITableView.automaticDimension //высота ячейки автоматического размера в зависимости от контента (По умолчанию это свойство имеет значение automaticDimension)
        tableView.estimatedRowHeight = 44 //примерный расчет высоты ячеек
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView") //регестрируем кастомную ячейку и добовляем индификатор (нужен для переиспользования)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.debug()
    }
    
    private func debug() {
        #if DEBUG
        self.tableView.backgroundColor = .systemTeal
        #else
        self.tableView.backgroundColor = .white
        #endif
    }
    
    private func setupTableView() {
        self.view.addSubview(self.tableView) //tableView по уровню Constraint view
        
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
    }
    
    //MARK: - DataSource (Источник данных)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return post.count
        default:
            assertionFailure("no registered section")
            return 1
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = Self.postTableView.dequeueReusableCell(withIdentifier: Self.photoIdent, for: indexPath) as! PhotosTableViewCell
            return cell
        case 1:
            let cell = Self.postTableView.dequeueReusableCell(withIdentifier: Self.postIdent, for: indexPath) as! PostTableViewCell
            cell.configure(post: ProfilePost.posts()[indexPath.row])
            return cell
        default:
            assertionFailure("no registered section")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as? ProfileHeaderView
            headerView?.configurationHeader(user: user)
            return  headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            tableView.deselectRow(at: indexPath, animated: false)
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        case 1:
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            if let post = cell as? PostTableViewCell {
                post.incrementPostViewsCounter()
            }
        default:
            assertionFailure("no registered section")
        }
    }


}
    
    
    //MARK: - Delegate (позволяют делегату управлять выборами, конфигурировать заголовки раздела и нижние колонтитулы, помогать удалить и переупорядочить ячейки и выполнить другие действия.)
    
    
    


