package blackjack

import "slices"

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	switch card {
	case "ace":
		return 11
	case "two":
		return 2
	case "three":
		return 3
	case "four":
		return 4
	case "five":
		return 5
	case "six":
		return 6
	case "seven":
		return 7
	case "eight":
		return 8
	case "nine":
		return 9
	case "ten":
		fallthrough
	case "jack":
		fallthrough
	case "queen":
		fallthrough
	case "king":
		return 10
	default:
		return 0
	}
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	cardSum := ParseCard(card1) + ParseCard(card2)

	switch {
	case card1 == "ace" && card2 == "ace":
		return "P"
	case cardSum == 21:
		if slices.Contains([]string{"ace", "ten", "jack", "queen", "king"}, dealerCard) {
			return "S"
		} else {
			return "W"
		}
	case cardSum >= 17 && cardSum <= 20:
		return "S"
	case cardSum >= 12 && cardSum <= 16:
		if ParseCard(dealerCard) >= 7 {
			return "H"
		} else {
			return "S"
		}
	case cardSum <= 11:
		return "H"
	default:
		return "H"
	}
}
