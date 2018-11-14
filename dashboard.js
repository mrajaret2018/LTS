function IssueLP() {
    alert("Welcome");
}

function IssueLaptop() {
        // Get the modal
        // Refer ---> https://www.w3schools.com/howto/howto_css_modals.asp
        //alert("I am OK");
        var modal = document.getElementById('IssueModal');

        // Get the button that opens the modal
        // var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("IssueClose")[0];

        // When the user clicks on the button, open the modal 
        modal.style.display = "block";

        var tobeissuedlistdiv = document.getElementById("IssueList");
        //stocktobelisteddiv.innerHTML = "TTTTTTTTTTTTTTTTTTTTTTTTTT";
        var rtnvalue = GettobeIssuedlist();
        //alert(rtnvalue);
        tobeissuedlistdiv.innerHTML = rtnvalue;
        //stocktobelisteddiv.innerHTML = '<form><input type="radio" name="gender" value="male" checked> Male<br><input type="radio" name="gender" value="female"> Female<br><input type="radio" name="gender" value="other"> Other</form> ';
        //stocktobelisteddiv.innerHTML = "<div><input type="radio" id="huey" name="drone" checked /><label for="huey">Huey</label></div><div><input type="radio" id="dewey" name="drone" /><label for="dewey">Dewey</label></div><div><input type="radio" id="louie" name="drone" /><label for="louie">Louie</label></div>";
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
        //alert(document.getElementById("Info4user"));
        //document.getElementById("Info4user").innerHTML = "Sucks";
    
}

function GettobeIssuedlist() {
            var url="laptoplist4issue.php";
            var request=new XMLHttpRequest();
            var phprtns ="";
            request.open("POST",url,false);
            request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            request.overrideMimeType("text/plain");
            request.onreadystatechange=function() {
                if ( request.readyState==4 ) {
                    phprtns = this.responseText;
                    alert(phprtns);
                    //stockonhand=$stockonhand&stockduetilltoday=$stockduetilltoday&stockduelatter=$stockduelatter"
                    var regex = /\r?\n|\r/g;
                    phprtns = phprtns.replace(regex,'');
                    
                    
                    }

                }
            request.send();
            return phprtns;

}

function Approve_Reject(whattodo)  {
    // 
    //for each selected list of approved users from the HTML form, 
    // update  details table with approverid and approvedate columns.
    // details table has PK as laptopid,requesterid and requestdate
    //approvedorrejectedLP
    //alert(document.getElementById("empid").value);
    var modal = document.getElementById('ApprovalModal');
    modal.style.display = "none";
    var empid = document.getElementById("empid").value;

    var CBSelected = document.querySelectorAll('input[name="approvedorrejectedLP"]:checked');
    //var CBSelected = document.querySelectorAll('input[name="approvedorrejectedLP"]:checked').value;
    for (i=0;i<CBSelected.length;i++) {
        //call a PHP and update the detail table with approver id and approvedate 
        // parse this and get PK
        //alert(CBSelected[i].value);    
        var splitted = CBSelected[i].value.split("  ");
        var laptopid = splitted[3];
        var requesterid = splitted[4];
        var requestdate = splitted[5];

        RecordTheApproval(laptopid,requesterid,requestdate,empid,whattodo);
    }
    

}


function RecordTheApproval(laptopid,requesterid,requestdate,empid,whattodo) {
    //alert(laptopid+requesterid+requestdate+empid);
    switch (whattodo) {
        case "Approve":
                var url="lpapprove.php";
                break;   
        case "Reject":
                var url="lpreject.php";
                break;
    }
    
            
            
    var request=new XMLHttpRequest();
    request.open("POST",url,false);
    request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    request.overrideMimeType("text/plain");
            

    request.onreadystatechange=function() {
        if ( request.readyState==4 ) {
            document.getElementById("Info4user").innerHTML = this.responseText;
            //alert(document.getElementById("Info4user"));
            //document.getElementById("Info4user").innerHTML = "Sucks";
      
        }
    }
    var postdata = "laptopid="+laptopid;
    postdata += "&requesterid="+requesterid;
    postdata += "&requestdate="+requestdate;
    postdata += "&empid="+empid;
    request.send(postdata); 
}

