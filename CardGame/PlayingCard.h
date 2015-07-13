//
//  PlayingCard.h
//  CardGame
//
//  Created by Aron on 02/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(nonatomic, retain) NSString* suit;
@property(nonatomic) NSUInteger rank;

@end
