//
//  Card.m
//  CardGame
//
//  Created by Aron on 02/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    for(NSString* cardContent in otherCards)
    {
        if([_contents isEqualToString:cardContent])
        {
            score++;
        }
    }
    return score;
}

@end
