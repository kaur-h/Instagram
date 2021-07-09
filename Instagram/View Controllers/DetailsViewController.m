//
//  DetailsViewController.m
//  Instagram
//
//  Created by Harleen Kaur on 7/9/21.
//

#import "DetailsViewController.h"
#import "Parse/Parse.h"
#import "NSDate+DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet PFImageView *image;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.usernameLabel.text = self.post[@"author"][@"username"];
    self.image.file = self.post[@"image"];
    [self.image loadInBackground];
    self.caption.text = self.post[@"caption"];
    self.likeCount.text = [NSString stringWithFormat:@"%@", self.post[@"likeCount"]];
    self.commentCount.text = [NSString stringWithFormat:@"%@", self.post[@"commentCount"]];
    
    //formatting date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM/dd/yy,h:mm a";
    NSDate *date = [formatter dateFromString:self.post[@"createdAtString"]];
    NSString *ago = date.shortTimeAgoSinceNow;
    self.timeLabel.text = ago;
    
    [self likedOrCommented];
}

-(void) likedOrCommented{
    self.likeCount.text = [NSString stringWithFormat:@"%@", self.post[@"likeCount"]];
    
    if(self.post.liked){
        [self.likeButton setImage:[UIImage imageNamed:@"favor-icon-red.png"] forState:UIControlStateNormal];
    }
    else{
        [self.likeButton setImage:[UIImage imageNamed:@"favor-icon.png"] forState:UIControlStateNormal];
    }

}

- (IBAction)didClickLike:(id)sender {
    if(self.post.liked){
        self.post.liked = NO;
        int value = [self.post.likeCount intValue];
        if(value == 0){
            NSNumber *number = [NSNumber numberWithInt:0];
            self.post.likeCount = number;
        }
        else{
            NSNumber *number = [NSNumber numberWithInt:value - 1];
            self.post.likeCount = number;
        }
        [self likedOrCommented];
        [self.post saveInBackground];
    }
    else{
        self.post.liked = YES;
        int value = [self.post.likeCount intValue];
        NSNumber *number = [NSNumber numberWithInt:value + 1];
        self.post.likeCount = number;
        [self likedOrCommented];
        [self.post saveInBackground];
    }
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
