//
//  EMDetailViewController.m
//
//  Created by garage1 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMDetailViewController.h"

@interface EMDetailViewController ()

@end

@implementation EMDetailViewController
@synthesize webView;
@synthesize navHeader;
@synthesize label;
@synthesize urlString;
@synthesize outboundURL;
@synthesize loadStartTime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad
{   
    NSLog(@"newsdetail %@, %@", [self view], urlString);

    for(UIView *wview in [[[webView subviews] objectAtIndex:0] subviews]) { 
        if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; } 
    }
    webView.scrollView.bounces = NO;
    
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];

    webView.delegate = self;

    [webView loadRequest:requestObj];
    
    NSLog(@"NewsDetailView viewDidLoad, %@", self.urlString);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear {
    
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setNavHeader:nil];
    [self setLabel:nil];
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *URL = [request URL];


    
        
    if ([[URL scheme] isEqualToString:@"emeraldfootball"])
    {
        NSString *functionString = [URL resourceSpecifier];
        
        if ([functionString hasPrefix:@"finishedLoading"]) {
        
            NSString *parameter = [functionString stringByReplacingOccurrencesOfString:@"finishedLoading" withString:@""];
            
            NSNumber *loadTime = [NSNumber numberWithDouble: [loadStartTime timeIntervalSinceNow] * -1000];
            
            parameter = [parameter stringByReplacingOccurrencesOfString:@"(" withString:@""];
            parameter = [parameter stringByReplacingOccurrencesOfString:@")" withString:@""];

            self.title = @"";
        }
        return NO;
    
    }
    
    if ([[URL path] rangeOfString:@"detail.html"].location == NSNotFound) {     
        //nope...
    } else {
        return YES;
    }
    
    self.outboundURL = URL;
    
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"External site" message:@"This link will open in Safari." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: @"Open",nil];
    [alert1 show];
    
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSLog(@"Cancel");
    }
    else
    {
        NSLog(@"Safari");
        [[UIApplication sharedApplication] openURL:self.outboundURL];
    }
}

@end
