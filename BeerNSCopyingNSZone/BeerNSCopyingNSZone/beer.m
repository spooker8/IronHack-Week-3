//
//  beer.m
//  BeerNSCopyingNSZone
//
//  Created by Anand Kumar on 5/25/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "beer.h"

@implementation beer


-(id)copyWithZone:(NSZone *)zone {
    
    Beer *copyBeer = [[Beer allocWithZone:zone] init];
    if (copyBeer != nil) {
        copyBeer.brand = [self.brand copy];
    }
    
    return copyBeer;
    
    
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder

{
    
    [aCoder encodeObject:self.brand forKey:@"theBraaaaannndd"];
    
}




- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super init];
    if (self) {
        
        self.brand = [aDecoder decodeObjectForKey:@"theBrannnddd"];
                      
    }
    return self;
    
    
}

@end
