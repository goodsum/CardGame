//
//  Card.h
//  CardGame
//
//  Created by Aron on 02/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString* contents;

@property(nonatomic, getter=isChosen) BOOL chosen;
@property(nonatomic, getter=isMatched) BOOL matched;

-(int) match:(NSArray*)otherCards;

@end
