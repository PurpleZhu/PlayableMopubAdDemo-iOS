//
//  ViewController.m
//  PlayableMopubAd
//
//  Created by lgd on 2017/11/2.
//  Copyright © 2017年 lgd. All rights reserved.
//
#import "ViewController.h"
#import "MoPub.h"
#import "MPRewardedVideo.h"

@interface ViewController () <MPRewardedVideoDelegate>

@property (nonatomic) MPRewardedVideo *mpRewardedVideo;
@property (weak, nonatomic) IBOutlet UILabel *mLog;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[MoPub sharedInstance] initializeRewardedVideoWithGlobalMediationSettings:nil delegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)requestAd:(UIButton *)sender {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    _mLog.text = @"";
    [self addLog:@"requestAd..."];
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:@"be532d84e020492dba00e91e4deeade3"
                               withMediationSettings:nil];
}

- (IBAction)presentAd:(UIButton *)sender {
    [MPRewardedVideo presentRewardedVideoAdForAdUnitID:@"be532d84e020492dba00e91e4deeade3"
                                    fromViewController:self withReward:nil];
}

- (void)rewardedVideoAdDidLoadForAdUnitID:(NSString *)adUnitID {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self addLog:@"rewardedVideoAdDidLoadForAdUnitID"];
}

- (void)rewardedVideoAdDidFailToLoadForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self addLog:@"rewardedVideoAdDidFailToLoadForAdUnitID"];
}

- (void)rewardedVideoAdDidExpireForAdUnitID:(NSString *)adUnitID {
    [self addLog:@"rewardedVideoAdDidExpireForAdUnitID"];
}

- (void)addLog:(NSString*)msg {
    _mLog.text = [_mLog.text stringByAppendingFormat:@"\n%@", msg];
}
@end
