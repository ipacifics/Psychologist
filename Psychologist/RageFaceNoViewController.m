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
@end

@implementation RageFaceNoViewController
@synthesize rageFaceNoView = _rageFaceNoView;

- (void)addLabel:text 
{
    rageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 330.0, 320.0, 110.0);
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