function RecordTheRequest(){
    var modal2 = document.getElementById('RequestedModal');
    modal2.style.display = "none";
    var RBSelected = document.querySelector('input[name="requestedLP"]:checked').value;
    //alert(RBSelected);
    //insert a record in the detail table with appropriate values

    var postdata= "justification="+document.getElementById("justification").value;
         postdata+="&committedrtndate="+document.getElementById("committedrtndate").value;
         postdata+="&phonext="+document.getElementById("phonext").value;
         postdata+="&lprequested="+RBSelected;
        // alert(postdata);
            var url="lprequest.php";
            
            
            var request=new XMLHttpRequest();
            request.open("POST",url,false);
            request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            request.overrideMimeType("text/plain");
            

            request.onreadystatechange=function() {
                if ( request.readyState==4 ) {
                    document.getElementById("Info4user").innerHTML = this.responseText;
                    //alert(document.getElementById("Info4user"));
                    //document.getElementById("Info4user").innerHTML = "Sucks";
                    
                }
            }
            request.send(postdata);

      GetValues();      
}

function LPRequested(){
    var modal = document.getElementById('RequestModal');
    // Get the button that opens the modal
    // var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("RequestClose")[0];

    modal.style.display = "none";
    //var RBSelected = document.querySelector('input[name="requestedLP"]:checked').value;    
   // alert(RBSelected);
    var modal2 = document.getElementById('RequestedModal');

        // Get the button that opens the modal
        // var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span2 = document.getElementsByClassName("RequestedClose")[0];

        // When the user clicks on the button, open the modal 
        modal2.style.display = "block";

        
        span2.onclick = function() {
            modal2.style.display = "none";
        }

        
}

function GetValues(){

        	var url="getvalues4dashboard.php";
            var request=new XMLHttpRequest();
            request.open("POST",url,true);
            request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            request.overrideMimeType("text/plain");
            request.onreadystatechange=function() {
            	if ( request.readyState==4 ) {
            		var phprtns = this.responseText;
            		//alert(phprtns);
            		//stockonhand=$stockonhand&stockduetilltoday=$stockduetilltoday&stockduelatter=$stockduelatter"
                    var regex = /\r?\n|\r/g;
                    phprtns = phprtns.replace(regex,'');
                    if (phprtns == "NOLOGIN") {
                        
                        window.open("http://localhost/LTS/login.html","_self");
                    }
                	var splitted = phprtns.split("&");
                	//alert(splitted);
                	var stockonhand = splitted[0].split("=");
                	var stockduetilltoday = splitted[1].split("=");
                	var stockduelatter = splitted[2].split("=");
                    var isapprover = splitted[3].split("=");
                    var isstorekeeper = splitted[4].split("=");
					document.getElementById("currentstock").value =stockonhand[1];
					document.getElementById("duetoday").value =stockduetilltoday[1];
					document.getElementById("duelater").value =stockduelatter[1];
                    
                    if (isapprover[1] == '0') {
                        document.getElementById("btnapprovelp").disabled = true;
                    }
                    if (isstorekeeper[1] == '0') {
                       document.getElementById("btnissuelp").disabled = true;
                       document.getElementById("btnclctlp").disabled = true; 
                    }
                    }
                }
                request.send();
}
function ShowOnHandList(){
		
}
function ShowDueTodayList(){
        
}
function ShowDueLaterList(){

}

function GetLPList(){

            var url="laptoplist4request.php";
            var request=new XMLHttpRequest();
            var phprtns ="";
            request.open("POST",url,false);
            request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            request.overrideMimeType("text/plain");
            request.onreadystatechange=function() {
                if ( request.readyState==4 ) {
                    phprtns = this.responseText;
                    //alert(phprtns);
                    //stockonhand=$stockonhand&stockduetilltoday=$stockduetilltoday&stockduelatter=$stockduelatter"
                    var regex = /\r?\n|\r/g;
                    phprtns = phprtns.replace(regex,'');
                    
                    
                    }

                }
            request.send();
            return phprtns;
            
}

