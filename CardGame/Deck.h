//
//  Deck.h
//  CardGame
//
//  Created by Aron on 02/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card*)card atTop:(BOOL)atTop;
-(void) addCard:(Card*)card;

-(Card*) drawRandomCard;

@property(nonatomic, retain) NSMutableArray* cards;

@end
