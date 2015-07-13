//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Aron on 04/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype) init
{
    self = [super init];
    if(self)
    {
        NSArray* suits = @[ @"♠︎", @"♣︎", @"♥︎", @"♦︎" ];
        
        for(NSString* suit in suits)
        {
            for(NSUInteger rank = 1; rank<14; rank++)
            {
                PlayingCard* card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
