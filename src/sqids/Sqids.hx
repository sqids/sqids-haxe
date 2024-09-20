package sqids;

import haxe.ds.StringMap;

class Sqids {
	public static final DEFAULT_ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	public static final DEFAULT_MIN_LENGTH = 0;
	public static final DEFAULT_BLOCKLIST = [
		'0rgasm', '1d10t', '1d1ot', '1di0t', '1diot', '1eccacu10', '1eccacu1o', '1eccacul0', '1eccaculo', '1mbec11e', '1mbec1le', '1mbeci1e', '1mbecile',
		'a11upat0', 'a11upato', 'a1lupat0', 'a1lupato', 'aand', 'ah01e', 'ah0le', 'aho1e', 'ahole', 'al1upat0', 'al1upato', 'allupat0', 'allupato', 'ana1',
		'ana1e', 'anal', 'anale', 'anus', 'arrapat0', 'arrapato', 'arsch', 'arse', 'ass', 'b00b', 'b00be', 'b01ata', 'b0ceta', 'b0iata', 'b0ob', 'b0obe',
		'b0sta', 'b1tch', 'b1te', 'b1tte', 'ba1atkar', 'balatkar', 'bastard0', 'bastardo', 'batt0na', 'battona', 'bitch', 'bite', 'bitte', 'bo0b', 'bo0be',
		'bo1ata', 'boceta', 'boiata', 'boob', 'boobe', 'bosta', 'bran1age', 'bran1er', 'bran1ette', 'bran1eur', 'bran1euse', 'branlage', 'branler',
		'branlette', 'branleur', 'branleuse', 'c0ck', 'c0g110ne', 'c0g11one', 'c0g1i0ne', 'c0g1ione', 'c0gl10ne', 'c0gl1one', 'c0gli0ne', 'c0glione', 'c0na',
		'c0nnard', 'c0nnasse', 'c0nne', 'c0u111es', 'c0u11les', 'c0u1l1es', 'c0u1lles', 'c0ui11es', 'c0ui1les', 'c0uil1es', 'c0uilles', 'c11t', 'c11t0',
		'c11to', 'c1it', 'c1it0', 'c1ito', 'cabr0n', 'cabra0', 'cabrao', 'cabron', 'caca', 'cacca', 'cacete', 'cagante', 'cagar', 'cagare', 'cagna',
		'cara1h0', 'cara1ho', 'caracu10', 'caracu1o', 'caracul0', 'caraculo', 'caralh0', 'caralho', 'cazz0', 'cazz1mma', 'cazzata', 'cazzimma', 'cazzo',
		'ch00t1a', 'ch00t1ya', 'ch00tia', 'ch00tiya', 'ch0d', 'ch0ot1a', 'ch0ot1ya', 'ch0otia', 'ch0otiya', 'ch1asse', 'ch1avata', 'ch1er', 'ch1ng0',
		'ch1ngadaz0s', 'ch1ngadazos', 'ch1ngader1ta', 'ch1ngaderita', 'ch1ngar', 'ch1ngo', 'ch1ngues', 'ch1nk', 'chatte', 'chiasse', 'chiavata', 'chier',
		'ching0', 'chingadaz0s', 'chingadazos', 'chingader1ta', 'chingaderita', 'chingar', 'chingo', 'chingues', 'chink', 'cho0t1a', 'cho0t1ya', 'cho0tia',
		'cho0tiya', 'chod', 'choot1a', 'choot1ya', 'chootia', 'chootiya', 'cl1t', 'cl1t0', 'cl1to', 'clit', 'clit0', 'clito', 'cock', 'cog110ne', 'cog11one',
		'cog1i0ne', 'cog1ione', 'cogl10ne', 'cogl1one', 'cogli0ne', 'coglione', 'cona', 'connard', 'connasse', 'conne', 'cou111es', 'cou11les', 'cou1l1es',
		'cou1lles', 'coui11es', 'coui1les', 'couil1es', 'couilles', 'cracker', 'crap', 'cu10', 'cu1att0ne', 'cu1attone', 'cu1er0', 'cu1ero', 'cu1o', 'cul0',
		'culatt0ne', 'culattone', 'culer0', 'culero', 'culo', 'cum', 'cunt', 'd11d0', 'd11do', 'd1ck', 'd1ld0', 'd1ldo', 'damn', 'de1ch', 'deich', 'depp',
		'di1d0', 'di1do', 'dick', 'dild0', 'dildo', 'dyke', 'encu1e', 'encule', 'enema', 'enf01re', 'enf0ire', 'enfo1re', 'enfoire', 'estup1d0', 'estup1do',
		'estupid0', 'estupido', 'etr0n', 'etron', 'f0da', 'f0der', 'f0ttere', 'f0tters1', 'f0ttersi', 'f0tze', 'f0utre', 'f1ca', 'f1cker', 'f1ga', 'fag',
		'fica', 'ficker', 'figa', 'foda', 'foder', 'fottere', 'fotters1', 'fottersi', 'fotze', 'foutre', 'fr0c10', 'fr0c1o', 'fr0ci0', 'fr0cio', 'fr0sc10',
		'fr0sc1o', 'fr0sci0', 'fr0scio', 'froc10', 'froc1o', 'froci0', 'frocio', 'frosc10', 'frosc1o', 'frosci0', 'froscio', 'fuck', 'g00', 'g0o', 'g0u1ne',
		'g0uine', 'gandu', 'go0', 'goo', 'gou1ne', 'gouine', 'gr0gnasse', 'grognasse', 'haram1', 'harami', 'haramzade', 'hund1n', 'hundin', 'id10t', 'id1ot',
		'idi0t', 'idiot', 'imbec11e', 'imbec1le', 'imbeci1e', 'imbecile', 'j1zz', 'jerk', 'jizz', 'k1ke', 'kam1ne', 'kamine', 'kike', 'leccacu10',
		'leccacu1o', 'leccacul0', 'leccaculo', 'm1erda', 'm1gn0tta', 'm1gnotta', 'm1nch1a', 'm1nchia', 'm1st', 'mam0n', 'mamahuev0', 'mamahuevo', 'mamon',
		'masturbat10n', 'masturbat1on', 'masturbate', 'masturbati0n', 'masturbation', 'merd0s0', 'merd0so', 'merda', 'merde', 'merdos0', 'merdoso', 'mierda',
		'mign0tta', 'mignotta', 'minch1a', 'minchia', 'mist', 'musch1', 'muschi', 'n1gger', 'neger', 'negr0', 'negre', 'negro', 'nerch1a', 'nerchia',
		'nigger', 'orgasm', 'p00p', 'p011a', 'p01la', 'p0l1a', 'p0lla', 'p0mp1n0', 'p0mp1no', 'p0mpin0', 'p0mpino', 'p0op', 'p0rca', 'p0rn', 'p0rra',
		'p0uff1asse', 'p0uffiasse', 'p1p1', 'p1pi', 'p1r1a', 'p1rla', 'p1sc10', 'p1sc1o', 'p1sci0', 'p1scio', 'p1sser', 'pa11e', 'pa1le', 'pal1e', 'palle',
		'pane1e1r0', 'pane1e1ro', 'pane1eir0', 'pane1eiro', 'panele1r0', 'panele1ro', 'paneleir0', 'paneleiro', 'patakha', 'pec0r1na', 'pec0rina', 'pecor1na',
		'pecorina', 'pen1s', 'pendej0', 'pendejo', 'penis', 'pip1', 'pipi', 'pir1a', 'pirla', 'pisc10', 'pisc1o', 'pisci0', 'piscio', 'pisser', 'po0p',
		'po11a', 'po1la', 'pol1a', 'polla', 'pomp1n0', 'pomp1no', 'pompin0', 'pompino', 'poop', 'porca', 'porn', 'porra', 'pouff1asse', 'pouffiasse', 'pr1ck',
		'prick', 'pussy', 'put1za', 'puta', 'puta1n', 'putain', 'pute', 'putiza', 'puttana', 'queca', 'r0mp1ba11e', 'r0mp1ba1le', 'r0mp1bal1e', 'r0mp1balle',
		'r0mpiba11e', 'r0mpiba1le', 'r0mpibal1e', 'r0mpiballe', 'rand1', 'randi', 'rape', 'recch10ne', 'recch1one', 'recchi0ne', 'recchione', 'retard',
		'romp1ba11e', 'romp1ba1le', 'romp1bal1e', 'romp1balle', 'rompiba11e', 'rompiba1le', 'rompibal1e', 'rompiballe', 'ruff1an0', 'ruff1ano', 'ruffian0',
		'ruffiano', 's1ut', 'sa10pe', 'sa1aud', 'sa1ope', 'sacanagem', 'sal0pe', 'salaud', 'salope', 'saugnapf', 'sb0rr0ne', 'sb0rra', 'sb0rrone', 'sbattere',
		'sbatters1', 'sbattersi', 'sborr0ne', 'sborra', 'sborrone', 'sc0pare', 'sc0pata', 'sch1ampe', 'sche1se', 'sche1sse', 'scheise', 'scheisse',
		'schlampe', 'schwachs1nn1g', 'schwachs1nnig', 'schwachsinn1g', 'schwachsinnig', 'schwanz', 'scopare', 'scopata', 'sexy', 'sh1t', 'shit', 'slut',
		'sp0mp1nare', 'sp0mpinare', 'spomp1nare', 'spompinare', 'str0nz0', 'str0nza', 'str0nzo', 'stronz0', 'stronza', 'stronzo', 'stup1d', 'stupid',
		'succh1am1', 'succh1ami', 'succhiam1', 'succhiami', 'sucker', 't0pa', 'tapette', 'test1c1e', 'test1cle', 'testic1e', 'testicle', 'tette', 'topa',
		'tr01a', 'tr0ia', 'tr0mbare', 'tr1ng1er', 'tr1ngler', 'tring1er', 'tringler', 'tro1a', 'troia', 'trombare', 'turd', 'twat', 'vaffancu10',
		'vaffancu1o', 'vaffancul0', 'vaffanculo', 'vag1na', 'vagina', 'verdammt', 'verga', 'w1chsen', 'wank', 'wichsen', 'x0ch0ta', 'x0chota', 'xana',
		'xoch0ta', 'xochota', 'z0cc01a', 'z0cc0la', 'z0cco1a', 'z0ccola', 'z1z1', 'z1zi', 'ziz1', 'zizi', 'zocc01a', 'zocc0la', 'zocco1a', 'zoccola'
	];

