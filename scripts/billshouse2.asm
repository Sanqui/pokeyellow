Func_f2418:
	ld hl, BillsHouseText_f243b
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_f2433
.asm_f2427
	ld hl, BillsHouseText_f2440
	call PrintText
	ld a, $2
	ld [wBillsHouseCurScript], a
	ret

.asm_f2433
	ld hl, BillsHouseText_f2445
	call PrintText
	jr .asm_f2427

BillsHouseText_f243b:
	TX_FAR _BillsHouseText_1e865
	db "@"

BillsHouseText_f2440:
	TX_FAR _BillsHouseText_1e86a
	db "@"

BillsHouseText_f2445:
	TX_FAR _BillsHouseText_1e86f
	db "@"

Func_f244a:
	CheckEvent EVENT_GOT_SS_TICKET
	jr nz, .asm_f247e
	ld hl, BillsHouseText_f248c
	call PrintText
	lb bc, S_S_TICKET, 1
	call GiveItem
	jr nc, .asm_f2485
	ld hl, BillsHouseText_f2491
	call PrintText
	SetEvent EVENT_GOT_SS_TICKET
	ld a, HS_CERULEAN_GUARD_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_CERULEAN_GUARD_2
	ld [wMissableObjectIndex], a
	predef HideObject
.asm_f247e
	ld hl, BillsHouseText_f249d
	call PrintText
	ret

.asm_f2485
	ld hl, BillsHouseText_f2498
	call PrintText
	ret

BillsHouseText_f248c:
	TX_FAR _BillThankYouText
	db "@"

BillsHouseText_f2491:
	TX_FAR _SSTicketReceivedText
	TX_SFX_KEY_ITEM
	TX_BUTTON_SOUND
	db "@"

BillsHouseText_f2498:
	TX_FAR _SSTicketNoRoomText
	db "@"

BillsHouseText_f249d:
	TX_FAR _BillsHouseText_1e8cb
	db "@"

Func_f24a2:
	ld hl, BillsHouseText_f24a9
	call PrintText
	ret

BillsHouseText_f24a9:
	TX_FAR _BillsHouseText_1e8da
	db "@"

Func_f24ae:
	ld a, [wCurMap]
	cp BILLS_HOUSE
	jr nz, .asm_f24d2
	call CheckPikachuFollowingPlayer
	jr z, .asm_f24d2
	ld a, [wBillsHouseCurScript]
	cp $5
	ld e, $1b
	ret z
	cp $0
	ld e, $17
	ret z
	CheckEventHL EVENT_MET_BILL_2
	ld e, $20
	ret z
	ld e, $1f
	ret

.asm_f24d2
	ld e, $ff
	ret

Func_f24d5:
	ld a, $ff
	ld [wJoyIgnore], a
	xor a
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	call UpdateSprites
	ld hl, Data_f2505
	call ApplyPikachuMovementData
	ld a, $f ; pikachu
	ld [wEmotionBubbleSpriteIndex], a
	ld a, $1
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	call DisablePikachuFollowingPlayer
	callab InitializePikachuTextID
	ret

Data_f2505:
	db $00
	db $20
	db $20
	db $20
	db $1e
	db $3f

Func_f250b:
	ld hl, Data_f251c
	ld b, SPRITE_FACING_UP
	call TryApplyPikachuMovementData
	ld hl, Data_f2521
	ld b, SPRITE_FACING_RIGHT
	call TryApplyPikachuMovementData
	ret

Data_f251c:
	db $00
	db $1f
	db $1d
	db $38
	db $3f

Data_f2521:
	db $00
	db $1e
	db $1f
	db $1f
	db $1d
	db $38
	db $3f
