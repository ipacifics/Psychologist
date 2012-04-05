//
//  RageFaceNoViewController.m
//  Psychologist
//
//  Created by JY Yang on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RageFaceNoViewController.h"

@interface RageFaceNoViewController ()
@property (weak, nonatomic) IBOutlet UIView *rageFaceNoView;
@property (retain, nonatomic) UILabel *rageLabel;
@end

@implementation RageFaceNoViewController
@synthesize rageFaceNoView = _rageFaceNoView;
@synthesize rageLabel = _rageLabel;

- (void)setRandomLocationForView:(UIView *)view
{
    CGRect rageBounds = CGRectMake(0.0, 330.0, 320.0, 120.0);
    CGFloat x = arc4random() % (int)rageBounds.size.width + view.frame.size.width/2;
    CGFloat y = arc4random() % (int)rageBounds.size.height + view.frame.size.height*13;
    view.center = CGPointMake(x, y);
}

- (IBAction)addLabel:(UIButton *)sender 
{
    UILabel *rageLabel = [[UILabel alloc] init];
    rageLabel.text = @"Rage";
    rageLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    rageLabel.backgroundColor = [UIColor clearColor];
    [rageLabel sizeToFit];
    [self setRandomLocationForView:rageLabel];
    [self.rageFaceNoView addSubview:rageLabel];
}

#define DRAIN_DURATION 3.0

-(void)drain
{
    for (UIView *view in self.rageFaceNoView.subviews){
        CGAffineTransform transform = view.transform;
        if (CGAffineTransformIsIdentity(transform)) {
            UIViewAnimationOptions option = UIViewAnimationCurveLinear;
            [UIView animateWithDuration:DRAIN_DURATION/3 delay:0 options:options animations:^{
                    view.transform = CGAffineTransformRotate(CGAffineTransformScale(transform, 0.7, 0.7), 2*M_PI/3)
            }completion:^(BOOL finished) {
                if (finished) {
                    UIView animateWithDuration:DRAIN_DURATION/3 delay:0 options:options animations:^{
                            view.transform = CGAffineTransformRotate(CGAffineTransformScale(transform, 0.4, 0.4), -2*M_PI/3)
                    }completion:^(BOOL finished){
                        if (finished){
                            [UIView animateWithDuration:DRAIN_DURATION/3 delay:0 options:option animations:^{
                                    view.transform = CGAffineTransformScale(transform, 0.1, 0.1)
                            }completion:<#^(BOOL finished)completion#> animations:<#^(void)animations#>
                            
                        }
                    }
                }
            }
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setRageFaceNoView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
