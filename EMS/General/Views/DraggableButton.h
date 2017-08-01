

#import <UIKit/UIKit.h>
#define RC_DB_VERSION @"0.2"

@interface DraggableButton : UIButton {
    BOOL _isDragging;
    BOOL _singleTapBeenCanceled;
    CGPoint _beginLocation;
    UILongPressGestureRecognizer *_longPressGestureRecognizer;
}
@property (nonatomic) BOOL draggable;
@property (nonatomic) BOOL autoDocking;

@property (nonatomic, copy) void(^longPressBlock)(DraggableButton *button);
@property (nonatomic, copy) void(^tapBlock)(DraggableButton *button);
@property (nonatomic, copy) void(^doubleTapBlock)(DraggableButton *button);

@property (nonatomic, copy) void(^draggingBlock)(DraggableButton *button);
@property (nonatomic, copy) void(^dragDoneBlock)(DraggableButton *button);

@property (nonatomic, copy) void(^autoDockingBlock)(DraggableButton *button);
@property (nonatomic, copy) void(^autoDockingDoneBlock)(DraggableButton *button);

- (id)initInKeyWindowWithFrame:(CGRect)frame;
- (id)initInView:(id)view WithFrame:(CGRect)frame;

- (BOOL)isDragging;

+ (NSString *)version;

+ (void)removeAllFromKeyWindow;
+ (void)removeAllFromView:(id)superView;

@end
