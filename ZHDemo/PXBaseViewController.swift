//
//  PXBaseViewController.swift
//  PuXinFinancial
//
//  Created by summer on 2017/8/29.
//  Copyright © 2017年 PUXIN. All rights reserved.
//

import UIKit
enum LoginType {
    case find    //跳转到发现首页
    case common  //普通
}

class PXBaseViewController: UIViewController {

    var fromType:LoginType?

    @IBOutlet weak var topLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
   
        showNavigationBarBottomLineView(isShow: false)

        adaptationX()
        self.view.backgroundColor = UIColor.yellow
    }
    
    func adaptationX() {
        if (topLayout != nil) {
            if #available(iOS 11.0, *) {
                
            } else {
                topLayout.constant += 64
            }
        }
    }
    
    // 默认隐藏
    // 需要展示下划线 在vc中的viewDidAppear方法再次调用
    func showNavigationBarBottomLineView(isShow: Bool) {
        let lineView = findBottomLineView()
        lineView?.isHidden = !isShow
    }
    
    func findBottomLineView() -> UIView? {
        guard let nav = self.navigationController else {
            return nil
        }
        for v in nav.navigationBar.subviews {
            if v.subviews.count > 0 {
                for vv in v.subviews {
                    if (vv.classForCoder == UIImageView.classForCoder()) {
                        return vv
                    }
                }
            }
        }
        return nil
    }
    
    @objc func backClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNavbarBgTranslucent(){
        self.navigationController?.navigationBar.subviews[0].alpha = 0.0
        self.navigationController?.navigationBar.subviews[0].subviews[1].alpha = 0.0
        self.navigationController?.navigationBar.clipsToBounds = true
    }

    func setNavbarBgNotTranslucent(){
        self.navigationController?.navigationBar.subviews[0].alpha = 1
        self.navigationController?.navigationBar.subviews[0].subviews[1].alpha = 1
        self.navigationController?.navigationBar.clipsToBounds = false
    }
    public func base_addRightImageButton(imageName: String, size: CGSize = CGSize(width: 44, height: 44), edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
    
    }
    
    public func base_addRightTextButton(title: String, textColor: UIColor = UIColor.lightGray, font: UIFont = UIFont.systemFont(ofSize: 14), size: CGSize = CGSize(width: 44, height: 44), edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        if !title.isEmpty {
            let buttonItem = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightButtonAction))
            buttonItem.setTitleTextAttributes([NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : textColor], for: UIControl.State.normal)
            buttonItem.setTitleTextAttributes([NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : textColor], for: UIControl.State.highlighted)
            self.navigationItem.rightBarButtonItem = buttonItem
        }
    }
    
    @objc private func rightButtonAction() {
        base_rightButtonAction()
    }
    
    func base_rightButtonAction() {
        
    }
    
}




