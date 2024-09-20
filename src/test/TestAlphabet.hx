package test;

import utest.Assert;
import utest.Test;
import sqids.Sqids;

class TestAlphabet extends Test {
	public function new() {
		super();
	}

	public function testSimple() {
		var sqids = new Sqids({
			alphabet: '0123456789abcdef',
		});

		var numbers = [1, 2, 3];
		var id = '489158';

		Assert.equals(sqids.encode(numbers), id, "Encoding mismatch");
		Assert.same(sqids.decode(id), numbers, "Decoding mismatch");
	}

	public function testShortAlphabet() {
		var sqids = new Sqids({
			alphabet: 'abc',
		});

		var numbers = [1, 2, 3];
		Assert.same(sqids.decode(sqids.encode(numbers)), numbers, "Short alphabet encode-decode mismatch");
	}

	public function testLongAlphabet() {
		var sqids = new Sqids({
			alphabet: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+|{}[];:\'"/?.>,<`~',
		});

		var numbers = [1, 2, 3];

		Assert.same(sqids.decode(sqids.encode(numbers)), numbers, "Long alphabet encode-decode mismatch");
	}

	public function testMultibyteCharacters() {
		var thrown = false;
		try {
			var sqids = new Sqids({
				alphabet: 'ë1092',
			});
		} catch (e:Dynamic) {
			thrown = true;
			Assert.equals(e, "Alphabet cannot contain multibyte characters", "Exception message mismatch");
		}
		Assert.isTrue(thrown, "Expected exception was not thrown for multibyte characters");
	}

	public function testRepeatingAlphabetCharacters() {
		var thrown = false;
		try {
			var sqids = new Sqids({
				alphabet: 'aabcdefg',
			});
		} catch (e:Dynamic) {
			thrown = true;
			Assert.equals(e, "Alphabet must contain unique characters", "Exception message mismatch");
		}
		Assert.isTrue(thrown, "Expected exception was not thrown for repeating alphabet characters");
	}

	public function testTooShortAlphabet() {
		var thrown = false;
		try {
			var sqids = new Sqids({
				alphabet: 'ab',
			});
		} catch (e:Dynamic) {
			thrown = true;
			Assert.equals(e, "Alphabet length must be at least 3", "Exception message mismatch");
		}
		Assert.isTrue(thrown, "Expected exception was not thrown for too short alphabet");
	}
}
