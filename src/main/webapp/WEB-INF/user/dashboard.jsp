<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="./assets/css/navbarcss.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<main>
            <div class="header">
                <div class="left">
                    <h1>Dashboard</h1>
<!--                    <ul class="breadcrumb">-->
<!--                        <li><a href="#">-->
<!--                                Analytics-->
<!--                            </a></li>-->
<!--                        /-->
<!--                        <li><a href="#" class="active">Shop</a></li>-->
<!--                    </ul>-->
                </div>
<!--                <a href="#" class="report">-->
<!--                    <i class='bx bx-cloud-download'></i>-->
<!--                    <span>Download CSV</span>-->
<!--                </a>-->
            </div>

            <!-- Insights -->
            <ul class="insights">
                <li>
                    <a href="/painCare/pain">
                    <img src="./assets/images/evaluation.png">
                    <span class="info">
                        <h3>
                            Update your score
                        </h3>
                        <p>Update your score regularly</p>
                    </span>
                    </a>
                </li>
                <li>
                    <a href="/painCare/test">
                    <img src="./assets/images/LogoTest.png" >
                    <span class="info">
                        <h3>
                            Diagnostic test
                        </h3>
                        <p style="font-size: 12px">Discover your potential endometriosis diagnosis.</p>
                    </span>
                     </a>
                </li>
                <li>
                    <a href="">
                    <img src="./assets/images/quiz.png">
                    <span class="info">
                        <h3>
                            Quiz
                        </h3>
                        <p>Test your knowledge about endometriosis.</p>
                    </span>
                    </a>
                </li>
                <li>
                    <a href="/painCare/welcomingpage">
                    <img src="./assets/images/bibliotheque.png">
                    <span class="info">
                        <h3>
                            Endo Informations
                        </h3>
                        <p>Stay informed about endometriosis.</p>
                    </span>
                    </a>
                </li>
            </ul>
            <!-- End of Insights -->

            <div class="bottom-data">
                <div class="orders">
                    <div>
                        <canvas id="myChart"></canvas>
                    </div>

                </div>
                <!-- Alarm list -->
                <div class="reminders">
                    <div class="header">
                        <img src="./assets/images/alarme.png" class="alarm-icon" style="width: 24px; height: 24px;">
                        <h3>Alarms List</h3>
                        <i class='bx bx-filter'></i>
                        <i class='bx bx-plus'></i>
                    </div>
                    <ul class="task-list">
                        <li class="completed">
                            <div class="task-title">
                                <i class='bx bx-check-circle'></i>
                                <h6>Monday,Tuesday,Wednesday<t></h6><br>
                                <h8>  20:00</h8>
                            </div>
                            <i class='bx bx-dots-vertical-rounded'></i>
                        </li>
                        <li class="completed">
                            <div class="task-title">
                                <i class='bx bx-check-circle'></i>
                                <h6>Monday,Saturday,Sunday<t></h6><br>
                                <h8>  10:00</h8>
                            </div>
                            <i class='bx bx-dots-vertical-rounded'></i>
                        </li>
                        <li class="completed">
                            <div class="task-title">
                                <i class='bx bx-check-circle'></i>
                                <h6>Monday,Tuesday,Friday<t></h6><br>
                                <h8>  7:00</h8>
                            </div>
                            <i class='bx bx-dots-vertical-rounded'></i>
                        </li>
                    </ul>
                </div>

                <!-- End of Reminders-->

            </div>
<!--            ****************************************************-->
            <div class="bottom-data">


                <div>
                    <h4>Localisation des douleurs</h4>
                    <canvas id="myChart1"></canvas>
                </div>

                <!-- Alarm list -->
                <div class="reminders">
                    <div class="header">
                        <img src="./assets/images/symptomes.png" class="alarm-icon" style="width: 30px; height: 30px;">
                        <h3> Symptômes</h3>
                    </div>
                    <ul class="task-list">
                        <li class="not-completed">
                            <div class="task-title">
                                
                                <p>Acne : 25 %</p>
                            </div>
                            
                        </li>
                        <li class="not-completed">
                            <div class="task-title">
                                
                                <p>HeadAche : 25%</p>
                            </div>
                            
                        </li>
                        <li class="not-completed">
                            <div class="task-title">
                               
                                <p>Tender breasts 50.0%</p>
                            </div>
                           
                        </li>
                    </ul>
                </div>

                <!-- End of Reminders-->
<!--                ce qui aggrave la douleur div-->
                <div class="reminders">
                    <div class="header">
                        <img src="./assets/images/douleur.png" class="alarm-icon" style="width: 30px; height: 30px;">
                        <h3> Ce qui aggrave la douleur</h3>
                    </div>
                    <ul class="task-list">
                       <li class="completed">
                            <div class="task-title">
                                
                                <p>Stress : 40 %</p>
                            </div>
                            
                        </li>
                        <li class="completed">
                            <div class="task-title">
                                
                                <p>Lack of sleep : 20% : 25%</p>
                            </div>
                            
                        </li>
                        <li class="completed">
                            <div class="task-title">
                               
                                <p>walking : 20.0%</p>
                            </div>
                           
                        </li>
                        <li class="completed">
                            <div class="task-title">
                               
                                <p>sitting : 20.0%</p>
                            </div>
                           
                        </li>
                    </ul>
                </div>

