package test;

import utest.Runner;
import utest.ui.Report;
import test.TestAlphabet;
import test.TestBlocklist;
import test.TestEncoding;
import test.TestMinLength;

class TestMain {
	public static function main() {
		var runner = new Runner();

		runner.addCase(new TestAlphabet());
		runner.addCase(new TestBlocklist());
		runner.addCase(new TestEncoding());
		runner.addCase(new TestMinLength());

		Report.create(runner);
		runner.run();
	}
}
