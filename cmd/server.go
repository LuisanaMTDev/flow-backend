package main

import (
	"log"
	"net/http"

	"github.com/LuisanaMTDev/flow-backend/internal/controllers"
	"github.com/LuisanaMTDev/flow-backend/internal/middlewares"
)

func main() {
	handlers := http.NewServeMux()

	handlers.HandleFunc("POST /register", controllers.Register)
	handlers.HandleFunc("POST /login", controllers.Login)
	handlers.HandleFunc("POST /logout", controllers.Logout)
	handlers.HandleFunc("GET /protected", middlewares.MakeHandler(controllers.CheckAuthHealth, middlewares.Authorization))
	

	corsMiddleware := middlewares.CORSMiddleware(middlewares.DefaultCORSConfig())
	handler := corsMiddleware(handlers)

	server := http.Server{Handler: handler, Addr: ":4322"}
	log.Fatal(server.ListenAndServe())
}
