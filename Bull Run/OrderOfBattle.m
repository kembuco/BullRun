//
//  OrderOfBattle.m
//  Bull Run
//
//  Created by Dave Townsend on 1/5/13.
//  Copyright (c) 2013 Dave Townsend. All rights reserved.
//

#import "OrderOfBattle.h"
#import "Hex.h"
#import "Unit.h"
#import "SysUtil.h"

@implementation OrderOfBattle

#pragma mark - Persistence Methods

+ (OrderOfBattle*)createFromFile:(NSString *)filepath {
    OrderOfBattle* oob = [[OrderOfBattle alloc] init];

    if (oob) {
        [oob setUnits:[NSKeyedUnarchiver unarchiveObjectWithFile:filepath]];
    }

    return oob;
}

- (BOOL)saveToFile:(NSString *)filename {
    NSString* path = [[SysUtil applicationFileDir] stringByAppendingPathComponent:filename];
    BOOL success = [NSKeyedArchiver archiveRootObject:[self units] toFile:path];
    
    NSLog(@"Wrote file [%d] %@", success, path);
    
    return success;
}

#pragma mark - Behaviors

- (Unit*)unitInHex:(Hex)hex {
    NSUInteger idx = [_units indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL* stop) {
                                                          return HexEquals(((Unit*) obj).location, hex);
                                                      }];
    return idx != NSNotFound ? [_units objectAtIndex:idx] : nil;
}

- (NSArray*)unitsForSide:(PlayerSide)side {
    return nil; // TODO:
}

@end