	private var alphabet:String;
	private var minLength:Int;
	private var blocklist:Array<String>;

	public function new(?options:SqidsOptions) {
		alphabet = options != null && options.alphabet != null ? options.alphabet : DEFAULT_ALPHABET;
		minLength = options != null && options.minLength != null ? options.minLength : DEFAULT_MIN_LENGTH;
		blocklist = options != null && options.blocklist != null ? options.blocklist : DEFAULT_BLOCKLIST;

		validateAlphabet();
		validateMinLength();
		filterBlocklist();

		alphabet = shuffle(alphabet);
	}

	public function encode(numbers:Array<Int>):String {
		if (numbers.length == 0)
			return "";

		var allInRange = true;
		for (n in numbers) {
			if (n < 0 || n > maxValue()) {
				allInRange = false;
				break;
			}
		}

		if (!allInRange) {
			throw 'Encoding supports numbers between 0 and ${maxValue()}';
		}

		return encodeNumbers(numbers);
	}

	public function decode(id:String):Array<Int> {
		var result = [];
		if (id == "")
			return result;

		var alphabetChars = alphabet.split("");
		for (c in id.split("")) {
			if (alphabetChars.indexOf(c) == -1)
				return result;
		}

		var prefix = id.charAt(0);
		var offset = alphabet.indexOf(prefix);
		var alphabetShuffled = alphabet.substr(offset) + alphabet.substr(0, offset);
		var chars = alphabetShuffled.split('');
		chars.reverse();
		alphabetShuffled = chars.join('');

		var slicedId = id.substr(1);
		while (slicedId.length > 0) {
			var separator = alphabetShuffled.substr(0, 1);
			var chunks = slicedId.split(separator);
			if (chunks.length > 0) {
				if (chunks[0] == "")
					return result;
				result.push(toNumber(chunks[0], alphabetShuffled.substr(1)));
				if (chunks.length > 1) {
					alphabetShuffled = shuffle(alphabetShuffled);
					slicedId = chunks.slice(1).join(separator);
				} else {
					break;
				}
			}
		}

		return result;
	}

