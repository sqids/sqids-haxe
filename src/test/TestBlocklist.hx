package test;

import utest.Test;
import utest.Assert;
import sqids.Sqids;

class TestBlocklist extends Test {
	public function new() {
		super();
	}

	public function testDefaultBlocklist() {
		var sqids = new Sqids();

		Assert.same([4572721], sqids.decode("aho1e"));
		Assert.equals("JExTR", sqids.encode([4572721]));
	}

	public function testEmptyBlocklist() {
		var sqids = new Sqids({
			blocklist: []
		});

		Assert.same([4572721], sqids.decode("aho1e"));
		Assert.equals("aho1e", sqids.encode([4572721]));
	}

	public function testCustomBlocklist() {
		var sqids = new Sqids({
			blocklist: ["ArUO"]
		});

		Assert.same([4572721], sqids.decode("aho1e"));
		Assert.equals("aho1e", sqids.encode([4572721]));

		Assert.same([100000], sqids.decode("ArUO"));
		Assert.equals("QyG4", sqids.encode([100000]));
		Assert.same([100000], sqids.decode("QyG4"));
	}

	public function testBlocklist() {
		var sqids = new Sqids({
			blocklist: ["JSwXFaosAN", "OCjV9JK64o", "rBHf", "79SM", "7tE6"]
		});

		Assert.equals("1aYeB7bRUt", sqids.encode([1000000, 2000000]));
		Assert.same([1000000, 2000000], sqids.decode("1aYeB7bRUt"));
	}

	public function testDecodingBlocklistWords() {
		var sqids = new Sqids({
			blocklist: ["86Rf07", "se8ojk", "ARsz1p", "Q8AI49", "5sQRZO"]
		});

		Assert.same([1, 2, 3], sqids.decode("86Rf07"));
		Assert.same([1, 2, 3], sqids.decode("se8ojk"));
		Assert.same([1, 2, 3], sqids.decode("ARsz1p"));
		Assert.same([1, 2, 3], sqids.decode("Q8AI49"));
		Assert.same([1, 2, 3], sqids.decode("5sQRZO"));
	}

	public function testShortBlocklistWord() {
		var sqids = new Sqids({
			blocklist: ["pnd"]
		});

		Assert.same([1000], sqids.decode(sqids.encode([1000])));
	}

	public function testBlocklistFiltering() {
		var sqids = new Sqids({
			alphabet: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
			blocklist: ["sxnzkl"]
		});

		var id = sqids.encode([1, 2, 3]);
		var numbers = sqids.decode(id);

		Assert.equals("IBSHOZ", id);
		Assert.same([1, 2, 3], numbers);
	}

	public function testMaxEncodingAttempts() {
		var alphabet = "abc";
		var minLength = 3;
		var blocklist = ["cab", "abc", "bca"];

		var sqids = new Sqids({
			alphabet: alphabet,
			minLength: minLength,
			blocklist: blocklist
		});

		Assert.equals(minLength, alphabet.length);
		Assert.equals(minLength, blocklist.length);

		Assert.raises(function() {
			sqids.encode([0]);
		}, String);
	}
}
