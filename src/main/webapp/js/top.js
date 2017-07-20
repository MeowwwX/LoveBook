		function login(){
			document.getElementById("register").setAttribute("hidden",true);
			document.getElementById("addbook").setAttribute("hidden",true);
			document.getElementById("search").setAttribute("hidden",true);
			document.getElementById("login").removeAttribute("hidden");
		}
		function register(){
			document.getElementById("login").setAttribute("hidden",true);
			document.getElementById("addbook").setAttribute("hidden",true);
			document.getElementById("search").setAttribute("hidden",true);
			document.getElementById("register").removeAttribute("hidden");
		}
		function publish(){
			document.getElementById("register").setAttribute("hidden",true);
			document.getElementById("login").setAttribute("hidden",true);
			document.getElementById("search").setAttribute("hidden",true);
			document.getElementById("addbook").removeAttribute("hidden");
		}
		function sch(){
			document.getElementById("register").setAttribute("hidden",true);
			document.getElementById("login").setAttribute("hidden",true);
			document.getElementById("addbook").setAttribute("hidden",true);
			document.getElementById("search").removeAttribute("hidden");
		}
		function remove(){
			document.getElementById("register").setAttribute("hidden",true);
			document.getElementById("login").setAttribute("hidden",true);
			document.getElementById("addbook").setAttribute("hidden",true);
			document.getElementById("search").setAttribute("hidden",true);
		}
