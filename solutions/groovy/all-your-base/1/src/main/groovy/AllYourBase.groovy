class AllYourBase {
    int inputBase
    List<Integer> digits

    AllYourBase(int inputBase, List<Integer> digits) {
        if (inputBase < 2) {
            throw new ArithmeticException("input_base < 2")
        }
        if (digits.any { it < 0 || it >= inputBase } ) {
            throw new ArithmeticException("invalid digit")
        }

        this.inputBase = inputBase
        this.digits = digits
    }

    def toInt() {
        int e = 0
        (int) this.digits.reverse().inject(0) { acc, digit ->
            acc + (Math.pow(this.inputBase, e++) * digit)
        }
    }

    def toBase(int i, int base) {
        def c = []
        while (i > 0) {
            c.add(i % base)
            i = i.intdiv(base)
        }
        c.reverse()
    }

    def rebase(int outputBase) {
        if (outputBase < 2) {
            throw new ArithmeticException("output_base < 2")
        }
        def ret = toBase(toInt(), outputBase)
        if (ret.isEmpty()) {
            return [0]
        }
        return ret
    }
}