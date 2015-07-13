//
//  PlayingCard.m
//  CardGame
//
//  Created by Aron on 02/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(void) setRank:(NSUInteger)rank
{
    if(rank >= 1 && rank <= 13)
    {
        _rank = rank;
    }
}

-(void) setSuit:(NSString *)suit
{
    if([[self validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

-(NSArray*) validSuits
{
    return @[ @"♠︎", @"♣︎", @"♥︎", @"♦︎" ];
}

-(NSString*) contents
{
    NSArray* rankArray = @[ @"?", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A" ];
    return [rankArray[self.rank] stringByAppendingString:self.suit];
}

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    for(id cardObj in otherCards)
    {
        if([cardObj isKindOfClass:[PlayingCard class]])
        {
            PlayingCard* card = (PlayingCard*)cardObj;
            if([self.suit isEqualToString:card.suit])
            {
                score++;
            }
            if(self.rank == card.rank)
            {
                score+=2;
            }
        }
    }
    return score;
}

@end
