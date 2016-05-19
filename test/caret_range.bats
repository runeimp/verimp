
load env_helper

@test "Caret Range vs partial SemVer MMP [comparator minor higher]" {
	run ./verimp ^1.2.3 1.1
	[ "$status" -eq 1 ]
	[ "$output" = "$MATCH_TAG_BAD ^1.2.3 :: 1.1.0" ]
}

@test "Caret Range vs partial SemVer MMP [comparator minor lower]" {
	run ./verimp ^1.2.3 1.4
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ^1.2.3 :: 1.4.0" ]
}

@test "Caret Range vs partial SemVer MMP [comparator patch higher]" {
	run ./verimp ^1.2.3 1.2.0
	[ "$status" -eq 1 ]
	[ "$output" = "$MATCH_TAG_BAD ^1.2.3 :: 1.2.0" ]
}

@test "Caret Range vs partial SemVer MMP [comparator patch lower]" {
	run ./verimp ^1.2.3 1.2.4
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ^1.2.3 :: 1.2.4" ]
}

@test "Caret Range vs partial SemVer MMP [comparator equality]" {
	run ./verimp ^1.2.3 1.2.3
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ^1.2.3 :: 1.2.3" ]
}



@test "Caret Range vs partial SemVer MMP with major zero [comparator patch higher]" {
	run ./verimp ^0.1.2 0.1
	[ "$status" -eq 1 ]
	[ "$output" = "$MATCH_TAG_BAD ^0.1.2 :: 0.1.0" ]
}

@test "Caret Range vs partial SemVer MMP with major zero [comparator patch lower]" {
	run ./verimp ^0.1.2 0.1.3
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ^0.1.2 :: 0.1.3" ]
}

@test "Caret Range vs partial SemVer MMP with major zero [comparator equality]" {
	run ./verimp ^0.1.2 0.1.2
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ^0.1.2 :: 0.1.2" ]
}


@test "Caret Range vs partial SemVer MMP with major & minor zeros [comparator patch higher]" {
	run ./verimp ^0.0.1 0.0.0
	[ "$status" -eq 1 ]
	[ "$output" = "$MATCH_TAG_BAD ^0.0.1 :: 0.0.0" ]
}

@test "Caret Range vs partial SemVer MMP with major & minor zeros [comparator patch lower]" {
	run ./verimp ^0.0.1 0.0.2
	[ "$status" -eq 1 ]
	[ "$output" = "$MATCH_TAG_BAD ^0.0.1 :: 0.0.2" ]
}

@test "Caret Range vs partial SemVer MMP with major & minor zeros [comparator equality]" {
	run ./verimp ^0.0.1 0.0.1
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ^0.0.1 :: 0.0.1" ]
}



