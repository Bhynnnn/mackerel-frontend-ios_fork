//
//  BoardBottomSheetViewController.swift
//  HighSchoolFish
//
//  Created by 강보현 on 1/14/24.
//

import UIKit
import SwiftUI

class BoardBottomSheetViewController: UIViewController {
    
    private lazy var bottomView: UIView = {
        var view = UIView()
        view.addSubview(bottomStackView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomStackView: UIStackView = {
        var stView = UIStackView()
        stView.addArrangedSubview(editButton)
        stView.addArrangedSubview(shareButton)
        stView.addArrangedSubview(deleteButton)
        stView.addArrangedSubview(reportButton)
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    private lazy var editButton: UIButton = {
        var button = UIButton()
        button.setTitle("수정하기", for: .normal)
        button.setTitleColor(UIColor(named: "blue"), for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("공유하기", for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        var button = UIButton()
        button.setTitleColor(UIColor(named: "red"), for: .normal)
        button.setTitle("삭제하기", for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var reportButton: UIButton = {
        var button = UIButton()
        button.setTitleColor(UIColor(named: "red"), for: .normal)
        button.setTitle("신고하기", for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(reportButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(bottomView)
        
        let isWriter = DetailBoardViewModel.shared.isWriter
        
        if isWriter {
            // true 작성자 본인
            editButton.isHidden = false
            deleteButton.isHidden = false
            shareButton.isHidden = false
            reportButton.isHidden = true
        }
        else {
            // false 일반인
            editButton.isHidden = true
            deleteButton.isHidden = true
            shareButton.isHidden = false
            reportButton.isHidden = false
        }
        setAutoLayout()
        // 내 글이면 수정하기, 공유하기, 삭제하기 보이게
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController의 view가 사라지기 전")
        
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            bottomView.heightAnchor.constraint(equalToConstant: 120),
            
            bottomStackView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            bottomStackView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: 16),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            bottomStackView.topAnchor.constraint(equalTo: bottomView.topAnchor)
        ])
    }
    
    @objc private func editButtonTapped(){
        print("editButtonTapped")
        //        게시판 수정 화면으로 넘어감
    }
    
    @objc private func shareButtonTapped(){
        print("shareButtonTapped")
        BottomSheetViewModel.shared.shareButtonTapped()
        //        url 이 공유됨
        //        url 클릭 시
        //        : 앱이 있는 경우 해당 게시글로 이동
        //        : 앱이 없는 경우 앱스토어/구글스토어로 이동
        //        (우린 이 경우 무시)
        
    }
    
    @objc private func deleteButtonTapped(){
        print("deleteButtonTapped")
        
        //        이유 작성 없이 바로 신고 접수되는 걸로..
        BottomSheetViewModel.shared.reportButtonTapped()
        // '신고하겠습니까' 얼럿뜸
        BottomSheetViewModel.shared.onReportButtonComplete = { result in
            if result {
                // 신고 버튼 눌림
                let alert = AlertStatusViewModel.shared.AlertForCheck(checkStatus: .reportBoard)
                CustomAlertViewModel.shared.setAlertStatus(alertStatus: .reportBoard)
                
                let customAlertVC = CustomAlertViewController()
                customAlertVC.show(alertTitle: alert.alertTitle, alertMessage: alert.alertMessage, alertType: alert.alertType, on: self)
            }
        }
        
        BottomSheetViewModel.shared.deleteButtonTapped()
        // '삭제하겠습니까' 얼럿뜸
        BottomSheetViewModel.shared.onDeleteButtonComplete = { result in
            if result {
                // 삭제 버튼 눌림
                let alert = AlertStatusViewModel.shared.AlertForCheck(checkStatus: .deleteBoard)
                CustomAlertViewModel.shared.setAlertStatus(alertStatus: .deleteBoard)
                
                let customAlertVC = CustomAlertViewController()
                customAlertVC.show(alertTitle: alert.alertTitle, alertMessage: alert.alertMessage, alertType: alert.alertType, on: self)
            }
        }
    }
    
    @objc private func reportButtonTapped(){
        print("reportButtonTapped")
        //        이유 작성 없이 바로 신고 접수되는 걸로..
        BottomSheetViewModel.shared.reportButtonTapped()
        // '신고하겠습니까' 얼럿뜸
        BottomSheetViewModel.shared.onReportButtonComplete = { result in
            if result {
                // 신고 버튼 눌림
                let alert = AlertStatusViewModel.shared.AlertForCheck(checkStatus: .reportBoard)
                CustomAlertViewModel.shared.setAlertStatus(alertStatus: .reportBoard)
                
                let customAlertVC = CustomAlertViewController()
                customAlertVC.show(alertTitle: alert.alertTitle, alertMessage: alert.alertMessage, alertType: alert.alertType, on: self)
            }
        }
    }
}
