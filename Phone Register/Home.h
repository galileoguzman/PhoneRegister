//
//  ViewController.h
//  Phone Register
//
//  Created by Galileo Guzman on 27/11/15.
//  Copyright © 2015 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Home : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblHeader;

@property (strong, nonatomic) IBOutlet UILabel *lblPhoneNumber;

@property (strong, nonatomic) IBOutlet UIButton *btnSession;

- (IBAction)btnSignInWithFabricPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imgSession;

@end

