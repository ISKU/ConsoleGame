import java.util.*;

public class GuessingGameNonGUI {

	private static final String whatIsGuess = "What is your guess (1-10) ";
	private static final String userAnswerHigh = "Too high! ";
	private static final String userAnswerLow = "Too low! ";
	private static final String correctGameOver = "(Game Over) Correct! Well done! ";
	private static final String lostGameOver = "(Game Over) Sorry, you lose! ";
	private static final String playAgain = "Play again (y/n)? ";

	private static Scanner userInput = new Scanner(System.in);
	private static int correctAnswer, userInputAnswer;

	public static void main(String agrs[]) {
		Random randomNumber = new Random();
		boolean endOfGame = true;

		while (endOfGame) {
			correctAnswer = randomNumber.nextInt(10) + 1;
			playGame();
			endOfGame = checkEndOfGame();
		}
	}

	private static void playGame() {
		System.out.print("(4 Guesses left) " + whatIsGuess);
		for (int guessCount = 3; guessCount >= 0; guessCount--) {
			StringBuilder sentenceGame = new StringBuilder("(" + guessCount + " Guesses left) ");
			userInputAnswer = checkUserInputAnswer();
			if (checkGameOver(guessCount))
				break;
			compareUserinputWithCorrectAnswer(sentenceGame);
		}
	}

	private static int checkUserInputAnswer() {
		try {
			int input = Integer.parseInt(userInput.next());
			if (input > 0 && input < 11)
				return input;
			else
				throw new InputMismatchException();
		} catch (Exception InputMismatchException) {
			System.out.print(whatIsGuess);
			return checkUserInputAnswer();
		}
	}

	private static boolean checkGameOver(int guessCount) {
		if (correctAnswer == userInputAnswer) {
			System.out.print(correctGameOver);
			return true;
		}
		if (guessCount == 0) {
			System.out.print(lostGameOver + "(number was " + correctAnswer + ") ");
			return true;
		}
		return false;
	}

	private static void compareUserinputWithCorrectAnswer(StringBuilder sentenceGame) {
		StringBuilder checkLowOrHigh = new StringBuilder(sentenceGame);
		if (correctAnswer > userInputAnswer)
			checkLowOrHigh.append(userAnswerLow).append(whatIsGuess);
		else if (correctAnswer < userInputAnswer)
			checkLowOrHigh.append(userAnswerHigh).append(whatIsGuess);
		System.out.print(checkLowOrHigh);
	}

	private static boolean checkEndOfGame() {
		try {
			System.out.print(playAgain);
			char check = userInput.next().charAt(0);
			if (check == 'y')
				return true;
			else if (check == 'n')
				return false;
			else
				throw new InputMismatchException();
		} catch (Exception InputMismatchException) {
			return checkEndOfGame();
		}
	}
}