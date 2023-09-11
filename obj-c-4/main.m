//
//  main.m
//  obj-c-4
//
//  Created by Юлия Дебелова on 11.09.2023.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Какое ТЗ, такое и ХЗ. Честно, не поняла, что нужно сделать...
        Robot *robot = [[Robot alloc]init];
        [robot print];
        // Научим робота понимать текстовые команды:
        robot.path = ^MovementDirection(NSString * direction) {
            if ([direction isEqual: @"up"]) {
                return MovementDirectionUp;
            } else if ([direction isEqual: @"down"]) {
                return MovementDirectionDown;
            } else if ([direction isEqual: @"left"]) {
                return MovementDirectionLeft;
            } else if ([direction isEqual: @"right"]) {
                return MovementDirectionRight;
            } else return MovementDirectionWait;
        };
        // Погоняем по полю
        [robot run:robot.path(@"down")];
        [robot run:robot.path(@"down")];
        [robot run:robot.path(@"left")];
        [robot run:robot.path(@"wait")];
        // Переучим его как-нибудь по-другому. Пусть общается на эльфийском
        robot.path = ^MovementDirection(NSString * direction) {
            if ([direction isEqual: @"pu"]) {
                return MovementDirectionUp;
            } else if ([direction isEqual: @"nowd"]) {
                return MovementDirectionDown;
            } else if ([direction isEqual: @"tfel"]) {
                return MovementDirectionLeft;
            } else if ([direction isEqual: @"thgir"]) {
                return MovementDirectionRight;
            } else return MovementDirectionWait;
        };
        [robot run:robot.path(@"nowd")];
        [robot run:robot.path(@"tfel")];
        // Пошлем туда, не знаю куда. При помощи относительной телепортации :)
        [robot teleport:^CGPoint(CGPoint from){
            return CGPointMake(from.x - 5, from.y + 10);
        }];
    }
    return 0;
}
