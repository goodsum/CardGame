//
//  PlayingCardGameViewController.m
//  CardGame
//
//  Created by Aron on 06/07/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardGameViewController

-(Deck*) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
