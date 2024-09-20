package test;

import utest.Test;
import utest.Assert;
import sqids.Sqids;

class TestMinLength extends Test {
	public function testSimple() {
		var sqids = new Sqids({
			minLength: Sqids.DEFAULT_ALPHABET.length
		});

		var numbers = [1, 2, 3];
		var id = "86Rf07xd4zBmiJXQG6otHEbew02c3PWsUOLZxADhCpKj7aVFv9I8RquYrNlSTM";

		Assert.equals(id, sqids.encode(numbers));
		Assert.same(numbers, sqids.decode(id));
	}

	public function testIncremental() {
		var numbers = [1, 2, 3];

		var map = [
			6 => "86Rf07",
			7 => "86Rf07x",
			8 => "86Rf07xd",
			9 => "86Rf07xd4",
			10 => "86Rf07xd4z",
			11 => "86Rf07xd4zB",
			12 => "86Rf07xd4zBm",
			13 => "86Rf07xd4zBmi",
			Sqids.DEFAULT_ALPHABET.length + 0 => "86Rf07xd4zBmiJXQG6otHEbew02c3PWsUOLZxADhCpKj7aVFv9I8RquYrNlSTM",
			Sqids.DEFAULT_ALPHABET.length + 1 => "86Rf07xd4zBmiJXQG6otHEbew02c3PWsUOLZxADhCpKj7aVFv9I8RquYrNlSTMy",
			Sqids.DEFAULT_ALPHABET.length + 2 => "86Rf07xd4zBmiJXQG6otHEbew02c3PWsUOLZxADhCpKj7aVFv9I8RquYrNlSTMyf",
			Sqids.DEFAULT_ALPHABET.length + 3 => "86Rf07xd4zBmiJXQG6otHEbew02c3PWsUOLZxADhCpKj7aVFv9I8RquYrNlSTMyf1"
		];

		for (minLength => id in map) {
			var sqids = new Sqids({
				minLength: minLength
			});

			Assert.equals(id, sqids.encode(numbers));
			Assert.equals(minLength, sqids.encode(numbers).length);
			Assert.same(numbers, sqids.decode(id));
		}
	}

	public function testIncrementalNumbers() {
		var sqids = new Sqids({
			minLength: Sqids.DEFAULT_ALPHABET.length
		});

		var ids = [
			"SvIzsqYMyQwI3GWgJAe17URxX8V924Co0DaTZLtFjHriEn5bPhcSkfmvOslpBu" => [0, 0],
			"n3qafPOLKdfHpuNw3M61r95svbeJGk7aAEgYn4WlSjXURmF8IDqZBy0CT2VxQc" => [0, 1],
			"tryFJbWcFMiYPg8sASm51uIV93GXTnvRzyfLleh06CpodJD42B7OraKtkQNxUZ" => [0, 2],
			"eg6ql0A3XmvPoCzMlB6DraNGcWSIy5VR8iYup2Qk4tjZFKe1hbwfgHdUTsnLqE" => [0, 3],
			"rSCFlp0rB2inEljaRdxKt7FkIbODSf8wYgTsZM1HL9JzN35cyoqueUvVWCm4hX" => [0, 4],
			"sR8xjC8WQkOwo74PnglH1YFdTI0eaf56RGVSitzbjuZ3shNUXBrqLxEJyAmKv2" => [0, 5],
			"uY2MYFqCLpgx5XQcjdtZK286AwWV7IBGEfuS9yTmbJvkzoUPeYRHr4iDs3naN0" => [0, 6],
			"74dID7X28VLQhBlnGmjZrec5wTA1fqpWtK4YkaoEIM9SRNiC3gUJH0OFvsPDdy" => [0, 7],
			"30WXpesPhgKiEI5RHTY7xbB1GnytJvXOl2p0AcUjdF6waZDo9Qk8VLzMuWrqCS" => [0, 8],
			"moxr3HqLAK0GsTND6jowfZz3SUx7cQ8aC54Pl1RbIvFXmEJuBMYVeW9yrdOtin" => [0, 9]
		];

		for (id => numbers in ids) {
			Assert.equals(id, sqids.encode(numbers));
			Assert.same(numbers, sqids.decode(id));
		}
	}

	public function testMinLengths() {
		var minLengths = [0, 1, 5, 10, Sqids.DEFAULT_ALPHABET.length];
		var numberSets = [
			[0],
			[0, 0, 0, 0, 0],
			[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
			[100, 200, 300],
			[1000, 2000, 3000],
			[1000000],
			[2147483647]
		];

		for (minLength in minLengths) {
			for (numbers in numberSets) {
				var sqids = new Sqids({
					minLength: minLength
				});

				var id = sqids.encode(numbers);
				Assert.isTrue(id.length >= minLength);
				Assert.same(numbers, sqids.decode(id));
			}
		}
	}

	public function testOutOfRangeInvalidMinLength() {
		var minLengthLimit = 255;
		var minLengthError = 'Minimum length has to be between 0 and ${minLengthLimit}';

		Assert.raises(() -> new Sqids({minLength: -1}), String, minLengthError);
		Assert.raises(() -> new Sqids({minLength: minLengthLimit + 1}), String, minLengthError);
	}
}
