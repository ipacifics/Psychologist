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
@property (weak, nonatomic) NSTimer *drainTimer;
@end

@implementation RageFaceNoViewController
@synthesize rageFaceNoView = _rageFaceNoView;
@synthesize rageLabel = _rageLabel;
@synthesize drainTimer = _drainTimer;

- (void)setRandomLocationForView:(UIView *)view
{
    CGRect rageBounds = CGRectMake(0.0, 330.0, 320.0, 120.0);
    CGFloat x = arc4random() % (int)rageBounds.size.width + view.frame.size.width/2;
    CGFloat y = arc4random() % (int)rageBounds.size.height + view.frame.size.height*12;
    view.center = CGPointMake(x, y);
}

- (IBAction)addRageLabel:(UIButton *)sender 
{
    _rageLabel = [[UILabel alloc] init];
    _rageLabel.text = @"Rage";
    _rageLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    _rageLabel.backgroundColor = [UIColor clearColor];
    [_rageLabel sizeToFit];
    [self setRandomLocationForView:_rageLabel];
    [self.rageFaceNoView addSubview:_rageLabel];
}

#define DRAIN_DURATION 3.0

-(void)drain
{
    for (UIView *view in self.rageFaceNoView.subviews){
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
                                   ;
                                }
                            }];
                        };
                    }];
                }
            }];
        }
    }
}

#define DRAIN_TIMER 3.0

-(void)startDraining
{
    self.drainTimer = [NSTimer scheduledTimerWithTimeInterval:DRAIN_TIMER target:self selector:@selector(drain) userInfo:nil repeats:YES];
}

-(void)stopDraining
{
    [self.drainTimer invalidate];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self startDraining];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self stopDraining];
}

- (void)viewDidUnload
{
    [self setRageFaceNoView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
