#!/usr/bin/env bats

load env_helper

@test "Tilde Range vs partial SemVer MMP [comparator minor higher]" {
	run ./verimp ~1.2.3 1.1
	[ "$status" -eq 1 ]
	[ "$output" = "$MATCH_TAG_BAD ~1.2.3 :: 1.1.0" ]
}

@test "Tilde Range vs partial SemVer MMP [comparator minor lower]" {
	run ./verimp ~1.2.3 1.3
	[ "$status" -eq 1 ]
	[ "$output" = "$MATCH_TAG_BAD ~1.2.3 :: 1.3.0" ]
}

@test "Tilde Range vs full SemVer MMP [comparator patch higher]" {
	run ./verimp ~1.2.3 1.2.2
	[ "$status" -eq 1 ]
	[ "$output" = "$MATCH_TAG_BAD ~1.2.3 :: 1.2.2" ]
}

@test "Tilde Range vs full SemVer MMP [comparator patch lower]" {
	run ./verimp ~1.2.3 1.2.4
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ~1.2.3 :: 1.2.4" ]
}

@test "Tilde Range vs full SemVer MMP [comparator equality]" {
	run ./verimp ~1.2.3 1.2.3
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ~1.2.3 :: 1.2.3" ]
}


@test "Tilde Range vs full SemVer MMP with Prerelease Tags (alpha, beta)" {
	run ./verimp ~1.2.3-alpha 1.2.3-beta
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ~1.2.3-alpha :: 1.2.3-beta" ]
}

@test "Tilde Range vs full SemVer MMP with Prerelease Tags (alpha, beta) [reversed input]" {
	run ./verimp 1.2.3-beta ~1.2.3-alpha
	[ "$status" -eq 0 ]
	[ "$output" = "$MATCH_TAG_GOOD ~1.2.3-alpha :: 1.2.3-beta" ]
}



