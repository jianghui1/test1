
@class QRCodeReaderViewController;

@protocol QRCodeReaderDelegate <NSObject>

@optional

#pragma mark - Listening for Reader Status

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result;
- (void)readerDidCancel:(QRCodeReaderViewController *)reader;

@end
