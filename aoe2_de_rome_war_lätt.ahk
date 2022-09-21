; new single use keys with modifier mouse buttons
#SingleInstance, Force
SetBatchLines, -1
smallSleep := 1
; !alt,^ctrl,+shift

Array := []
Array.push("Alas, I could not micro well!")
Array.push("Alas, mine hotkeys wert lame!")
Array.push("Alas, mine berries wert too forward!")
Array.push("Alas, mine university did not accept wood as payment!")
Array.push("The Queen told the men to research Supplies!")
Array.push("The Queen forgot critical blacksmith upgrades!")
Array.push("The Queen colonised too many corners!")
Array.push("The Queen did place mining camps at the woodline!")
Array.push("The King misplaced his throne!")
Array.push("Mine tradecarts started trading berry futures!")
Array.push("Mine monks were all selfish(mimimi)!")
Array.push("Mine strategy smellt of fish traps!")
Array.push("Mine gold miners went to strike!")
Array.push("Mine villagers sought to play Age of Dice Games instead!")
Array.push("Mine villagers preferred to mine AgeCoin instead!")
Array.push("Mine network ping wert too high!")
Array.push("Mine Army desired instead to make it to Age of Empires III!")
Array.push("Mine Town Centre went vegan!")
Array.push("Mine siege workshops unionised!")
Array.push("Nobody wanted to farm cabbages anymore!")
Array.push("Thine economy did boom too great!")
Array.push("Thine cultural victory did prevail!")
Array.push("Thine city planning was too impeccable!")
Array.push("A Palisaded Community didst not make me a good neighbour!")
Array.push("A petard made it to the royal feast!")
Array.push("Small trees presented thee a risk to me!")
Array.push("Didst thee study under Nostradamus? Thine strategy contained perfect counters!")
Array.push("Under which god did thine monks worship!?")
Array.push("The stone market deepened my already depressing economy!")
Array.push("The castles couldst not install murder holes after the fact!")
Array.push("The trebuchets found themselves on mars!")
Array.push("The village found themselves without law and order! These are their stories!")
Array.push("Generation-A didst not want to work themselves to death!")


; -------------- CONTEXT IS BUILD MENU --------------
isBuildMenu(){
	; false for not a build menu
	; true for yes build menu
	sleep, 20
	PixelSearch, Px, Py, 65, 1205, 86, 1227, 0xe5e2a1, 1, Fast RGB
	if ErrorLevel{
		; did not find first menu
		PixelSearch, Px, Py, 318, 1343, 372, 1396, 0xcc0000, 1, Fast RGB
		if ErrorLevel{
			;MsgBox, not found
			return false
		}else{
			;MsgBox, Found
			return true
		}
	}else{
		; found on first menu, but need to confirm
		PixelSearch, Px, Py, 65, 1205, 86, 1227, 0x7f6535, 1, Fast RGB
		if ErrorLevel{
			;MsgBox, not found
			return false
		}else{
			;MsgBox, Found
			return true
		}
	}
}


; -------------- HOME ECO BUILD MENU --------------
checkContextEco(hotkey){
	if(isBuildMenu()){
		; build
		send, {Numpad7}
		sleep, %smallSleep%
		send, {%hotkey%}
	}else{
		; select with ctrl alt
		send, ^!%hotkey%
	}
}
Home & q::checkContextEco("q") return ; house
Home & w::checkContextEco("u") return ; market
Home & e::checkContextEco("e") return ; mill
Home & r::checkContextEco("r") return ; blacksmith
Home & a::checkContextEco("o") return ; wood camp
Home & s::checkContextEco("i") return ; dock
Home & d::checkContextEco("p") return ; mining camp
Home & f::checkContextEco("f") return ; farm / fish trap
Home & c::checkContextEco("c") return ; university
Home & z::checkContextEco("z") return ; monastery
Home & Tab::checkContextEco("l") return ; TC


; -------------- END MIL BUILD MENU --------------
checkContextMil(hotkey){
	if(isBuildMenu()){
		; build
		send, {Numpad8}
		sleep, %smallSleep%
		send, {%hotkey%}
	}else{
		; select with alt shift
		send, !+%hotkey%
	}
}
End & q::checkContextMil("q") return ; archery
End & v::checkContextMil("v") return ; barracks
End & e::checkContextMil("e") return ; stable
End & r::checkContextMil("r") return ; siege
End & s::checkContextMil("o") return ; palisade gate
End & w::checkContextMil("i") return ; palisade wall
End & Tab::checkContextMil("Numpad4") return ; outpost
End & z::checkContextMil("p") return ; watchtower
End & Space::checkContextMil("l") return ; castle
End & d::checkContextMil("z") return ; stone gate
End & a::checkContextMil("x") return ; stone wall
End & f::checkContextMil("f") return ; bombard tower
End & g::checkContextMil("b") return ; krepost / donjon
translate_group(hotkey){
	send, %hotkey%
}
End & 1::translate_group("^1")
End & 2::translate_group("^2")
End & 3::translate_group("^3")
End & 4::translate_group("^4")
End & 5::translate_group("^5")
End & 6::translate_group("^6")
End & 7::translate_group("^7")
End & 8::translate_group("^8")
End & 9::translate_group("^9")
End & 0::translate_group("^0")


; -------------- WSAD TRANSLATE TO UIOP --------------
select_eco(hotkey){
	send, %hotkey%
}
!w::select_eco("!u") return
!s::select_eco("!i") return
!a::select_eco("!o") return
!d::select_eco("!p") return


; -------------- SELECT IDLE MIL --------------
^End::send, ^,


; -------------- ATTACK GROUND --------------
^y::
	PixelSearch, Px, Py, 318, 1242, 366, 1254, 0x7c9a42, 3, Fast RGB
	if ErrorLevel{
		; did not find, split
		sendRaw, v
		
	}else{
		; found, attack gnd
		sendRaw, y
		sleep, %smallSleep%
		send, {LButton}
	}
return


; -------------- ABDICATE --------------
^Numpad9::
	send, {Enter}
	Sleep, 250

	maxLength := Array.Length() - 1
	Random, randomNum, 0, maxLength
	for index, element in Array{
		if((index - 1) = randomNum){
			sendRaw, %element%
		}
	}
	Sleep, 250
	send, {Enter}
	Sleep, 250
	send, {Enter}
	Sleep, 250
	sendRaw, I shall abdicate!
	send, {Enter}
return


; -------------- UTILITY --------------
^Numpad2::
	MouseGetPos, xMouse, yMouse
	PixelGetColor, colorOut, %xMouse%, %yMouse%, Fast
	MsgBox, X: %xMouse%, Y: %yMouse%, Color: %colorOut%
return
^Numpad3::
	stringVal := isBuildMenu()
	MsgBox, %stringVal%
return



NumpadMult::
exitapp