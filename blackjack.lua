local function dealCard(deck) do
	--needs to randomly give a card that is has not already left the deck
	math.randomseed(os.time())--uses current time as seed
	num_card = math.random(52)
end


local function main() do
	print "Want to play some blackjack? (y/n)"
	response = io.read()
	if(response == "y") then
		createDeck(deck)
		dealCard(deck) --deals two randomly selected cards from the deck
		dealCard(deck)
	end
end

--defining these globally so that the classes so to speak are not 
--unknown to functions outside of createDeck
deck = {}
card = {}
cards_in_hand = {}

local function createDeck(deck)do
	suits = {"hearts", "spades", "clubs", "diamonds"}
	faces = {"2", "3", "4", "5", "6", "7", "8", 
				"9","10","Jack", "King", "Queen", "Ace"}
	--card = {suit = "hearts", face = "2"}
	for i=0, #suits, 1 do
		for j=0, #faces, 1 do
			--give each suit 13 face cards
			--assign the value of each face
			if j == "2" then 
				value = 2
			else if j == "3" then 
				value = 3
			else if j == "4" then
				value = 4
			else if j == "5" then
				value = 5 
			else if j == "6" then 
				value = 6
			else if j == "7" then
				value = 7
			else if j == "8" then
				value = 8
			else if j== "9" then 
				value = 9
			else if j == "10" or j == "Jack" or j=="Queen" or j=="King" then
				value = 10
			else if j=="Ace" and not(cards_in_hand.value + 11 >= 21) then
				value = 11
			else if j == "Ace" then
				value = 1
			end

			card = {face = j, suit = i, value = value}
			table.insert(deck,value)
			--when thats done add cards with face suit 
			--and value to the deck of cards

		end
	end
end

		 
