//
//  AloneViewController.m
//  Psychologist
//
//  Created by JY Yang on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AloneViewController.h"

@interface AloneViewController ()
@property (weak, nonatomic) IBOutlet UIView *aloneView;
@property (retain, nonatomic) UIImageView *lonelyFace;
@property (weak, nonatomic) NSTimer *drainTimer;
@end

@implementation AloneViewController
@synthesize aloneView = _aloneView;
@synthesize lonelyFace = _lonelyFace;
@synthesize drainTimer = _drainTimer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*- (void)setRandomLocationForView:(UIImageView *)view
{
    CGRect rageBounds = CGRectMake(0.0, 330.0, 320.0, 120.0);
    CGFloat x = arc4random() % (int)rageBounds.size.width + view.frame.size.width/2;
    CGFloat y = arc4random() % (int)rageBounds.size.height + view.frame.size.height*12;
    view.center = CGPointMake(x, y);
}*/

- (IBAction)addLonelyFace:(UIButton *)sender 
{
    _lonelyFace = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images-1.jpeg"]];
    _lonelyFace.frame = CGRectMake(arc4random()%300,     arc4random()%125, 100, 100);
    [self.view addSubview:_lonelyFace];
}

#define DRAIN_DURATION 3.0

-(void)drain
{
    for (UIView *view in self.aloneView.subviews){
        CGAffineTransform transform = view.transform;
        if (CGAffineTransformIsIdentity(transform)) {
            UIViewAnimationOptions option = UIViewAnimationCurveLinear;
            [UIView animateWithDuration:DRAIN_DURATION/3 delay:0 options:option animations:^{
                view.transform = CGAffineTransformRotate(CGAffineTransformScale(transform, 0.7, 0.7), 2*M_PI/3);
            }completion:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:DRAIN_DURATION/3 delay:0 options:option animations:^{
                        view.transform = CGAffineTransformRotate(CGAffineTransformScale(transform, 0.4, 0.4), -2*M_PI/3);
                    }completion:^(BOOL finished){
                        if (finished){
                            [UIView animateWithDuration:DRAIN_DURATION/3 delay:0 options:option animations:^{
                                view.transform = CGAffineTransformScale(transform, 0.1, 0.1);
                            }completion:^(BOOL finished) {
                                if (finished) {[view removeFromSuperview];
                                }
                            }];
                        };
                    }];
                }
            }];
        }
    }
}


- (IBAction)notLonelyDraim:(UIButton *)sender 
{
    [self drain];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setAloneView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
