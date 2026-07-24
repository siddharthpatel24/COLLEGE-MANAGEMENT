function valid() {
    document.getElementById("nameError").innerHTML = "";
    document.getElementById("passError").innerHTML = ""; 

    var nameField = document.getElementById("t2");
    var passField = document.getElementById("t3");
    
    var name = nameField.value.trim(); 
    var password = passField.value.trim(); 
    
    var isValid = true;

    if (name === "") { 
        nameField.style.border = "2px solid red"; 
        document.getElementById("nameError").innerHTML = "Name is required"; 
        isValid = false;
    } else { 
        nameField.style.border = "2px solid black"; 
    } 

    if (password === "") { 
        passField.style.border = "2px solid red"; 
        document.getElementById("passError").innerHTML = "Password is required"; 
        isValid = false;
    } else { 
        passField.style.border = "2px solid black"; 
    }
    return isValid; 
}
