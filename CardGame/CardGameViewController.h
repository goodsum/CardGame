//
//  ViewController.h
//  CardGame
//
//  Created by Aron on 02/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//
// Abstract class. Must subclass.

#import <UIKit/UIKit.h>

#import "Deck.h"

@interface CardGameViewController : UIViewController

-(Deck*) createDeck;

@end

