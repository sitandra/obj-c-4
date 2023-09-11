//
//  Robot.h
//  obj-c-4
//
//  Created by Юлия Дебелова on 11.09.2023.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MovementDirection){
    MovementDirectionUp = 0,
    MovementDirectionDown = 1,
    MovementDirectionLeft = 2,
    MovementDirectionRight = 3,
    MovementDirectionWait = 4
};

NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject
@property (nonatomic, readwrite) CGPoint coordinates;
@property (nonatomic, copy, nullable) MovementDirection (^path)(NSString*);
- (void) run: (MovementDirection) direction;
- (void) teleport: (CGPoint (^)(CGPoint))moveTo;
- (void) print;
@end

NS_ASSUME_NONNULL_END
