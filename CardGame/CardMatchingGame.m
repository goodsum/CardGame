//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Aron on 08/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(nonatomic, readwrite) NSInteger score;
@property(nonatomic, strong) NSMutableArray* cards; // of Cards
@property(nonatomic, readwrite) NSUInteger cardsToMatch;
@end

@implementation CardMatchingGame

static const int MATCH_MULTIPLIER = 20;
static const int MATCH_PENALTY = 2;
static const int SELECT_PENALTY = 1;

-(instancetype) initWithDeckSize:(NSUInteger)deckSize withDeck:(Deck *)deck
{
    self = [super init];
    if(self)
    {
        self.cardsToMatch = 2; // Defaults
        self.score = 0;
        self.matchInfoString = [[NSAttributedString alloc] initWithString:@"New Game!"];
        
        for(int i=0; i<deckSize; i++)
        {
            Card* card = [deck drawRandomCard];
            if(card)
            {
                [self.cards addObject:card];
            }
        }
    }
    return self;
}

-(NSMutableArray*) cards
{
    if(!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void) selectCardAtIndex:(NSUInteger)index
{
    if(self.cards.count > index)
    {
        Card* card = [self cardAtIndex:index];
        if(card && !card.isMatched)
        {
            if(card.isChosen)
            {
                card.chosen = false;
                self.score -= SELECT_PENALTY;
            }
            else
            {
                card.chosen = true;
                
                NSMutableArray* chosenCards = [[NSMutableArray alloc] init];
                
                for(Card* otherCard in self.cards)
                {
                    if(otherCard != card && otherCard.isChosen && !otherCard.isMatched)
                    {
                        [chosenCards addObject:otherCard];
                    }
                }
                
                if(chosenCards.count + 1 == self.cardsToMatch)
                {
                    NSUInteger matchScore = 0;
                    
                    for(Card* otherCard in chosenCards)
                    {
                        NSUInteger thisMatchScore = [otherCard match:@[ card ]];
                        if(thisMatchScore)
                        {
                            matchScore += thisMatchScore;
                        }
                        else
                        {
                            matchScore = 0;
                            self.score -= MATCH_PENALTY;
                            break;
                        }
                    }
                    
                    NSString* listOfCards = card.contents;
                    for(Card* otherCard in chosenCards)
                    {
                        listOfCards = [listOfCards stringByAppendingString:@" "];
                        listOfCards = [listOfCards stringByAppendingString:otherCard.contents];
                    }
                    
                    if(matchScore)
                    {
                        self.score += matchScore * MATCH_MULTIPLIER;
                        card.matched = true;
                        card.chosen = false;
                        
                        for(Card* otherCard in chosenCards)
                        {
                            otherCard.matched = true;
                        }
                        self.matchInfoString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Good match! %@ matched for %lu points.", listOfCards, (unsigned long)matchScore * MATCH_MULTIPLIER]];
                    }
                    else
                    {
                        self.score -= MATCH_PENALTY;
                        self.matchInfoString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Bad match! %@ do not match. %d points deducted.", listOfCards, MATCH_PENALTY]];
                    }
                    
                    for(Card* otherCard in chosenCards)
                    {
                        otherCard.chosen = false;
                    }
                }
            }
        }
    }
}

-(Card*) cardAtIndex:(NSUInteger)index
{
    Card* instance = nil;
    if(self.cards.count > index)
    {
        instance = self.cards[index];
    }
    return instance;
}

-(void) setGameModeIsMatchTwo:(BOOL)isMatchTwo
{
    self.cardsToMatch = isMatchTwo ? 2 : 3;
}

@end
