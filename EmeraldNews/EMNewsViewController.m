//
//  FBNewsViewController.m
//  Football
//
//  Created by garage1 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMAppDelegate.h"
#import "EMNewsViewController.h"
#import "EMNewsDetailViewController.h"

@interface EMNewsViewController ()

@end

@implementation EMNewsViewController
@synthesize webView;
@synthesize urlString;
@synthesize destURL;

- (void)viewDidLoad
{
    for(UIView *wview in [[[webView subviews] objectAtIndex:0] subviews]) { 
        if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; } 
    }
    
    EMAppDelegate *appDelegate = (EMAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    urlString = [appDelegate.urlEndpoint stringByAppendingString:@"list.html"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [webView loadRequest:requestObj];
    
    webView.delegate = self;
    
    NSLog(@"news viewDidLoad");
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = request.URL;
    NSString *requestedURL = url.absoluteString;
    if ([requestedURL isEqualToString: urlString]) {
        NSLog(@"Loading initial page.");
        return YES;
        
    } else if ([requestedURL rangeOfString: @"dailyemerald.com"].location != NSNotFound) {
        NSLog(@"To the detail view!");
        self.destURL = requestedURL;
        [self performSegueWithIdentifier:@"showStoryDetail" sender:self];
        return NO;
        
    } else if ([[url scheme] isEqualToString:@"emeraldfootball"]) {
        NSString *functionString = [url resourceSpecifier];
        if ([functionString hasPrefix:@"finishedLoading"]) {
            //NSString *parameter = [functionString stringByReplacingOccurrencesOfString:@"finishedLoading" withString:@""];
            //parameter = [parameter stringByReplacingOccurrencesOfString:@"(" withString:@""];
            //parameter = [parameter stringByReplacingOccurrencesOfString:@")" withString:@""];
            self.title = @"";
            self.navigationItem.title = @"News";
        }
        return NO;
        
    } else {
        NSLog(@"Denying request.");
        return NO;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
