--BLACKJACK.LUA
--author: Savannah Stuart

--defining these globally so that the classes so to speak are not 
--unknown to functions outside of createDeck
card = {}
deck = {}
cards_in_hand = {}
suits = {"hearts", "spades", "clubs", "diamonds"}
faces = {"2", "3", "4", "5", "6", "7", "8",
                "9","10","Jack", "King", "Queen", "Ace"}
debug = true


function dealCard(deck) do
	--needs to randomly give a card that is has not already left the deck
	math.randomseed(os.time())--uses current time as seed
	num_face = math.random(13)
	num_suit = math.random(4)

	local card_to_deal = {}

	for c in list_iter(deck) do
		if c.face == faces[num_face] and c.suit == suits[num_suit] then
			card_to_deal = c
			print (card_to_deal.face .." of "..card_to_deal.suit)
		end
	end

	table.insert(cards_in_hand, card_to_deal)

	for k,v in pairs(deck) do
		if v.face == faces[num_face] and v.suit == suits[num_suit] then
			table.remove(deck, k)
			--at the element of the card that we just dealt
			--remove from the deck
		end
	end
end
end


function list_iter (t)
  local i = 0
  local length = #t
  return function ()
           i = i + 1
           if i <= length then return t[i] end
         end
end

function createDeck(deck) do
    for i=1, #suits, 1 do
        for j=1, #faces, 1 do
            --give each suit 13 face cards
            --assign the value of each face
            if faces[j] == "2" then
                value = 2 
            elseif faces[j] == "3" then
                value = 3 
            elseif faces[j] == "4" then
                value = 4 
            elseif faces[j] == "5" then
                value = 5 
            elseif faces[j] == "6" then
                value = 6 
            elseif faces[j] == "7" then
                value = 7 
            elseif faces[j] == "8" then
                value = 8 
            elseif faces[j]== "9" then
                value = 9 
            elseif faces[j] == "10" or faces[j] == "Jack" or faces[j]=="Queen" or faces[j]=="King" then
                value = 10
            --elseif faces[j]=="Ace" and not(cards_in_hand.value + 11 >= 21) then
            --    value = 11
            elseif faces[j] == "Ace" then
                value = 1 
            end

            card = {face = faces[j], suit = suits[i], value = value}
			--print(card.value)
            table.insert(deck,card)
            --when thats done add cards with face suit 
            --and value to the deck of cards
        end
    end 
end
end


function print_hand()
	for i in list_iter(cards_in_hand) do
		if debug then print("in for") end
		print(i.face.." of "..i.suit.." has a value of "..i.value..".")
	end
end

function main() do
    createDeck(deck)
	dealCard(deck)
--	dealCard(deck)
	if debug then print("Here is your hand:") end
		print_hand()	

	print("Would you like to take a hit, or stay?(y for hit, n for stay)")
	input = io.read()
	if input == "y" then
		dealCard(deck)
		print_hand()
	end
end
end
main()