function RequestLaptop(){
        // Get the modal
        // Refer ---> https://www.w3schools.com/howto/howto_css_modals.asp
        //alert("I am OK");
        var modal = document.getElementById('RequestModal');

        // Get the button that opens the modal
        // var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("RequestClose")[0];

        // When the user clicks on the button, open the modal 
        modal.style.display = "block";

        var stocktobelisteddiv = document.getElementById("StockList");
        //stocktobelisteddiv.innerHTML = "TTTTTTTTTTTTTTTTTTTTTTTTTT";
        var rtnvalue = GetLPList();
        //alert(rtnvalue);
        if (rtnvalue == "You have already requested. You can't request until your previous request is processed") {
            //alert("Sucks");           
            try {
                document.getElementById("greetingonrequestmodal").innerHTML = "";
            }
            catch(err) {
              stocktobelisteddiv.innerHTML = err.message;  
            }
        }
        stocktobelisteddiv.innerHTML = rtnvalue;
        //stocktobelisteddiv.innerHTML = '<form><input type="radio" name="gender" value="male" checked> Male<br><input type="radio" name="gender" value="female"> Female<br><input type="radio" name="gender" value="other"> Other</form> ';
        //stocktobelisteddiv.innerHTML = "<div><input type="radio" id="huey" name="drone" checked /><label for="huey">Huey</label></div><div><input type="radio" id="dewey" name="drone" /><label for="dewey">Dewey</label></div><div><input type="radio" id="louie" name="drone" /><label for="louie">Louie</label></div>";
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
        //alert(document.getElementById("Info4user"));
        //document.getElementById("Info4user").innerHTML = "Sucks";
        
}

function ApproveLaptop(){
        // Get the modal
        // Refer ---> https://www.w3schools.com/howto/howto_css_modals.asp
        //alert("I am OK");
        var modal = document.getElementById('ApprovalModal');

        // Get the button that opens the modal
        // var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("ApproveClose")[0];

        // When the user clicks on the button, open the modal 
        modal.style.display = "block";

        var tobeapprovedlistdiv = document.getElementById("ApproveList");
        //stocktobelisteddiv.innerHTML = "TTTTTTTTTTTTTTTTTTTTTTTTTT";
        var rtnvalue = Gettobeapprovedlist();
        //alert(rtnvalue);
        tobeapprovedlistdiv.innerHTML = rtnvalue;
        //stocktobelisteddiv.innerHTML = '<form><input type="radio" name="gender" value="male" checked> Male<br><input type="radio" name="gender" value="female"> Female<br><input type="radio" name="gender" value="other"> Other</form> ';
        //stocktobelisteddiv.innerHTML = "<div><input type="radio" id="huey" name="drone" checked /><label for="huey">Huey</label></div><div><input type="radio" id="dewey" name="drone" /><label for="dewey">Dewey</label></div><div><input type="radio" id="louie" name="drone" /><label for="louie">Louie</label></div>";
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
        //alert(document.getElementById("Info4user"));
        //document.getElementById("Info4user").innerHTML = "Sucks";
}

function Gettobeapprovedlist(){

    var url="laptoplist4approval.php";
            var request=new XMLHttpRequest();
            var phprtns ="";
            request.open("POST",url,false);
            request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            request.overrideMimeType("text/plain");
            request.onreadystatechange=function() {
                if ( request.readyState==4 ) {
                    phprtns = this.responseText;
                    //alert(phprtns);
                    //stockonhand=$stockonhand&stockduetilltoday=$stockduetilltoday&stockduelatter=$stockduelatter"
                    var regex = /\r?\n|\r/g;
                    phprtns = phprtns.replace(regex,'');
                    
                    
                    }

                }
            request.send();
            return phprtns;
}
var rqstbtn = document.getElementById("btnrqstlp");
rqstbtn.addEventListener('click',RequestLaptop,false);

var IssueLPbtn = document.getElementById("IssueLP");
IssueLPbtn.addEventListener('click',IssueLP,false);
alert(IssueLPbtn.value);

//rqstbtn.addEventListener('click',GetValues,false);
