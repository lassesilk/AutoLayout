//
//  ViewController.swift
//  AutoLayout
//
//  Created by Lasse Silkoset on 08.08.2018.
//  Copyright © 2018 Lasse Silkoset. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //lets avoid polluting viewDidLoad
    //{} is reffered to as closure, or anonomous funcs
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads of fun? dont wait any longer. We hope to see you in our stores soon!", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor : UIColor.gray]))
        
        textView.attributedText = attributedText
        
        
//        textView.text = "Join us today in our fun and games!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(descriptionTextView)
                
        setupLayout()
        
       
    }

    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        //enable autoLayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        //rightAnchor needs to be a negative value to get it correct. or else it will go of the screen by 24.
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        

    }



}

