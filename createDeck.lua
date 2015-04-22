card = {}
deck = {}
cards_in_hand = {}

function createDeck(deck) do
    suits = {"hearts", "spades", "clubs", "diamonds"}
    faces = {"2", "3", "4", "5", "6", "7", "8",
                "9","10","Jack", "King", "Queen", "Ace"}
    for i=1, #suits, 1 do
        for j=1, #faces, 1 do
            --give each suit 13 face cards
            --assign the value of each face
            if j == "2" then
                value = 2
            elseif j == "3" then
                value = 3
            elseif j == "4" then
                value = 4
            elseif j == "5" then
                value = 5
            elseif j == "6" then
                value = 6
            elseif j == "7" then
                value = 7
            elseif j == "8" then
                value = 8
            elseif j== "9" then
                value = 9
            elseif j == "10" or j == "Jack" or j=="Queen" or j=="King" then
                value = 10
            elseif j=="Ace" and not(cards_in_hand.value + 11 >= 21) then
                value = 11
            elseif j == "Ace" then
                value = 1
            end

            card = {face = faces[j], suit = suits[i], value = value}
            table.insert(deck,card)
            --when thats done add cards with face suit 
            --and value to the deck of cards
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

function main() do
	createDeck(deck)
	print("Here is your deck:")
	for i in list_iter(deck) do
		print("This is a "..i.face.." of "..i.suit..".")
	end
end
end
main()
