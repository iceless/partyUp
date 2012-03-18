//
//  Possession.h
//  partyU
//
//  Created by Jie Wu on 3/13/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject
{

}

@property (nonatomic,strong) NSString *possessionName;
@property (nonatomic,strong) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic,strong) NSDate *dateCreated;

- (id)initWithPossessionName:(NSString *)name
              ValueInDollars:(int)value
                serialNumber:(NSString *)sNumber;

+ (id)randomPossession;

@end
