#!/bin/sh

numcpus=23
jobs=$((${numcpus} - 1))

covLinux() {
	swift \
		test \
		--quiet \
		--parallel \
		--enable-code-coverage \
		--jobs ${jobs} ||
		exec sh -c 'echo TEST FAILURE; exit 1'

	llvm-cov \
		export \
		-format=lcov \
		./.build/debug/FloatToDataPackageTests.xctest \
		-instr-profile ./.build/debug/codecov/default.profdata |
		cat >./cov.lcov

	llvm-cov \
		report \
		--ignore-filename-regex=.build \
		--summary-only \
		./.build/debug/FloatToDataPackageTests.xctest \
		-instr-profile ./.build/debug/codecov/default.profdata

	exit $?
}

covDarwin() {
  exec sh -c 'echo TODO: not implemented for macOS; exit 1'
}

case $(uname -o) in
GNU/Linux)
	covLinux
	;;
Darwin)
	covDarwin
	;;
*)
	echo 'unknown os: '$(uname -o)
	exit 1
	;;
esac
