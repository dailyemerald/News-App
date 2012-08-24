//
//  FBNewsDetailViewController.h
//  Football
//
//  Created by garage1 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMNewsDetailViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navHeader;
@property (weak, nonatomic) IBOutlet UITextField *label;

@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSURL *outboundURL;

@property (strong, nonatomic) NSDate *loadStartTime;
@end
