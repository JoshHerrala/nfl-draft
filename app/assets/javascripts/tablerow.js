
function rows(){
      
	   var tbl = document.getElementById("tblMain");
        if (tbl != null) {
            for (var i = 1; i < tbl.rows.length; i++) {
                tbl.rows[i].style.cursor = "default";
                tbl.rows[i].onmousemove = function () { this.style.backgroundColor = "grey"; this.style.color = "#FFFFFF"; };
                tbl.rows[i].onmouseout = function () { this.style.backgroundColor = ""; this.style.color = ""; };
            }
        }
	
	}
		
		
	