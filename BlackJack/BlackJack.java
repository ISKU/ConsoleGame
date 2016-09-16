import java.util.InputMismatchException;
import java.util.Scanner;

public class BlackJack {
	
	private static Scanner userInput = new Scanner(System.in);
	private static int hasMoney = 10000;
	private static int betMoney;
	private static boolean winOrlose;

	private static Deck deck = new Deck();
	private static BlackJackHand dealerHand;
	private static BlackJackHand userHand;

	public static void main(String args[]) {

		boolean endOfGame = true;

		while (endOfGame) {
			System.out.println(Sentence.gameStart);
			System.out.println("You have " + hasMoney + " WONs");
			betMoney = OnTheBetting();
			playBlackJack();
			System.out.println(Sentence.gameEnd);
			endOfGame = checkEndOfGame();
		}
		System.out.println(Sentence.leaveMoney + hasMoney + "WON.");
	}

	static void playBlackJack() {
		dealerHand = new BlackJackHand();
		userHand = new BlackJackHand();
		
		for (int i = 0; i < 2; i++) {
			dealerHand.addCard(deck.dealCard());
			userHand.addCard(deck.dealCard());
		}

		if (firstTurnBlackJack()) {
			;
		} else {
			while (true) {
				if (checkBustedBlackJack())
					break;
				showingDealerAndUserCard(false);
				if (userChoiceHitOrStand() == 'H')
					userSelectHit();
				else {
					userSelectStand();
					break;
				}
			}
		}
		resultGame();
	}

	private static boolean checkBustedBlackJack() {
		if (dealerHand.getBlackJackValue() > 21)
			return true;
		if (userHand.getBlackJackValue() > 21)
			return true;
		return false;
	}

	private static boolean firstTurnBlackJack() {
		if (dealerHand.getBlackJackValue() == 21) {
			showingDealerAndUserCard(true);
			System.out.println(Sentence.dealerBlackJack);
			winOrlose = false;
			return true;
		}
		if (userHand.getBlackJackValue() == 21) {
			showingDealerAndUserCard(true);
			System.out.println(Sentence.userBlackJack);
			winOrlose = true;
			return true;
		}
		return false;
	}

	private static void resultGame() {
		int dealerScore = dealerHand.getBlackJackValue();
		int userScore = userHand.getBlackJackValue();
		StringBuilder score = new StringBuilder(dealerScore  + " points to " + userScore);
		
		if (dealerScore <= 21 && userScore <= 21)
			if (dealerScore == userScore) {
				score.append(Sentence.draw);
				winOrlose = false;
			} else if (dealerScore > userScore) {
				score.append(Sentence.dealerWin);
				winOrlose = false;
			} else {
				score.append(Sentence.youWin);
				winOrlose = true;
			}
		System.out.print(score);

		if (winOrlose)
			hasMoney = hasMoney + betMoney;
		else
			hasMoney = hasMoney - betMoney;

		if (hasMoney == 0)
			System.out.println(Sentence.outOfMoney);
	}

	private static void userSelectStand() {
		System.out.println(Sentence.userStand);
		while (dealerHand.getBlackJackValue() <= 16) {
			Card newCard = deck.dealCard();
			System.out.println(Sentence.dealerHitAndGetCard + newCard);
			dealerHand.addCard(newCard);
			if (dealerHand.getBlackJackValue() > 21) {
				showingDealerAndUserCard(true);
				System.out.println("\n" + Sentence.dealerBusted);
				winOrlose = true;
				return;
			}
		}
		showingDealerAndUserCard(true);
		System.out.println(Sentence.dealerTotal + dealerHand.getBlackJackValue());
	}

	private static void userSelectHit() {
		Card newCard = deck.dealCard();
		userHand.addCard(newCard);

		System.out.println(Sentence.userHit);
		System.out.println(Sentence.chooseCard + newCard);
		if (userHand.getBlackJackValue() > 21) {
			showingDealerAndUserCard(true);
			System.out.println(Sentence.youBusted);
			winOrlose = false;
		}
	}

	private static char userChoiceHitOrStand() {
		System.out.print(Sentence.choiceHitOrStand);
		try {
			char userAction = Character.toUpperCase(userInput.next().charAt(0));
			if (userAction != 'H' && userAction != 'S')
				throw new IllegalArgumentException();
			else
				return userAction;
		} catch (IllegalArgumentException e) {
			System.out.print(Sentence.invalidCoice);
			return userChoiceHitOrStand();
		}
	}

	private static void showingDealerAndUserCard(boolean dealerAllCardsOpen) {
		System.out.println(Sentence.line);
		System.out.printf("<Dealer cards>: %4s ", dealerAllCardsOpen ? dealerHand.getCard(0) : "??");
		for (int i = 1; i < dealerHand.getCardCount(); i++)
			System.out.printf("%4s ", dealerHand.getCard(i));

		System.out.print("\n  <Your cards>: ");
		for (int i = 0; i < userHand.getCardCount(); i++)
			System.out.printf("%4s ", userHand.getCard(i));
		System.out.println(Sentence.yourTotal + userHand.getBlackJackValue() + "\n");
	}

	private static int OnTheBetting() {
		try {
			System.out.print(Sentence.betting);
			int bet = Integer.parseInt(userInput.next());
			if (bet <= 0 || bet > hasMoney)
				throw new NumberFormatException();
			else
				return bet;
		} catch (NumberFormatException e) {
			System.out.println(Sentence.invalidBetting + hasMoney);
			return OnTheBetting();
		}
	}

	private static boolean checkEndOfGame() {
		if (hasMoney == 0)
			return false;
		else {
			try {
				System.out.print(Sentence.playAgain);
				char check = userInput.next().charAt(0);
				if (check == 'y')
					return true;
				else if (check == 'n')
					return false;
				else
					throw new InputMismatchException();
			} catch (InputMismatchException e) {
				return checkEndOfGame();
			}
		}
	}
}
