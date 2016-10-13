
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "QRCodeReaderDelegate.h"


@interface QRCodeReaderViewController : UIViewController <QRCodeReaderDelegate>

#pragma mark - Managing the Delegate
@property (nonatomic, weak) id<QRCodeReaderDelegate> delegate;

#pragma mark - Creating and Inializing QRCode Readers
- (id)initWithCancelButtonTitle:(NSString *)cancelTitle;
+ (instancetype)readerWithCancelButtonTitle:(NSString *)cancelTitle;

#pragma mark - Checking the Metadata Items Types
+ (BOOL)isAvailable;

#pragma mark - Managing the Block
- (void)setCompletionWithBlock:(void (^) (NSString *resultAsString))completionBlock;

@end
