#!/bin/bash

EXECUTABLE=./phonetic.sh &&
    if [ 0 -lt ${#} ]
    then
	EXECUTABLE=${@}
    fi &&
    echo EXEC: ${EXECUTABLE}
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
    test ABC "Alfa Beta" &&
    true
