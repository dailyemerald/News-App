//
//  EMSportsViewController.h
//  EmeraldNews
//
//  Created by garage1 on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMSportsViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSString *destURL;

@end