	private function encodeNumbers(numbers:Array<Int>, increment:Int = 0):String {
		if (increment > alphabet.length) {
			throw "Reached max attempts to re-generate the ID";
		}

		var offset = numbers.length;
		for (i in 0...numbers.length) {
			offset += alphabet.charAt(numbers[i] % alphabet.length).charCodeAt(0) + i;
		}
		offset = offset % alphabet.length;

		offset = (offset + increment) % alphabet.length;

		var alphabetChars = alphabet.substr(offset) + alphabet.substr(0, offset);
		var prefix = alphabetChars.charAt(0);

		var chars = alphabetChars.split('');
		chars.reverse();
		alphabetChars = chars.join('');

		var ret = [prefix];

		for (i in 0...numbers.length) {
			ret.push(toId(numbers[i], alphabetChars.substr(1)));

			if (i < numbers.length - 1) {
				ret.push(alphabetChars.charAt(0));
				alphabetChars = shuffle(alphabetChars);
			}
		}

		var id = ret.join("");

		if (minLength > id.length) {
			id += alphabetChars.charAt(0);

			while (minLength - id.length > 0) {
				alphabetChars = shuffle(alphabetChars);

				var sliceLen = Std.int(Math.min(minLength - id.length, alphabetChars.length));
				id += alphabetChars.substr(0, sliceLen);
			}
		}

		if (isBlockedId(id)) {
			id = encodeNumbers(numbers, increment + 1);
		}

		return id;
	}

