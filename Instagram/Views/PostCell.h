//
//  PostCell.h
//  Instagram
//
//  Created by Harleen Kaur on 7/7/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;
NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (strong, nonatomic) Post *post;
@property (strong, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

- (void)setPost:(Post *)post;
@end

NS_ASSUME_NONNULL_END
