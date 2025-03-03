package main

import (
	"fmt"
	"log"
	"log/slog"
	"net/http"
)

func main() {
	fmt.Println("Conftest Test Server")

	h := http.NewServeMux()

	h.HandleFunc("/rego", func(w http.ResponseWriter, r *http.Request) {
		slog.Info("Request received")
		w.Write([]byte("{\"message\": \"Hello, World!\"}"))
		return
	})

	log.Fatal(http.ListenAndServe(":8080", h))

}