	private function shuffle(alphabet:String):String {
		var chars = alphabet.split("");

		for (i in 0...chars.length - 1) {
			var j = chars.length - 1 - i;
			var r = Std.int((i * j + chars[i].charCodeAt(0) + chars[j].charCodeAt(0)) % chars.length);
			var temp = chars[i];
			chars[i] = chars[r];
			chars[r] = temp;
		}

		return chars.join("");
	}

	private function toId(num:Int, alphabet:String):String {
		var id = [];
		var chars = alphabet.split("");
		var result = num;
		do {
			id.unshift(chars[result % chars.length]);
			result = Std.int(result / chars.length);
		} while (result > 0);
		return id.join("");
	}

	private function toNumber(id:String, alphabet:String):Int {
		var chars = alphabet.split("");
		var result = 0;
		for (char in id.split("")) {
			result = result * chars.length + chars.indexOf(char);
		}
		return result;
	}

	private function isBlockedId(id:String):Bool {
		var lowercaseId = id.toLowerCase();
		for (word in blocklist) {
			if (word.length <= lowercaseId.length) {
				if (lowercaseId.length <= 3 || word.length <= 3) {
					if (lowercaseId == word)
						return true;
				} else if (new EReg("\\d", "").match(word)) {
					if (StringTools.startsWith(lowercaseId, word) || StringTools.endsWith(lowercaseId, word))
						return true;
				} else if (lowercaseId.indexOf(word) != -1) {
					return true;
				}
			}
		}
		return false;
	}

	private function maxValue():Int {
		return 2147483647;
	}

	private function validateAlphabet():Void {
		if (haxe.io.Bytes.ofString(alphabet).length != alphabet.length) {
			throw "Alphabet cannot contain multibyte characters";
		}
		if (alphabet.length < 3) {
			throw "Alphabet length must be at least 3";
		}
		var uniqueChars = new StringMap<Bool>();
		for (char in alphabet.split("")) {
			uniqueChars.set(char, true);
		}
		if (Lambda.count(uniqueChars) != alphabet.length) {
			throw "Alphabet must contain unique characters";
		}
	}

	private function validateMinLength():Void {
		var minLengthLimit = 255;
		if (minLength < 0 || minLength > minLengthLimit) {
			throw 'Minimum length has to be between 0 and ${minLengthLimit}';
		}
	}

	private function filterBlocklist():Void {
		var filteredBlocklist = [];
		var alphabetChars = alphabet.toLowerCase().split("");
		for (word in blocklist) {
			if (word.length >= 3) {
				var wordLowercased = word.toLowerCase();
				var wordChars = wordLowercased.split("");
				var intersection = wordChars.filter(function(c) return alphabetChars.indexOf(c) != -1);
				if (intersection.length == wordChars.length) {
					filteredBlocklist.push(wordLowercased);
				}
			}
		}
		blocklist = filteredBlocklist;
	}
}

typedef SqidsOptions = {
	?alphabet:String,
	?minLength:Int,
	?blocklist:Array<String>
}
