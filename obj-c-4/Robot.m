//
//  Robot.m
//  obj-c-4
//
//  Created by Юлия Дебелова on 11.09.2023.
//

#import "Robot.h"


@implementation Robot
- (id)init {
    if (self = [super init]) {
        self.coordinates = CGPointMake(0, 0);
    }
    return self;
}
- (void)run:(MovementDirection)direction {
    if (direction == MovementDirectionUp) {
        _coordinates.y++;
    } else if (direction == MovementDirectionDown) {
        _coordinates.y--;
    } else if (direction == MovementDirectionLeft) {
        _coordinates.x--;
    } else if (direction == MovementDirectionRight) {
        _coordinates.y++;
    }
    [self print];
}
- (void)print {
    NSLog(@"%f, %f", _coordinates.x, _coordinates.y);
}

- (void)teleport:(nonnull CGPoint (^)(CGPoint))moveTo {
    _coordinates = moveTo(_coordinates);
    [self print];
}

@end
