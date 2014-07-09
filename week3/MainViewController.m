//
//  MainViewController.m
//  week3
//
//  Created by Kansinee Adsanatham on 7/8/14.
//  Copyright (c) 2014 kansinee. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headlineView;
@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollView;
- (IBAction)headlinePanGesture:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *menuView;
@property (weak, nonatomic) IBOutlet UIView *headlineContainer;


@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.navigationController.navigationBar.hidden = YES;
    
    self.menuView.alpha = 0.5;
    
    
    self.newsScrollView.contentSize = CGSizeMake(1444, 253);
    
    
    [UIView animateWithDuration:.5 delay:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.newsScrollView.center = CGPointMake(self.newsScrollView.center.x, self.newsScrollView.center.y);
    } completion: NULL];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)headlinePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer {
    
   
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    CGPoint translation = [panGestureRecognizer translationInView:self.view];
    
    [panGestureRecognizer setTranslation:CGPointZero inView:panGestureRecognizer.view];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        //NSLog(@"Gesture began at: %@", NSStringFromCGPoint(point));
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        if (velocity.y <= 0) {
            self.headlineContainer.center = CGPointMake(self.headlineContainer.center.x, self.headlineContainer.center.y + (translation.y * .1));
        } else {
            self.headlineContainer.center = CGPointMake(self.headlineContainer.center.x, self.headlineContainer.center.y + (translation.y * 1.0));
        }
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        //NSLog(@"Gesture ended: %@", NSStringFromCGPoint(point));
        if (velocity.y >= 0) {
            [UIView animateWithDuration:1 animations:^{
                self.headlineContainer.frame = CGRectMake(0,520,320, 568);
                self.menuView.alpha = 1;
            }];
            
        } else {
            [UIView animateWithDuration:1 animations:^{
                self.headlineContainer.frame = CGRectMake (0,0, 320, 568);
                     self.menuView.alpha = .5;
            }];
        }
    }

    
}
@end
