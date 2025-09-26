package middlewares

import "net/http"

func MakeHandler(handlerFunc http.HandlerFunc, middlewares ...func(http.Handler) http.Handler) http.HandlerFunc {
	h := http.Handler(handlerFunc)
	for i := len(middlewares) - 1; i >= 0; i-- {
		h = middlewares[i](h)
	}
	return h.ServeHTTP
}

func DefaultCORSConfig() CORSConfig {
	return CORSConfig{
		AllowOrigins:     []string{"http://localhost:4321"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Accept", "Authorization", "X-Requested-With"},
		ExposeHeaders:    []string{},
		AllowCredentials: true,
		MaxAge:           86400, // 1 hora(60 minutos) * 60 segundos = 3600 segundos
	}
}

func isOriginAllowed(origin string, allowedOrigins []string) bool {
	for _, allowed := range allowedOrigins {
		if allowed == "*" || allowed == origin {
			return true
		}
	}
	return false
}
