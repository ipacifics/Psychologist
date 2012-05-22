//
//  SplendidMusicViewController.m
//  Psychologist
//
//  Created by Bianca Yang on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SplendidMusicViewController.h"

@interface SplendidMusicViewController ()

@end

@implementation SplendidMusicViewController
@synthesize playPauseButton = _playPauseButton;
@synthesize volumeSlider = _volumeSlider;
@synthesize artworkImageView = _artworkImageView;
@synthesize titleLabel = _titleLabel;
@synthesize artistLabel = _artistLabel;
@synthesize albumLabel = _albumLabel;

-(void)registerMediaPlayerNotifications
{
    
}


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
    MPMusicPlayerController *splendidPlayer = [MPMusicPlayerController iPodMusicPlayer];
    [splendidPlayer setQueueWithQuery:[MPMediaQuery songsQuery]];
    [splendidPlayer play];
    [_volumeSlider setValue:[splendidPlayer volume]];
    if ([splendidPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [_playPauseButton setImage:[UIImage imageNamed:@"pauseButton.png"] forState:UIControlStateNormal];
    } else {
        if ([splendidPlayer playbackState] == MPMusicPlaybackStatePaused) {
            [_playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
        }
    }
}

- (void)viewDidUnload
{
    [self setPlayPauseButton:nil];
    [self setVolumeSlider:nil];
    [self setArtworkImageView:nil];
    [self setTitleLabel:nil];
    [self setArtistLabel:nil];
    [self setAlbumLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)volumeChanged:(id)sender {
}

- (IBAction)showMediaPicker:(id)sender {
}

- (IBAction)previousSong:(id)sender {
}

- (IBAction)playPause:(id)sender {
}

- (IBAction)nextSong:(id)sender {
}
@end
