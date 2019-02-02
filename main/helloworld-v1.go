package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	log.Print("Hello world received a request.")

	fmt.Fprintf(w, "Hello world\n")
}

func main() {
	log.Print("Hello world s`ample started.")

	http.HandleFunc("/api/v1/hello", handler)

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}