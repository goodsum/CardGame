//
//  ViewController.m
//  CardGame
//
//  Created by Aron on 02/06/2015.
//  Copyright (c) 2015 Aron. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (strong, nonatomic) Deck* deck;
@property (strong, nonatomic) CardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UISwitch *modeSwitch;
@property (weak, nonatomic) IBOutlet UILabel *matchInfoLabel;

@end

@implementation CardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self updateUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickCard:(UIButton*)sender
{
    NSUInteger index = [self.cardButtons indexOfObject:sender];
    [self.game selectCardAtIndex:index];
    self.modeSwitch.enabled = false;
    [self updateUI];
}

- (IBAction)didClickReset:(id)sender
{
    _game = NULL;
    [self game];
    self.modeSwitch.enabled = true;
    [self.game setGameModeIsMatchTwo:!self.modeSwitch.isOn];
    [self updateUI];
}

- (IBAction)didToggleMode:(id)sender
{
    UISwitch* toggle = sender;
    [self.game setGameModeIsMatchTwo:!toggle.isOn];
    [self updateUI];
}

-(void) updateUI
{
    for(UIButton* button in self.cardButtons)
    {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:button];
        Card* card = [self.game cardAtIndex:cardIndex];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        button.enabled = !card.matched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score %ld", (long)self.game.score];
    self.matchInfoLabel.attributedText = self.game.matchInfoString;
}

-(NSString*) titleForCard:(Card*)card
{
    return card.isChosen || card.isMatched ? card.contents : @"";
}

-(UIImage*) backgroundImageForCard:(Card*)card
{
    if(card.isChosen || card.isMatched)
    {
        return [UIImage imageNamed:@"playing-card-front"];
    }
    else return [UIImage imageNamed:@"playing-card-back"];
}

-(Deck*) deck
{
    if(!_deck)
    {
        _deck = [self createDeck];
    }
    return _deck;
}

// Abstract
-(Deck*) createDeck
{
    NSAssert(false, @"Must override this function using a subclass");
    return nil;
}

-(CardMatchingGame*) game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithDeckSize:self.cardButtons.count withDeck:[self createDeck]];
    return _game;
}

@end
