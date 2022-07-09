; new single use keys with modifier mouse buttons
#SingleInstance, Force
SetBatchLines, -1
smallSleep := 1
; !alt,^ctrl,+shift


; -------------- CONTEXT IS BUILD MENU --------------
isBuildMenu(){
	; false for not a build menu
	; true for yes build menu
	sleep, 20
	PixelSearch, Px, Py, 113, 1202, 129, 1217, 0xe0b45a, 1, Fast RGB
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
		PixelSearch, Px, Py, 39, 1229, 59, 1249, 0xfcee7a, 1, Fast RGB
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
End & b::checkContextMil("b") return ; krepost / donjon
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


; -------------- ATTACK GROUND --------------
^y::
	sendRaw, y
	sleep, %smallSleep%
	send, {LButton}
return


; -------------- UTILITY --------------
Numpad2::
	MouseGetPos, xMouse, yMouse
	PixelGetColor, colorOut, %xMouse%, %yMouse%, Fast
	MsgBox, X: %xMouse%, Y: %yMouse%, Color: %colorOut%
return
Numpad3::
	stringVal := isBuildMenu()
	MsgBox, %stringVal%
return


NumpadMult::
exitapp