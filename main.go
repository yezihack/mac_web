package main

import "github.com/zserge/webview"

func main() {
	// Open wikipedia in a 800x600 resizable window
	webview.Open("百里博客", "https://www.sgfoot.com", 800, 600, true)
	//webview.Open("网页", "https://www.lookao.com", 800, 600, true)
}
