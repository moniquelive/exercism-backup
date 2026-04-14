local FACE_PENALTY = { J = 1, Q = 2, K = 3, A = 4 }

local function new_deck(cards)
	local deck = { head = 1, tail = #cards }
	for i, card in ipairs(cards) do
		deck[i] = card
	end
	return deck
end

local function draw(deck)
	local head = deck.head
	if head > deck.tail then return nil end
	deck.head = head + 1
	local card = deck[head]
	deck[head] = nil
	return card
end

local function push(deck, card)
	local tail = deck.tail + 1
	deck.tail, deck[tail] = tail, card
end

local function collect(deck, pile, pile_size)
	for i = 1, pile_size do
		push(deck, pile[i])
		pile[i] = nil
	end
	return 0
end

local function deck_signature(deck)
	local parts = {}
	for i = deck.head, deck.tail do
		local card = deck[i]
		parts[#parts + 1] = FACE_PENALTY[card] and card or "N"
	end

	return table.concat(parts, ",")
end

local function state_key(deckA, deckB) return deck_signature(deckA) .. deck_signature(deckB) end
local function other_player(player) return 3 - player end

local function simulate_game(playerA, playerB)
	local total_cards = #playerA + #playerB
	local decks = { new_deck(playerA), new_deck(playerB) }
	local pile = {}
	local pile_size = 0
	local cards_played = 0
	local tricks = 0
	local current_player, penalty_due, last_payment_player = 1, 0, nil
	local seen_states = { [state_key(decks[1], decks[2])] = true }

	local function finish_trick(winner)
		pile_size = collect(decks[winner], pile, pile_size)
		tricks = tricks + 1

		if decks[winner].tail - decks[winner].head + 1 == total_cards then
			return { status = "finished", tricks = tricks, cards = cards_played }
		end

		current_player, penalty_due, last_payment_player = winner, 0, nil

		local key = state_key(decks[1], decks[2])
		if seen_states[key] then return { status = "loop", tricks = tricks, cards = cards_played } end
		seen_states[key] = true
	end

	while true do
		local card = draw(decks[current_player])

		if not card then
			local result = finish_trick(other_player(current_player))
			if result then return result end
		else
			cards_played = cards_played + 1
			pile_size = pile_size + 1
			pile[pile_size] = card

			local payment = FACE_PENALTY[card]
			if payment then
				penalty_due, last_payment_player, current_player = payment, current_player, other_player(current_player)
			elseif penalty_due > 0 then
				penalty_due = penalty_due - 1

				if penalty_due == 0 then
					local result = finish_trick(last_payment_player)
					if result then return result end
				end
			else
				current_player = other_player(current_player)
			end
		end
	end
end

return { simulate_game = simulate_game }
