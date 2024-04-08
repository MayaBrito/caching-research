package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	n_req := 0
	IRRMapGlobal := make(map[string]float64)
	scanner := bufio.NewScanner(os.Stdin)
	// format
	// ObjectId
	for scanner.Scan() {
		item := scanner.Text()
		if _, mapped := IRRMapGlobal[item]; !mapped {
			IRRMapGlobal[item] = 0
		} 
		n_req++
	}

	if err := scanner.Err(); err != nil {
		fmt.Fprintln(os.Stderr, "Erro ao ler a entrada:", err)
	}

	irr := float64(n_req - len(IRRMapGlobal))/float64(n_req)

	fmt.Println(irr)
}