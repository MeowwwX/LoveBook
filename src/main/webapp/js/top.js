		function login(){
			document.getElementById("register").setAttribute("hidden",true);
			document.getElementById("addbook").setAttribute("hidden",true);
			document.getElementById("modbook").setAttribute("hidden",true);
			document.getElementById("delbook").setAttribute("hidden",true);
			document.getElementById("login").removeAttribute("hidden");
		}
		function register(){
			document.getElementById("login").setAttribute("hidden",true);
			document.getElementById("addbook").setAttribute("hidden",true);
			document.getElementById("modbook").setAttribute("hidden",true);
			document.getElementById("delbook").setAttribute("hidden",true);
			document.getElementById("register").removeAttribute("hidden");
		}
		function addbook(){
			document.getElementById("register").setAttribute("hidden",true);
			document.getElementById("login").setAttribute("hidden",true);
			document.getElementById("addbook").removeAttribute("hidden");
			document.getElementById("modbook").removeAttribute("hidden");
			document.getElementById("delbook").removeAttribute("hidden");
		}
		function remove(){
			document.getElementById("register").setAttribute("hidden",true);
			document.getElementById("login").setAttribute("hidden",true);
			document.getElementById("addbook").setAttribute("hidden",true);
			document.getElementById("modbook").setAttribute("hidden",true);
			document.getElementById("delbook").setAttribute("hidden",true);
		}
