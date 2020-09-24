//
//  GuideVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 9/24/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit



import UIKit
struct Section {
    var genre: String!
    var movies: [Info]!
    var expanded: Bool!
    init(genre: String, movies: [Info], expanded: Bool) {
        self.genre = genre
        self.movies = movies
        self.expanded = expanded
    }
}
class GuideVC: UIViewController, UITableViewDataSource, UITableViewDelegate, ExpandableHeaderViewDelegate {
    func tongleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        tableView.beginUpdates()
        for i in 0 ..< sections[section].movies.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }

    @IBOutlet weak var tableView: UITableView!
    var sections = [
        Section(genre: "👻 Danh Lam Thắng Cảnh", movies: [Info(mainImg: UIImage(named: "banaHill"), profileImg: UIImage(named: "suli"), title: "Ai đi bà nà không?", position: "Đà Nẵng", place: "Bà nà Hill", name: "Su Li", time: "09:00 AM", date: "21/11/2019", job: "Kế toán", tickImg: UIImage(named: "checked")),
                                                                Info(mainImg: UIImage(named: "daLat"), profileImg: UIImage(named: "lily"), title: "Đà lạt lạnh quá?", position: "Đà Lạt", place: "Lâm đồng, Đà Lạt", name: "LiLy Maymac", time: "11:00 AM", date: "07/11/2010", job: "Sinh Viên", tickImg: UIImage(named: "cancel")),
                                                                Info(mainImg: UIImage(named: "langBac"), profileImg: UIImage(named: "duongTu"), title: "Lăng bác cùng đồng đội", position: "Hà Nội", place: "Lăng bác hồ", name: "Dương Tử", time: "02:00 PM", date: "21/12/2019", job: "Quản lí", tickImg: UIImage(named: "checked")),
                                                                Info(mainImg: UIImage(named: "muCangChai"), profileImg: UIImage(named: "huongGiang"), title: "Tìm bạn Việt Nam dẫn đi chơi", position: "Tây bắc", place: "Mù Cang Chải", name: "Hương Giang", time: "08:00 AM", date: "04/12/2019", job: "Kinh doanh tự do", tickImg: UIImage(named: "checked"))
        ], expanded: false),
        Section(genre: "👻 Di Tích Lịch Sử", movies: [Info(mainImg: UIImage(named: "daLat"), profileImg: UIImage(named: "lily"), title: "Đà lạt lạnh quá?", position: "Đà Lạt", place: "Lâm đồng, Đà Lạt", name: "LiLy Maymac", time: "11:00 AM", date: "07/11/2010", job: "Sinh Viên", tickImg: UIImage(named: "cancel")),Info(mainImg: UIImage(named: "daLat"), profileImg: UIImage(named: "lily"), title: "Đà lạt lạnh quá?", position: "Đà Lạt", place: "Lâm đồng, Đà Lạt", name: "LiLy Maymac", time: "11:00 AM", date: "07/11/2010", job: "Sinh Viên", tickImg: UIImage(named: "cancel"))], expanded: false),
        Section(genre: "👻 Địa Điểm Ăn Uống", movies: [Info(mainImg: UIImage(named: "daLat"), profileImg: UIImage(named: "lily"), title: "Đà lạt lạnh quá?", position: "Đà Lạt", place: "Lâm đồng, Đà Lạt", name: "LiLy Maymac", time: "11:00 AM", date: "07/11/2010", job: "Sinh Viên", tickImg: UIImage(named: "cancel")),Info(mainImg: UIImage(named: "daLat"), profileImg: UIImage(named: "lily"), title: "Đà lạt lạnh quá?", position: "Đà Lạt", place: "Lâm đồng, Đà Lạt", name: "LiLy Maymac", time: "11:00 AM", date: "07/11/2010", job: "Sinh Viên", tickImg: UIImage(named: "cancel"))], expanded: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let nibHomeTableView = UINib.init(nibName: "HomeTableViewCell", bundle: nil)
        self.tableView.register(nibHomeTableView, forCellReuseIdentifier: "CellGuide")
//
        // Do any additional setup after loading the view.
    }

    //Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].movies.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(self.sections[indexPath.section].expanded) {
            return 350
        }
        else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].genre, section: section, delegate: self)
        return header
    }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellGuide", for: indexPath) as! HomeTableViewCell
           cell.configCell(sections[indexPath.section].movies[indexPath.row])
            return cell
        }

}





//
//
//class GuideVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//
//
//    @IBOutlet weak var tableView: UITableView!
//    var listInfo:[Info] = [];
//    var listDiscovery = ["Danh Lam Thắng Cảnh", "Di Tích Lịch Sử", "Địa Điểm Ăn Uống"]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        listInfo = Info.initInfo()
//        tableView.delegate = self
//        tableView.dataSource = self
//        let nibHomeTableView = UINib.init(nibName: "HomeTableViewCell", bundle: nil)
//        self.tableView.register(nibHomeTableView, forCellReuseIdentifier: "CellGuide")
//
//        // Do any additional setup after loading the view.
//    }
//
//    //Table View
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return listDiscovery.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return listDiscovery[section]
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listInfo.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellGuide", for: indexPath) as! HomeTableViewCell
//        cell.configCell(listInfo[indexPath.row])
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//    }
//
//}
