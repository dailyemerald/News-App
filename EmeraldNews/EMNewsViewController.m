//
//  FBNewsViewController.m
//  Football
//
//  Created by garage1 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMAppDelegate.h"
#import "EMNewsViewController.h"
#import "EMDetailViewController.h"

@interface EMNewsViewController ()

@end

@implementation EMNewsViewController
@synthesize webView;
@synthesize urlString;
@synthesize destURL;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for(UIView *wview in [[[webView subviews] objectAtIndex:0] subviews]) { 
        if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; } 
    }
    UIScrollView* currentScrollView;
    for (UIView* subView in self.webView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            currentScrollView = (UIScrollView*)subView;
            //currentScrollView.delegate = self;
        }
    }
    webView.scrollView.bounces = NO;
    
    EMAppDelegate *appDelegate = (EMAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    urlString = [appDelegate.urlEndpoint stringByAppendingString:@"news.html"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [webView loadRequest:requestObj];
    
    webView.delegate = self;
    
    NSLog(@"news viewDidLoad");    
}

- (void)viewDidAppear:(BOOL)animated {
    [webView stringByEvaluatingJavaScriptFromString:@"viewDidAppear();"];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"storyDetail"]) {
        EMDetailViewController *detailView = segue.destinationViewController;
        detailView.urlString = self.destURL;
        detailView.loadStartTime = [NSDate date];
    }  
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = request.URL;
    NSString *requestedURL = url.absoluteString;
    
    if ([requestedURL isEqualToString: urlString]) {
        NSLog(@"EMNews: Loading initial page.");
        return YES;
        
    } else if ([requestedURL rangeOfString: @"dailyemerald"].location != NSNotFound) {
        self.destURL = requestedURL;
        [self performSegueWithIdentifier:@"storyDetail" sender:self];
        return NO;
        
    } else if ([[url scheme] isEqualToString:@"webviewSays"]) {
        NSString *functionString = [url resourceSpecifier];
        if ([functionString hasPrefix:@"finishedLoading"]) {
            self.title = @"";
            self.navigationItem.title = @"";
        }
        return NO;
        
    } else {
        NSLog(@"EMNews: Denying request.");
        return NO;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
