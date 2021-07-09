//
//  DetailsViewController.h
//  Instagram
//
//  Created by Harleen Kaur on 7/9/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) Post *post;
-(void) likedOrCommented;
@end

NS_ASSUME_NONNULL_END
