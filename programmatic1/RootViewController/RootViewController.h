#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RootViewController : UIViewController <UITextFieldDelegate>

-(void) addLabel;
-(void) labelConstraints;
-(void) addNameLabel;
-(void) nameLabelConstraints;
-(void) addNameField;
-(void) nameFieldConstraints;
-(void) addSubmitButton;
-(void) submitButtonConstraints;
-(void) addNextButton;

@end