<!--                fin de ce qui aggrave la douleur-->
                <!--                Sentiment div-->

                <div class="reminders">
                    <div class="header">
                        <img src="./assets/images/sentiment.png" class="alarm-icon" style="width: 30px; height: 30px;">
                        <h3> Sentiments</h3>
                    </div>
                    <ul class="task-list">
                        <li class="completed">
                            <div class="task-title">
                                
                                <p>Anxious : 50%</p>
                            </div>
                           
                        </li>
                        <li class="completed">
                            <div class="task-title">
                               
                                <p>Vomiting : 50%</p>
                            </div>
                            
                        </li>
                        
                    </ul>
                </div>


            </div>


        </main>
        <script src="index.js"></script>
    <script>
    console.log( "<%= request.getAttribute("data")%>")
    function convertStringToArray(dataStr) {
    // Step 1: Find all date-like strings in the input and wrap them in quotes
    let formattedStr = dataStr.replace(/\b(\d{4}-\d{2}-\d{2})\b/g, '"$1"');

    // Step 2: Replace the brackets with JSON array brackets
    formattedStr = formattedStr.replace(/\[/g, '[').replace(/\]/g, ']');

    // Step 3: Try to parse the string as JSON
    try {
        let dataArr = JSON.parse(formattedStr);
        return dataArr;
    } catch (e) {
        console.error("Error converting string to array:", e);
        return null; // or appropriate error handling
    }
}
        // Wait for the DOM to fully load
        document.addEventListener("DOMContentLoaded", function() {
            // Get the search button and input elements
            var searchButton = document.getElementById('searchBtn');
            var searchInput = document.getElementById('searchInput');

            // Add an event listener for the 'click' event on the search button
            searchButton.addEventListener('click', function(event) {
                // Prevent the default form submit action
                event.preventDefault();

                // Get the value from the search input
                var query = searchInput.value;

                // Check if the query is not empty
                if(query.trim() !== "") {
                    // TODO: Handle the search logic here
                    // For example, you can redirect to a search page or filter content on the page
                    console.log("Search for:", query); // For demonstration purposes

                    // Example: Redirecting to a search page with the query
                    // window.location.href = '/search?query=' + encodeURIComponent(query);
                } else {
                    // Handle empty input, maybe display an error or a notice
                    console.log("Please enter a search term");
                }
            });
        });
        // Configuration for line chart
        const lineCtx = document.getElementById('myChart').getContext('2d');
        const lineChart = new Chart(lineCtx, {
            type: 'line',
            data: {
                labels: [],
                datasets: [{
                    label: 'Pain Average',
                    data: convertStringToArray("<%= request.getAttribute("data")%>"),
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
		function changeArray(array, labels) {
	        const inputArray = JSON.parse(array)
	        var nonZeroCount = 0;

	        for (var i = 0; i < inputArray.length; i++) {
	            if (inputArray[i] !== 0) {
	                nonZeroCount += inputArray[i];
	            }
	        }

	        if (nonZeroCount > 0) {
	            var percentage = (nonZeroCount / inputArray.length) * 100;

	            // Change values different than 0 to represent the percentage
	            for (var i = 0; i < inputArray.length; i++) {
	                if (inputArray[i] !== 0) {
	                    inputArray[i] = (inputArray[i]/nonZeroCount)*100;
	                }
	            }
	            var nonZeroValues = inputArray.filter((value) => value !== 0);
	            var nonZeroBodyParts = labels.filter((_, index) => inputArray[index] !== 0);
	            // Print the modified array
	            return {nonZeroValues, nonZeroBodyParts}
	        } else {
	            console.log("No values different than 0 found in the array.");
	        }
	    }
		console.log()
		const {nonZeroValues, nonZeroBodyParts} = changeArray("<%= request.getAttribute("data1")%>", ['Abdomen','Back', 'Chest','Head','Neck','Hips'])
        // Configuration for pie chart
        const pieCtx = document.getElementById('myChart1').getContext('2d');
        const pieConfig = {
            type: 'pie',
            data: {
                labels: nonZeroBodyParts,
                datasets: [{
                    data: nonZeroValues,
                    backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(255, 205, 86, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(26, 195, 106, 0.2)', 'rgba(174, 92, 115, 0.2)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(255, 205, 86, 1)', 'rgba(54, 162, 235, 1)', 'rgba(26, 195, 106, 1)', 'rgba(174, 92, 115, 1)'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true
            }
        };

        const pieChart = new Chart(pieCtx, pieConfig);


    </script>

</body>
</html>