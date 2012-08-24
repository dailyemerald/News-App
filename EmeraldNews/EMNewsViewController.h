//
//  FBNewsViewController.h
//  Football
//
//  Created by garage1 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMNewsViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSString *destURL;

@end
