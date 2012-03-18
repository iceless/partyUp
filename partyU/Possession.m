//
//  Possession.m
//  partyU
//
//  Created by Jie Wu on 3/13/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//


#import "Possession.h"

@implementation Possession

@synthesize possessionName = _possessionName;
@synthesize serialNumber = _serialNumber;
@synthesize valueInDollars = _valueInDollars;
@synthesize dateCreated = _dateCreated;

- (id)init
{
    return [self initWithPossessionName:@"Possession"
                         ValueInDollars:0
                           serialNumber:@""];
}

- (id)initWithPossessionName:(NSString *)name
              ValueInDollars:(int)value
                serialNumber:(NSString *)sNumber
{
    self = [super init];
    
    self.possessionName = name;
    self.serialNumber = sNumber;
    self.valueInDollars = value;
    self.dateCreated = [[NSDate alloc] init];
    
    return self;
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", 
                                   _possessionName, 
                                   _serialNumber,
                                   _valueInDollars,
                                   _dateCreated];
    
    return descriptionString;
}

+ (id)randomPossession
{
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",@"Rusty",@"Shiny", nil];
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",@"Spork",@"Mac", nil];
    
    int adjectiveIndex = rand() % [randomAdjectiveList count];
    int nounIndex = rand() % [randomNounList count];
    
    NSString * randomName = [NSString stringWithFormat:@"%@ %@",
                             [randomAdjectiveList objectAtIndex:adjectiveIndex],
                             [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    
    Possession *newPossession = [[self alloc] initWithPossessionName:randomName ValueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newPossession;
}

@end
