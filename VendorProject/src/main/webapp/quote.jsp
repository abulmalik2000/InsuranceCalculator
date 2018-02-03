<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<head>
    <title>Premium Quote Generator</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <link rel="stylesheet" href="/bootstrap.min.css" media="screen"/>
    <style>
        .navigation-order{
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header" id="banner">
        <div class="row">
            <div class="col-lg-8 col-md-7 col-sm-6">
                <h1>Premium Quote Generator</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-md-7 col-sm-6">
                <form>
                    <div class="form-group">
                        <label for="customer_name">Name:</label>
                        <input type="text" class="form-control" id="customer_name"/>
                    </div>
                    <div class="form-group">
                        <label for="customer_gender">Gender:</label>
                        <select class="form-control" id="customer_gender">
                          <option>Male</option>
                          <option>Female</option>
                          <option>Other</option>
                        </select>
                    </div>
                      <div class="form-group">
                        <label for="customer_age">Age:</label>
                        <select class="form-control" id="customer_age">
                        <%  for(int i=1; i<200 ;i++)  {%>
                          <option><%= i %></option>
                        <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Current Health:</label>
                    </div>
                    <div class="current_health">
	                    <div class="form-group">
	                        <label for="customer_hypertension">Hypertension:</label>
	                        <input type="checkbox" class="form-control" id="customer_hypertension"/>
	                    </div>
	                    <div class="form-group">
	                        <label for="customer_blood_pressure">Blood pressure:</label>
	                        <input type="checkbox" class="form-control" id="customer_blood_pressure"/>
	                    </div>
	                    <div class="form-group">
	                        <label for="customer_blood_sugar">Blood sugar:</label>
	                        <input type="checkbox" class="form-control" id="customer_blood_sugar"/>
	                    </div>
	                    <div class="form-group">
	                        <label for="customer_overweight">Overweight:</label>
	                        <input type="checkbox" class="form-control" id="customer_overweight"/>
	                    </div>
                    </div>
                    <div class="form-group">
                        <label>Habits:</label>
                    </div>
                    <div class="habits">
	                    <div class="form-group">
	                        <label for="customer_smoking">Smoking:</label>
	                        <input type="checkbox" class="form-control" id="customer_smoking"/>
	                    </div>
	                    <div class="form-group">
	                        <label for="customer_alcohol">Alcohol:</label>
	                        <input type="checkbox" class="form-control" id="customer_alcohol"/>
	                    </div>
	                    <div class="form-group">
	                        <label for="customer_drugs">Drugs:</label>
	                        <input type="checkbox" class="form-control" id="customer_drugs"/>
	                    </div>
                    </div>
                    <div class="form-group">
                        <label for="customer_daily_exercise">Daily exercise:</label>
                        <input type="checkbox" class="form-control" id="customer_daily_exercise"/>
                    </div>

                    <button type="submit" class="btn btn-default" id="btn_submit">Get Quote</button>
                </form>
            </div>
        </div>
        <br />
    </div>
</div>
<script src="/jquery.js" type="application/javascript"></script>
<script type="application/javascript">
//alert(2);

$('#btn_submit').on("click",function(e){
    e.preventDefault();
    var name = $("#customer_name").val();
    var gender = $("#customer_gender").val();
    var age = $("#customer_age").val();
     
    if($.trim(name)===""){
        alert("You must fill the name");
    }
    else{
	    	var currentHealth = [];
        if (document.getElementById('customer_hypertension').checked){
        		currentHealth.push('customer_hypertension');
        }
        if (document.getElementById('customer_blood_pressure').checked){
    			currentHealth.push('customer_blood_pressure');
	    }
        if (document.getElementById('customer_blood_sugar').checked){
			currentHealth.push('customer_blood_sugar');
	    }
        if (document.getElementById('customer_overweight').checked){
			currentHealth.push('customer_overweight');
	    }
        
        var goodHabits = [];
        if (document.getElementById('customer_daily_exercise').checked){
        		goodHabits.push('customer_daily_exercise');
	    }

        
        var badHabits = [];
        if (document.getElementById('customer_smoking').checked){
        		badHabits.push('customer_smoking');
	    }
        if (document.getElementById('customer_alcohol').checked){
    			badHabits.push('customer_alcohol');
	    }
        if (document.getElementById('customer_drugs').checked){
    			badHabits.push('customer_drugs');
    		}
        $.ajax({
            type:"POST",
            url:"/getquote",
            data:{name:name, gender:gender, age:age, currentHealth:currentHealth, goodHabits:goodHabits, badHabits:badHabits},
            success:function (data) {
                if (alert("Your quote is " +data)){
                    //window.location.reload();
                }
            }
         });
    }
});


</script>
</body>
</html>