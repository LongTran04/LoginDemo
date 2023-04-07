//
//  CustomButton.swift
//  LoginDemo
//
//  Created by Long Tran on 24/03/2023.
//

import UIKit

class CustomLoginButton: UIControl {
    let labelButton: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let imageButton: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageButton)
        addSubview(labelButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageButton.frame = CGRect(x: 10, y: 10, width: 24, height: 24)
        labelButton.frame = CGRect(x: 50, y: -5, width: 280, height: 50)
    }
    
    public func configure(label: String, imageName: String){
        self.labelButton.text = label
        self.imageButton.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(imageButton)
        addSubview(labelButton)
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
    }
}
