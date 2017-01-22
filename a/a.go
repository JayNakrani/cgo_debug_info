package a

import "fmt"

//go:noinline
func A() int {
	fmt.Println("A()")
	return 42
}
