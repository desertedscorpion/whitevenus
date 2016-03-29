#!/bin/bash

EXECUTABLE=./phonetic.sh &&
    if [ 0 -lt ${#} ]
    then
	EXECUTABLE=${@}
    fi &&
    function test {
	INPUT=${1} &&
	    EXPECTED=${2} &&
	    OBSERVED=$(echo "${INPUT}" | "${EXECUTABLE}") &&
	    if [[ "${EXPECTED}" != "${OBSERVED}" ]]
	    then
		(cat <<EOF
There was a failure.
We inputed "${INPUT}".
We expected to see "${EXPECTED}".
But we saw "${OBSERVED}".
EOF
		) &&
		    exit 64 &&
		    true
	    fi &&
	    true
    } &&
    test ABC "ALFA BRAVO CHARLIE  " &&
    test ABCDEFGHIJKLMNOPQRSTUVWXYZ "ALFA BRAVO CHARLIE DELTA ECHO FOXTROT GOLF HOTEL INDIA JULIET KILO LIMA MIKE NOVEMBER OSCAR PAPA QUEBEC ROMEO SIERRA TANGO UNIFORM VICTOR WHISKEY XRAY YANKEE ZULU  " &&
    test abcdefghijklmnopqrstuvwxyz "alfa bravo charlie delta echo foxtrot golf hotel india juliet kilo lima mike november oscar papa quebec romeo sierra tango uniform victor whiskey xray yankee zulu  " &&
    test 1234567890 "One Two Three Four Five Six Seven Eight Nine Zero  " &&
    test "!@#$%^&*()" "Bang At Pound Dollar Percent Caret Ampersand Asterisk OpenParenthesis CloseParenthesis  " &&
    test "--+=" "Minus Minus Plus Equals  " &&
    test "{[]}" "OpenBrace OpenBracket CloseBracket CloseBrace  " &&
    test "\\\\|" "BackSlash Pipe  " &&
    test ";:\"\'" "Semicolon Colon DoubleQuote SingleQuote  " &&
    test "<,.>" "LessThan Comma Period GreaterThan  " &&
    test "?/" "Question ForwardSlash  " &&
    echo ALL TESTS PASSED &&
    true
