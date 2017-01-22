#!/bin/sh

set -o xtrace

# Wherever go.1.8 is
GO_1_8="/path/to/go1.8/bin"

tmp=$(mktemp -d)

cd go/
go build main.go
mv main 1.7main
objdump --debugging 1.7main &> $tmp/1.7-go-debug
grep "a\.A" -B 2 -A 4 $tmp/1.7-go-debug

$GO_1_8 build main.go
mv main 1.8main
objdump --debugging 1.8main &> $tmp/1.8-go-debug
grep "a\.A" -B 2 -A 4 $tmp/1.8-go-debug

cd ../cgo/
go build main.go
mv main 1.7main
objdump --debugging 1.7main &> $tmp/1.7-cgo-debug
grep "a\.A" -B 2 -A 4 $tmp/1.7-cgo-debug

$GO_1_8 build main.go
mv main 1.8main
objdump --debugging 1.8main &> $tmp/1.8-cgo-debug
grep "a\.A" -B 2 -A 4 $tmp/1.8-cgo-debug
