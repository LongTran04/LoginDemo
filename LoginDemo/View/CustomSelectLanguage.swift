//
//  CustomSelectLanguageView.swift
//  LoginDemo
//
//  Created by Long Tran on 24/03/2023.
//

import UIKit

class CustomSelectLanguage: UIControl {
    
    let languageImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let labelLanguage: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let imageIconView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "ic24-fill-arrowhead-down")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(languageImageView)
        addSubview(labelLanguage)
        addSubview(imageIconView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(languageImageView)
        addSubview(labelLanguage)
        addSubview(imageIconView)
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
    }
    
    public func configure(imageLanguageName: String, labelLanguage: String) {
        self.languageImageView.image = UIImage(named: imageLanguageName)
        self.labelLanguage.text = labelLanguage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        languageImageView.frame = CGRect(x: 8, y: 4, width: 24, height: 24)
        labelLanguage.frame = CGRect(x: 30, y: 1, width: 40, height: 30)
        imageIconView.frame = CGRect(x: 62, y: 6, width: 20, height: 20)
    }
    
}
