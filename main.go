package main

import (
	"fmt"
	"net/http"
)

func helloworld(w http.ResponseWriter, req *http.Request) {
	w.Write([]byte("Github actions Docker hub Hello World"))
}

func main() {
	fmt.Println("Start app")
	http.HandleFunc("/", helloworld)
	fmt.Println("listening on 8090")
	http.ListenAndServe(":8090", nil)
}
