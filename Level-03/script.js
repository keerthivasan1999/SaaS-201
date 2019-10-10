// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {
  var initialize = function() {
    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.

      onSubmit callback
      disableDuplicateSecondaryDepartment callback,...
    */
    var depart1=document.getElementById("depart1");
    var depart2=document.getElementById("depart2");
    
    depart1.addEventListener("change",disableDuplicateSecondaryDepartment);
    var button=document.getElementById("submit")
    button.addEventListener("click",onSubmit);
  };

  var disableDuplicateSecondaryDepartment = function(event) {
    
    var op1=depart1.selectedIndex;

        var len1=depart2.length;

        for (i=0;i<len1;++i)
        {
          if (i != op1)
          {
              depart2.options[i].disabled=false;
          }
          else
          {
              depart2.options[i].disabled=true; 
          }
        }


    // 2. in department2, Should disable the option selected in department1
  }

  var constructData = function() {
    var data = {};
    data["name"]=document.getElementById("name").value;
    data["phno"]=document.getElementById("phno").value;
    data["emailaddress"]=document.getElementById("emailaddress").value;
    data["department1"]=document.getElementById("depart1").value;
    data["department2"]=document.getElementById("depart2").value;
    // 3. Construct data from the form here. Please ensure that the keys are the names of input elements
    return data;
  }

  var validateResults = function(data) {
    var isValid = true;
    // 4. Check if the data passes all the validations here
    if (data["name"].length > 100)
    {
      isValid=false; 
    }
    else if (data["phno"].length > 10)
    { 
          isValid=false; 
    }
    else if (data["department1"]===data["department2"])
    {
          isValid=false;
    } 
    else
    {
          var mailform=/^[A-Za-z0-9.]+@college.edu$/;
          var ourmail=data["emailaddress"];
          if(ourmail.match(mailform))
          {
          }
          else
          {
            isValid=false;
          }
     }
    return isValid;
  };

  var onSubmit = function(event) 
  {
    // 5. Figure out how to avoid the redirection on form submit
    var data = constructData();
    if (validateResults(data)) 
    {
      printResults(data);
    } 
    else 
    {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
    event.preventDefault();

  };

  var printResults = function(data) 
  {
    var constructElement = function([key, value]) 
    {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) 
    {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };
  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();
