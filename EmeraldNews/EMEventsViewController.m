//
//  EMEventsViewController.m
//  EmeraldNews
//
//  Created by garage1 on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMAppDelegate.h"
#import "EMEventsViewController.h"
#import "EMDetailViewController.h"

@interface EMEventsViewController ()

@end

@implementation EMEventsViewController
@synthesize webView;
@synthesize urlString;
@synthesize destURL;

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
    
    UIScrollView *sv =  [self.webView performSelector:@selector(scrollView)];
    [sv setDecelerationRate:UIScrollViewDecelerationRateNormal ];
    for( UIImageView *innerView in sv.subviews ) {
        if( [innerView isKindOfClass:[UIImageView class]] ) {
            innerView.hidden = YES;
        }
    }
    webView.scrollView.bounces = NO;
    
    EMAppDelegate *appDelegate = (EMAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    urlString = [appDelegate.urlEndpoint stringByAppendingString:@"events.html"];
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
    [self setWebView:nil];
    [super viewDidUnload];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"storyDetail"]) {
        EMDetailViewController *detailView = segue.destinationViewController;
        detailView.urlString = self.destURL;
    }  
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = request.URL;
    NSString *requestedURL = url.absoluteString;
    
    if ([requestedURL isEqualToString: urlString]) {
        NSLog(@"Loading initial page.");
        return YES;
        
    } else if ([requestedURL rangeOfString: @"dailyemerald.github.com"].location != NSNotFound) {
        NSLog(@"To the detail view!");
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
        NSLog(@"Denying request.");
        return NO;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end