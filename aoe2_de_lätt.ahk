; new single use keys with modifier mouse buttons
#SingleInstance, Force
smallSleep := 1

; choose monitor size option
monitor := 1 ; 1=2560x1440  2=1920x1080


; -------------- HOME ECO BUILD MENU --------------
build_eco(hotkey){
	send, {Numpad7}
	sleep, %smallSleep%
	send, {%hotkey%}
}
Home & q::build_eco("q") return ; house
Home & w::build_eco("u") return ; market
Home & e::build_eco("e") return ; mill
Home & r::build_eco("r") return ; blacksmith
Home & a::build_eco("o") return ; wood camp
Home & s::build_eco("i") return ; dock
Home & d::build_eco("p") return ; mining camp
Home & f::build_eco("f") return ; farm / fish trap
Home & c::build_eco("c") return ; university
Home & z::build_eco("z") return ; monastery
Home & Tab::build_eco("Numpad6") return ; TC


; -------------- END MIL BUILD MENU --------------
build_mil(hotkey){
	send, {Numpad8}
	sleep, %smallSleep%
	send, {%hotkey%}
}
End & q::build_mil("q") return ; archery
End & v::build_mil("v") return ; barracks
End & e::build_mil("e") return ; stable
End & r::build_mil("r") return ; siege
End & s::build_mil("o") return ; palisade gate
End & w::build_mil("i") return ; palisade wall
End & Tab::build_mil("Numpad4") return ; outpost
End & z::build_mil("p") return ; watchtower
End & Space::build_mil("Numpad5") return ; castle
End & d::build_mil("z") return ; stone gate
End & a::build_mil("x") return ; stone wall
End & f::build_mil("f") return ; bombard tower
End & b::build_mil("b") return ; krepost / donjon
translate_group(hotkey){
	send, %hotkey%
}
End & 1::translate_group("^1")
End & 2::translate_group("^2")
End & 3::translate_group("^3")
End & 4::translate_group("^4")
End & 5::translate_group("^5")


; -------------- SELECT ALL ECO WSAD (TRANSLATE TO UIOP) --------------
select_eco(hotkey){
	send, %hotkey%
}
!w::select_eco("!u") return
!s::select_eco("!i") return
!a::select_eco("!o") return
!d::select_eco("!p") return


; -------------- ATTACK GROUND --------------
y::
	send, ^y
	sleep, %smallSleep%
	send, {LButton}
return


NumpadMult::
exitapp