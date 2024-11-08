package main

import (
	"net/http"

	"github.com/LuisanaMTDev/flow-backend/internal/controllers"
	"github.com/a-h/templ"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	router := echo.New()
	router.Use(middleware.Logger())
	router.Use(middleware.Recover())

	router.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})

	viewsRouter := router.Group("/views")
	viewsRouter.GET("/subjects", controllers.ReadSubjects)
	viewsRouter.POST("/subject", controllers.AddSubject) // With query parameters
	viewsRouter.DELETE("/subject/:id", controllers.DeleteSubject)
	viewsRouter.PUT("/subject/:id", controllers.ModifySubject) // With query parameters
}
