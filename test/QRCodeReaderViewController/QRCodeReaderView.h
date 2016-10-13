
#import <UIKit/UIKit.h>


@protocol QRCodeReaderViewDelegate <NSObject>
- (void)loadView:(CGRect)rect;
@end

@interface QRCodeReaderView : UIView
@property (nonatomic, weak)   id<QRCodeReaderViewDelegate> delegate;
@property (nonatomic, assign) CGRect innerViewRect;
@end
