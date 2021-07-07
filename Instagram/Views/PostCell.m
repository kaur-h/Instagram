//
//  PostCell.m
//  Instagram
//
//  Created by Harleen Kaur on 7/7/21.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) refreshData{
}

- (void)setPost:(Post *)post {
    _post = post;
    self.postImage.file = post[@"image"];
    [self.postImage loadInBackground];
    self.captionLabel.text = post[@"caption"];
    self.usernameLabel.text = post[@"author"][@"username"];
}

@end
