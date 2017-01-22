// A cgo binary
package main

import "C"

import (
	"fmt"
	"github.com/dhananjay92/cgo_debug_info/a"
)

func main() {
	fmt.Println(a.A())
}
