//
//  SecondViewController.swift
//  AutoLayout
//
//  Created by Brian Advent on 16/06/16.
//  Copyright © 2016 Brian Advent. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let stack = UIStackView()
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    let imageView3 = UIImageView()
    let button = UIButton()
    
    
    var regularConstraints = [NSLayoutConstraint]()
    var compactConstraints = [NSLayoutConstraint]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stack.axis = .Horizontal
        stack.alignment = .Center
        stack.distribution = .Fill
        stack.spacing = 20
        
        view.addSubview(stack)
        
        
        imageView1.backgroundColor = UIColor.orangeColor()
        imageView2.backgroundColor = UIColor.greenColor()
        imageView3.backgroundColor = UIColor.blackColor()
        
        button.setTitle("Touch me", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        view.addSubview(button)
        
        stack.addArrangedSubview(imageView1)
        stack.addArrangedSubview(imageView2)
        stack.addArrangedSubview(imageView3)
        
        setupConstraints()
    
    }
    
    
    func setupConstraints() {
    
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 50).active = true
        stack.leadingAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.leadingAnchor).active = true
        stack.trailingAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.trailingAnchor).active = true
        
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
    
        compactConstraints.append(imageView1.widthAnchor.constraintEqualToAnchor(imageView2.widthAnchor, multiplier: 0.8))
        compactConstraints.append(imageView1.heightAnchor.constraintEqualToAnchor(imageView1.widthAnchor, multiplier: 1.5))
        compactConstraints.append(imageView2.heightAnchor.constraintEqualToAnchor(imageView1.heightAnchor, multiplier: 1.5))
        compactConstraints.append(imageView3.widthAnchor.constraintEqualToAnchor(imageView2.widthAnchor, multiplier: 0.65))
        compactConstraints.append(imageView3.heightAnchor.constraintEqualToAnchor(imageView3.widthAnchor, multiplier: 1.5))
        
        
        
        regularConstraints.append(imageView1.widthAnchor.constraintEqualToAnchor(imageView2.widthAnchor, multiplier: 1))
        regularConstraints.append(imageView1.heightAnchor.constraintEqualToAnchor(imageView1.widthAnchor, multiplier: 1))
        regularConstraints.append(imageView2.heightAnchor.constraintEqualToAnchor(imageView1.heightAnchor, multiplier: 1))
        regularConstraints.append(imageView3.widthAnchor.constraintEqualToAnchor(imageView2.widthAnchor, multiplier: 1))
        regularConstraints.append(imageView3.heightAnchor.constraintEqualToAnchor(imageView3.widthAnchor, multiplier: 1))
    
    
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraintEqualToAnchor(stack.bottomAnchor, constant: 50).active = true
        button.leadingAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.leadingAnchor).active = true
        button.trailingAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.trailingAnchor).active = true
        
        
    
    }
    

    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.horizontalSizeClass == .Regular {
            NSLayoutConstraint.deactivateConstraints(compactConstraints)
            NSLayoutConstraint.activateConstraints(regularConstraints)
        }else{
            NSLayoutConstraint.activateConstraints(compactConstraints)
            NSLayoutConstraint.deactivateConstraints(regularConstraints)
        }
        
    }
    
    
    override func updateViewConstraints() {
        <#code#>
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
