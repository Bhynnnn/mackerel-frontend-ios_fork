//
//  CommentHeaderView.swift
//  HighSchoolFish
//
//  Created by 강보현 on 11/29/23.
//

import Foundation
import UIKit

class CommentTableHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contextLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentWriteButton: UIButton!
    @IBOutlet weak var showMoreView: UIView!
    
    override func awakeFromNib() {
        
    }
    
    @IBAction func headerLikeButtonTapped() {
        print("likeButtonTapped define on headerViewCustomClass")
    }
    
    func generateCell(comment: CommentContent) {
        print("generateCell comment")
        
        if comment.profile == nil {
            profileImage.image = UIImage(named: "profileIcon")
        }
        nameLabel.text = comment.name
        timeLabel.text = comment.createdAt
        contextLabel.text = comment.context
        likeCountLabel.text = "\(comment.numberOfLikes)"
//        if comment.isLike == false {
//            // 좋아요 안눌려있음
//            likeButton.tintColor = UIColor(named: "gray")
//        }
//        else {
//            likeButton.tintColor = UIColor(named: "red")
//        }
        
//        if comment.isWriter {
//            // 본인이 단 댓글
//        }
    }
    
    
}
