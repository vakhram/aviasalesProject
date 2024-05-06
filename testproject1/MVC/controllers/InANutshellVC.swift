//
//  SecondViewController.swift
//  testproject1
//
//  Created by Даниил Вахрамеев on 27.02.2024.
//

import UIKit

class InANutshellVC: UIViewController {
    
    private var images: [UIImage] = []
    
    private var nutshellArr: [InNutshellInfo] = []
    private let collectionview: UICollectionView = {
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        cv.backgroundColor = .systemBackground
        cv.register(InANutshellCell.self, forCellWithReuseIdentifier: InANutshellCell.identifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDelegates()
        
    }
    
    private func setDelegates(){
        self.collectionview.delegate = self
        self.collectionview.dataSource = self
    }
    
    private func setupUI(){
        self.view.backgroundColor = .systemMint
        
        self.view.addSubview(collectionview)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        
        guard let image1 = UIImage(named: "1"), let image2 = UIImage(named: "2"), let image3 = UIImage(named: "3"),
            let image4 = UIImage(named: "4") else {return}
        self.collectionview.backgroundColor = .lightGray
        for _ in 0...3{
            images.append(image1)
            images.append(image2)
            images.append(image3)
            images.append(image4)
            nutshellArr.append(.init(cityImage: image1, cityName: "Казань", countryName: "Россия"))
            nutshellArr.append(.init(cityImage: image2, cityName: "Москва", countryName: "Россия"))
            nutshellArr.append(.init(cityImage: image3, cityName: "Санкт-Петербург", countryName: "Россия"))
            nutshellArr.append(.init(cityImage: image4, cityName: "Ярославль", countryName: "Россия"))
        }
        
        
//
//        nutshellArr.append(.init(cityImage: image1, cityName: "Казань", countryName: "Россия"))
//        nutshellArr.append(.init(cityImage: image2, cityName: "Москва", countryName: "Россия"))
//        nutshellArr.append(.init(cityImage: image3, cityName: "Санкт-Петербург", countryName: "Россия"))
//        nutshellArr.append(.init(cityImage: image4, cityName: "Ярославль", countryName: "Россия"))
//
        self.collectionview.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

//MARK: UICollectionViewDataSource
extension InANutshellVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionview.dequeueReusableCell(withReuseIdentifier: InANutshellCell.identifier, for: indexPath) as?
                InANutshellCell else {return UICollectionViewCell()}
        
        
        
        cell.configure(image: nutshellArr[indexPath.row].cityImage, cityName: nutshellArr[indexPath.row].cityName, countryName: nutshellArr[indexPath.row].countryName, backGroundColor: self.collectionview.backgroundColor ?? .white)
        
        return cell
    }
    
    
}
extension InANutshellVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (self.view.frame.width/2) - 15
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 75, left: 10, bottom: 20, right: 10)
    }
}
