//
//  Deck.m
//  CardGame
//
//  Created by Aron on 02/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import "Deck.h"

@implementation Deck

-(void) addCard:(Card*)card atTop:(BOOL)atTop
{
    if(atTop)
        [self.cards insertObject:card atIndex:0];
    else [self.cards addObject:card];
}

-(void) addCard:(Card*)card
{
    [self addCard:card atTop:true];
}

-(Card*) drawRandomCard
{
    Card* randomCard = nil;
    if(self.cards.count)
    {
        int randomIndex = arc4random() % self.cards.count;
        randomCard = self.cards[randomIndex];
        [self.cards removeObjectAtIndex:randomIndex];
    }
    return randomCard;
}

-(NSMutableArray*) cards
{
    if(!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

@end
