//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Aron on 08/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"


@interface CardMatchingGame : NSObject

-(instancetype) initWithDeckSize:(NSUInteger)deckSize withDeck:(Deck*)deck;
-(void) selectCardAtIndex:(NSUInteger)index;
-(Card*) cardAtIndex:(NSUInteger)index;

-(void) setGameModeIsMatchTwo:(BOOL)isMatchTwo;

@property(nonatomic, readonly) NSInteger score;
@property(nonatomic, strong) NSAttributedString* matchInfoString;

@end
