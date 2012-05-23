//
//  SplendidMusicViewController.m
//  Psychologist
//
//  Created by Bianca Yang on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SplendidMusicViewController.h"

@interface SplendidMusicViewController ()
-(void)registerMediaPlayerNotifications;
@property MPMusicPlayerController *splendidPlayer;

@end

@implementation SplendidMusicViewController
@synthesize playPauseButton = _playPauseButton;
@synthesize volumeSlider = _volumeSlider;
@synthesize artworkImageView = _artworkImageView;
@synthesize titleLabel = _titleLabel;
@synthesize artistLabel = _artistLabel;
@synthesize albumLabel = _albumLabel;
@synthesize splendidPlayer = _splendidPlayer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)registerMediaPlayerNotifications
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(handle_NowPlayingItemChanged:) name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:_splendidPlayer];
    [notificationCenter addObserver:self selector:@selector(handle_PlaybackStateChanged:) name:MPMusicPlayerControllerPlaybackStateDidChangeNotification object:_splendidPlayer];
    [notificationCenter addObserver:self selector:@selector(handle_VolumeChanged:) name:MPMusicPlayerControllerVolumeDidChangeNotification object:_splendidPlayer];
    [_splendidPlayer beginGeneratingPlaybackNotifications];
}

-(void) handle_NowPlayingItemChanged: (id)notification
{
    MPMediaItem *currentItem = [_splendidPlayer nowPlayingItem];
    UIImage *artworkImage = [UIImage imageNamed:@"noArtworkImage.png"];
    MPMediaItemArtwork *artwork = [currentItem valueForProperty:MPMediaItemPropertyArtwork];
    
    if (artwork) {
        artworkImage = [artwork imageWithSize: CGSizeMake(200, 200)];
    }
    
    [_artworkImageView setImage:artworkImage];

    NSString *titleString = [currentItem valueForProperty:MPMediaItemPropertyTitle];
    if (titleString) {
        _titleLabel.text = [NSString stringWithFormat:@"Title, %@", titleString];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _splendidPlayer = [MPMusicPlayerController iPodMusicPlayer];
    [_splendidPlayer setQueueWithQuery:[MPMediaQuery songsQuery]];
    [_splendidPlayer play];
    [_volumeSlider setValue:[_splendidPlayer volume]];
    if ([_splendidPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [_playPauseButton setImage:[UIImage imageNamed:@"pauseButton.png"] forState:UIControlStateNormal];
    } else {
        if ([_splendidPlayer playbackState] == MPMusicPlaybackStatePaused) {
            [_playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
            [self registerMediaPlayerNotifications];
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
