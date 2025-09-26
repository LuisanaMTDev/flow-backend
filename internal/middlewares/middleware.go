package middlewares

import (
	"fmt"
	"net/http"
	"strings"
)

func Authorization(next http.Handler) http.Handler

func CORSMiddleware(config CORSConfig) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			origin := r.Header.Get("Origin")
			
			// Verificar si el origen está permitido
			if isOriginAllowed(origin, config.AllowOrigins) {
				w.Header().Set("Access-Control-Allow-Origin", origin)
			}
			
			// Configurar headers de CORS
			if len(config.AllowMethods) > 0 {
				w.Header().Set("Access-Control-Allow-Methods", strings.Join(config.AllowMethods, ", "))
			}
			
			if len(config.AllowHeaders) > 0 {
				w.Header().Set("Access-Control-Allow-Headers", strings.Join(config.AllowHeaders, ", "))
			}
			
			if len(config.ExposeHeaders) > 0 {
				w.Header().Set("Access-Control-Expose-Headers", strings.Join(config.ExposeHeaders, ", "))
			}
			
			if config.AllowCredentials {
				w.Header().Set("Access-Control-Allow-Credentials", "true")
			}
			
			if config.MaxAge > 0 {
				w.Header().Set("Access-Control-Max-Age", fmt.Sprintf("%d", config.MaxAge))
			}
			
			// Manejar peticiones preflight OPTIONS
			if r.Method == "OPTIONS" {
				w.WriteHeader(http.StatusNoContent)
				return
			}
			
			next.ServeHTTP(w, r)
		})
	}
}

