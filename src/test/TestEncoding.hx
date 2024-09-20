package test;

import utest.Test;
import utest.Assert;
import sqids.Sqids;

class TestEncoding extends Test {
	public function testSimple() {
		var sqids = new Sqids();
		var numbers = [1, 2, 3];
		var id = "86Rf07";

		Assert.equals(id, sqids.encode(numbers));
		Assert.same(numbers, sqids.decode(id));
	}

	public function testDifferentInputs() {
		var numbers = [0, 0, 0, 1, 2, 3, 100, 1000, 100000, 1000000, cast Math.floor(2147483647)];

		var sqids = new Sqids();
		Assert.same(numbers, sqids.decode(sqids.encode(numbers)));
	}

	public function testIncrementalNumbers() {
		var sqids = new Sqids();
		var ids = [
			"bM" => [0], "Uk" => [1], "gb" => [2], "Ef" => [3], "Vq" => [4], "uw" => [5], "OI" => [6], "AX" => [7], "p6" => [8], "nJ" => [9]];

		for (id => numbers in ids) {
			Assert.equals(id, sqids.encode(numbers));
			Assert.same(numbers, sqids.decode(id));
		}
	}

	public function testIncrementalNumbersSameIndex0() {
		var sqids = new Sqids();
		var ids = [
			"SvIz" => [0, 0], "n3qa" => [0, 1], "tryF" => [0, 2], "eg6q" => [0, 3], "rSCF" => [0, 4], "sR8x" => [0, 5], "uY2M" => [0, 6], "74dI" => [0, 7],
			"30WX" => [0, 8], "moxr" => [0, 9]];

		for (id => numbers in ids) {
			Assert.equals(id, sqids.encode(numbers));
			Assert.same(numbers, sqids.decode(id));
		}
	}

	public function testIncrementalNumbersSameIndex1() {
		var sqids = new Sqids();
		var ids = [
			"SvIz" => [0, 0], "nWqP" => [1, 0], "tSyw" => [2, 0], "eX68" => [3, 0], "rxCY" => [4, 0], "sV8a" => [5, 0], "uf2K" => [6, 0], "7Cdk" => [7, 0],
			"3aWP" => [8, 0], "m2xn" => [9, 0]];

		for (id => numbers in ids) {
			Assert.equals(id, sqids.encode(numbers));
			Assert.same(numbers, sqids.decode(id));
		}
	}

	public function testMultiInput() {
		var sqids = new Sqids();
		var numbers = [for (i in 0...100) i];
		var output = sqids.decode(sqids.encode(numbers));
		Assert.same(numbers, output);
	}

	public function testEncodingNoNumbers() {
		var sqids = new Sqids();
		Assert.equals("", sqids.encode([]));
	}

	public function testDecodingEmptyString() {
		var sqids = new Sqids();
		Assert.same([], sqids.decode(""));
	}

	public function testDecodingInvalidCharacter() {
		var sqids = new Sqids();
		Assert.same([], sqids.decode("*"));
	}
}
