//
//  ProfileDesignViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/09/12.
//

import UIKit
import SnapKit

class ProfileDesignViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureUI()
    }
    
    func ConfigureUI () {
        // View배경화면 지정
        view.backgroundColor = .systemBackground
        
        // 뒤로가기 버튼
        let backButton = UIButton()
        view.addSubview(backButton)
        backButton.setTitle("뒤로가기", for: .normal)
        backButton.setTitleColor(.systemBlue, for: .normal)
        backButton.addTarget(self, action: #selector(BackButtonClick), for: .touchUpInside)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
        }
        
        // 유저 닉네임 타이틀
        let userTitle = UILabel()
        view.addSubview(userTitle)
        userTitle.text = "nabaecamp"
        userTitle.font = UIFont.boldSystemFont(ofSize: 20)
        userTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        // 메뉴 버튼
        let menuButton = UIButton()
        view.addSubview(menuButton)
        menuButton.setImage(UIImage(named: "Menu"), for: .normal)
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalToSuperview().inset(14)
        }
        
        // 유저 프로필 사진 추후 동그랗게 만드는 과정 필요
        let userPic = UIImageView()
        view.addSubview(userPic)
        userPic.image = UIImage(named: "spartan")
        userPic.snp.makeConstraints { make in
            make.top.equalTo(userTitle.snp.bottom).offset(14)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        //유저 정보(포스트, 팔로워, 팔로잉 스택)
        let userPostStackView = UIStackView()
        userPostStackView.translatesAutoresizingMaskIntoConstraints = false
        userPostStackView.alignment = .center
        userPostStackView.axis = .vertical
        let userPosts = UILabel()
        let userPostsNumber = UILabel()
        userPostsNumber.text = "7"
        userPostsNumber.font = UIFont.boldSystemFont(ofSize: 20)
        userPosts.text = "post"
        userPostStackView.addArrangedSubview(userPostsNumber)
        userPostStackView.addArrangedSubview(userPosts)
        
        let userFollowerStackView = UIStackView()
        userFollowerStackView.translatesAutoresizingMaskIntoConstraints = false
        userFollowerStackView.alignment = .center
        userFollowerStackView.axis = .vertical
        let userFollower = UILabel()
        let userFollowerNumber = UILabel()
        userFollowerNumber.text = "1"
        userFollowerNumber.font = UIFont.boldSystemFont(ofSize: 20)
        userFollower.text = "follower"
        userFollowerStackView.addArrangedSubview(userFollowerNumber)
        userFollowerStackView.addArrangedSubview(userFollower)
        
        let userFollowingStackView = UIStackView()
        userFollowingStackView.translatesAutoresizingMaskIntoConstraints = false
        userFollowingStackView.alignment = .center
        userFollowingStackView.axis = .vertical
        let userFollowing = UILabel()
        let userFollowingNumber = UILabel()
        userFollowingNumber.text = "0"
        userFollowingNumber.font = UIFont.boldSystemFont(ofSize: 20)
        userFollowing.text = "following"
        userFollowingStackView.addArrangedSubview(userFollowingNumber)
        userFollowingStackView.addArrangedSubview(userFollowing)
        
        // 유저 인포 스택 (포스트, 팔로워, 팔로잉)
        let userFollowInfo = UIStackView()
        view.addSubview(userFollowInfo)
        userFollowInfo.translatesAutoresizingMaskIntoConstraints = false
        userFollowInfo.alignment = .center
        userFollowInfo.distribution = .equalCentering
        userFollowInfo.axis = .horizontal
        userFollowInfo.spacing = 5
        userFollowInfo.addArrangedSubview(userPostStackView)
        userFollowInfo.addArrangedSubview(userFollowerStackView)
        userFollowInfo.addArrangedSubview(userFollowingStackView)
        userFollowInfo.snp.makeConstraints { make in
            make.top.equalTo(userTitle.snp.bottom).offset(28)
            make.left.equalTo(userPic.snp.right).offset(28)
            make.right.equalToSuperview().inset(28)
        }
        
        
        // 유저 이름 정보
        let userName = UILabel()
        view.addSubview(userName)
        userName.text = "르탄이"
        userName.font = UIFont.boldSystemFont(ofSize: 20)
        userName.snp.makeConstraints { make in
            make.top.equalTo(userPic.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(14)
        }
        
        // 유저 설명(Description)
        let userDescription = UILabel()
        view.addSubview(userDescription)
        userDescription.text = "iOS Developer🍎"
        userDescription.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(14)
            make.top.equalTo(userName.snp.bottom).offset(2)
        }
        
        // 유저 링크(HyperLink)
        let userHyperLink = UILabel()
        view.addSubview(userHyperLink)
        userHyperLink.text = "spartacodingclub.kr"
        userHyperLink.textColor = .systemBlue
        userHyperLink.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(14)
            make.top.equalTo(userDescription.snp.bottom).offset(2)
        }
        
        // 팔로우버튼
        let followButton = UIButton()
        followButton.setTitle("Follow", for: .normal)
        followButton.backgroundColor = .systemBlue
        followButton.layer.cornerRadius = 10
        
        // 메시지버튼
        let messageButton = UIButton()
        messageButton.setTitle("Message", for: .normal)
        messageButton.setTitleColor(UIColor.black, for: .normal)
        messageButton.layer.borderWidth = 1
        messageButton.layer.borderColor = UIColor.systemGray3.cgColor
        messageButton.layer.cornerRadius = 10
        
        //더보기버튼
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "Vector 8"), for: .normal)
        moreButton.layer.borderWidth = 1
        moreButton.layer.borderColor = UIColor.systemGray3.cgColor
        moreButton.layer.cornerRadius = 10
        moreButton.snp.makeConstraints { make in
            make.width.height.equalTo(34)
        }
        
        // 미들바 내부스택(팔로우버튼, 메시지버튼 크기 동일하게 하기 위함)
        let middleBarSubStack = UIStackView()
        middleBarSubStack.translatesAutoresizingMaskIntoConstraints = false
        middleBarSubStack.axis = .horizontal
        middleBarSubStack.distribution = .fillEqually
        middleBarSubStack.spacing = 8
        middleBarSubStack.addArrangedSubview(followButton)
        middleBarSubStack.addArrangedSubview(messageButton)
        
        // 미들바 스택뷰
        let middleBar = UIStackView()
        view.addSubview(middleBar)
        middleBar.translatesAutoresizingMaskIntoConstraints = false
        middleBar.distribution = .fillProportionally
        middleBar.axis = .horizontal
        middleBar.spacing = 8
        middleBar.addArrangedSubview(middleBarSubStack)
        middleBar.addArrangedSubview(moreButton)
        
        middleBar.snp.makeConstraints { make in
            make.top.equalTo(userHyperLink.snp.bottom).offset(14)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(14)
            make.height.equalTo(34)
        }
        
        // 첫번째 디바이더
        let divider1 = UIImageView()
        view.addSubview(divider1)
        divider1.image = UIImage(named: "Divider")
        divider1.snp.makeConstraints { make in
            make.top.equalTo(middleBar.snp.bottom).offset(14)
            make.width.equalTo(view.safeAreaLayoutGuide)
        }
        
        // nagGallery 스택뷰를 위한 스택요소들
        let grid1 = UIImageView()
        grid1.image = UIImage(named: "Grid")
        grid1.snp.makeConstraints { make in
            make.width.height.equalTo(22.5)
        }
        let sectionIndicator1 = UIImageView()
        sectionIndicator1.image = UIImage(named: "Section indicator")
        
        
        let navStack1 = UIStackView()
        navStack1.axis = .vertical
        navStack1.alignment = .center
        navStack1.spacing = 10
        navStack1.addArrangedSubview(grid1)
        navStack1.addArrangedSubview(sectionIndicator1)
        sectionIndicator1.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        
        let grid2 = UIImageView()
        //        grid2.image = UIImage(named: "Grid")
        grid2.tag = 2
        grid2.snp.makeConstraints { make in
            make.width.height.equalTo(22.5)
        }
        let sectionIndicator2 = UIImageView()
        //        sectionIndicator2.image = UIImage(named: "Section indicator")
        
        let navStack2 = UIStackView()
        navStack2.axis = .vertical
        navStack2.alignment = .center
        navStack2.spacing = 10
        navStack2.addArrangedSubview(grid2)
        navStack2.addArrangedSubview(sectionIndicator2)
        sectionIndicator2.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        let grid3 = UIImageView()
        //        grid3.image = UIImage(named: "Grid")
        grid3.snp.makeConstraints { make in
            make.width.height.equalTo(22.5)
        }
        let sectionIndicator3 = UIImageView()
        //        sectionIndicator3.image = UIImage(named: "Section indicator")
        
        let navStack3 = UIStackView()
        navStack3.axis = .vertical
        navStack3.alignment = .center
        navStack3.spacing = 10
        navStack3.addArrangedSubview(grid3)
        navStack3.addArrangedSubview(sectionIndicator3)
        sectionIndicator3.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        // navGallery 스택뷰
        let navGallery = UIStackView()
        view.addSubview(navGallery)
        navGallery.axis = .horizontal
        navGallery.distribution = .fillEqually
        navGallery.spacing = 2
        navGallery.addArrangedSubview(navStack1)
        navGallery.addArrangedSubview(navStack2)
        navGallery.addArrangedSubview(navStack3)
        navGallery.snp.makeConstraints { make in
            make.top.equalTo(divider1.snp.bottom).offset(14)
            make.width.equalTo(view.safeAreaLayoutGuide)
        }
        
        // 하단 탭바(컬렉션 뷰의 크기 결정을 위해 먼저 적용)
        let tabBar = UITabBar(frame: .zero)
        view.addSubview(tabBar)
        tabBar.snp.makeConstraints { make in
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(86)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        let personImage = UIImageView(image: UIImage(systemName: "person.fill"))
        personImage.tintColor = .black
        tabBar.addSubview(personImage)
        personImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(22.75)
            make.width.equalTo(22.5)
        }
        
        // picCollectionView의 레이아웃
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.itemSize = CGSize(width: view.bounds.width/3 - 2 , height: view.bounds.width/3 - 2)
        
        // picCollectionView
        let picCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        picCollectionView.dataSource = self
        picCollectionView.delegate = self
        view.addSubview(picCollectionView)
        picCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        picCollectionView.snp.makeConstraints { make in
            make.top.equalTo(navGallery.snp.bottom)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(tabBar.snp.top)
        }
        
        // 두번째 디바이더
        let divider2 = UIImageView()
        view.addSubview(divider2)
        divider2.image = UIImage(named: "Divider")
        divider2.snp.makeConstraints { make in
            make.top.equalTo(picCollectionView.snp.bottom)
            make.width.equalTo(view.safeAreaLayoutGuide)
        }
        
        

        //버튼에 대한 함수들(기능 추가?)
        menuButton.addTarget(self, action: #selector(MenuButtonClick), for: .touchUpInside)
        followButton.addTarget(self, action: #selector(FollowButtonClick), for: .touchUpInside)
        messageButton.addTarget(self, action: #selector(MessageButtonClick), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(MoreButtonClick), for: .touchUpInside)
    }
    
    @objc func BackButtonClick(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func MenuButtonClick(_ sender: UIButton) {
        print("MenuButtonClick")
    }
    
    @objc func FollowButtonClick(_ sender: UIButton) {
        print("FollowButtonClick")
    }
    
    @objc func MessageButtonClick(_ sender: UIButton) {
        print("MessageButtonClick")
    }
    
    @objc func MoreButtonClick(_ sender: UIButton) {
        print("MoreButtonClick")
    }
    
}

let pics = [UIImage(named: "picture-1"),
            UIImage(named: "picture-2"),
            UIImage(named: "picture-3"),
            UIImage(named: "picture-4"),
            UIImage(named: "picture-5"),
            UIImage(named: "picture-6"),
            UIImage(named: "picture-7"),
            UIImage(named: "picture-1"),
            UIImage(named: "picture-2"),
            UIImage(named: "picture-3"),
            UIImage(named: "picture-4"),
            UIImage(named: "picture-5"),
            UIImage(named: "picture-6"),
            UIImage(named: "picture-7"),]

extension ProfileDesignViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .black
        let picture = pics[indexPath.row]
        let imageview = UIImageView()
        imageview.image = picture
        cell.addSubview(imageview)
        imageview.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width/3.5, height: collectionView.bounds.width/3.5)
//    }
}
