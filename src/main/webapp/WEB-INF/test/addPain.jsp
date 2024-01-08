<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="./assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="./assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="./assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="./assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="./assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="./assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="./assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="./assets/js/config.js"></script>
    <script>
        function redirectToUpdateProfile() {
            window.location.href = "/Update-user-profile";
        }
    </script>
    <style>
        .card {
            max-width: 400px; /* Ajustez la valeur selon vos préférences */
            margin: auto; /* Centrer le card sur la page */
        }
        /* Augmenter la largeur des champs de formulaire */
        .form-control {
            width: 150%;
            margin-left: -50px;
        }

        /* Augmenter la largeur du slider */
        input[type="range"] {
            width: 150%;
            margin-left: -50px;
        }
    </style>

</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->


        <div class="layout-page">
            <!-- Navbar -->


            <div class="layout-wrapper layout-content-navbar">
                <div class="layout-container">
                    <!-- Menu -->
                    <!-- Ajoutez ici le code du menu si nécessaire -->

                    <div class="layout-page">
                        <!-- Navbar -->
                        <!-- Ajoutez ici le code de la barre de navigation si nécessaire -->

                        <div class="content-wrapper">
                            <!-- Content -->

                            <div class="container">
                                <div class="col-md-8 offset-2 col-xm-8 col-sm-8">
                                    <div class="card my-5">
                                        <div class="card-header">
                                            <span>Test du douleur</span>
                                        </div>
                                        <div class="card-body d-flex flex-column align-items-center justify-content-center">
                                            <form action="pain" method="post">
                                                <div class="form-group mb-3">
                                                    <label for="myRange">Pain Level:</label>
                                                    <h3 id="demo"></h3>
                                                    <input type="range" name="level" min="0" max="10" value="0" class="slider" id="myRange">
                                                </div>


                                                <div class="form-group mb-3">
                                                    <label for="painLocation" class="form-label">Location:</label>
                                                    <select name="location" id="painLocation" class="form-control">
                                                        <option value="abdomen">Abdomen</option>
                                                        <option value="back">Back</option>
                                                        <option value="chest">Chest</option>
                                                        <option value="head">Head</option>
                                                        <option value="neck">Neck</option>
                                                        <option value="hips">Hips</option>
                                                    </select>
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="symptoms" class="form-label">Symptoms:</label>
                                                    <select name="symptoms" id="symptoms" class="form-control">
                                                        <option value="cramps">Cramps</option>
                                                        <option value="tenderBreasts">Tender Breasts</option>
                                                        <option value="acne">Acne</option>
                                                        <option value="fatigue">Fatigue</option>
                                                        <option value="bloating">Bloating</option>
                                                        <option value="craving">Craving</option>
                                                    </select>
                                                </div>


                                                <div class="form-group mb-3">
                                                    <label for="aggravatingFactors" class="form-label">Aggravating Factors:</label>
                                                    <select name="painWorse" id="aggravatingFactors" class="form-control">
                                                        <option value="lackOfSleep">Lack of sleep</option>
                                                        <option value="sitting">Sitting</option>
                                                        <option value="standing">Standing</option>
                                                        <option value="stress">Stress</option>
                                                        <option value="walking">Walking</option>
                                                        <option value="exercise">Exercise</option>
                                                        <option value="urination">Urination</option>
                                                    </select>
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="feelings" class="form-label">Feelings:</label>
                                                    <select name="feeling" id="feelings" class="form-control">
                                                        <option value="anxious">Anxious</option>
                                                        <option value="depressed">Depressed</option>
                                                        <option value="dizzy">Dizzy</option>
                                                        <option value="vomiting">Vomiting</option>
                                                        <option value="diarrhea">Diarrhea</option>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <input type="submit" value="Submit" class="btn btn-primary">
                                                </div>
                                            </form>

                                            <script>
                                                var slider = document.getElementById("myRange");
                                                var output = document.getElementById("demo");
                                                var value;

                                                if (slider.value == 0) {
                                                    value = "None"
                                                } else if (slider.value > 0 && slider.value <= 3) {
                                                    value = "Mid"
                                                } else if (slider.value > 3 && slider.value <= 5) {
                                                    value = "Moderate"
                                                } else if (slider.value > 5 && slider.value <= 7) {
                                                    value = "Severe"
                                                } else if (slider.value > 7) {
                                                    value = "Very Severe"
                                                }

                                                output.innerHTML = value;

                                                slider.oninput = function () {
                                                    if (slider.value == 0) {
                                                        value = "None"
                                                    } else if (slider.value > 0 && slider.value <= 3) {
                                                        value = "Mid"
                                                    } else if (slider.value > 3 && slider.value <= 5) {
                                                        value = "Moderate"
                                                    } else if (slider.value > 5 && slider.value <= 7) {
                                                        value = "Severe"
                                                    } else if (slider.value > 7) {
                                                        value = "Very Severe"
                                                    }
                                                    output.innerHTML = value;
                                                }
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                </div>
            </div>


            <script>
                const totalSteps = 15;
                const formSubmitBtn = document.querySelector('.formbold-btn');
                const formBackBtn = document.querySelector('.formbold-back-btn');
                let currentStep = 1;

                formSubmitBtn.addEventListener("click", function (event) {
                    console.log(currentStep)
                    event.preventDefault();

                    const currentStepForm = document.querySelector(".formbold-form-step-" + currentStep);
                    console.log(currentStepForm)
                    const nextStep = currentStep + 1;

                    if (currentStep < totalSteps) {
                        currentStepForm.classList.remove('active');

                        const nextStepForm = document.querySelector(".formbold-form-step-" + nextStep);
                        console.log(nextStepForm)
                        nextStepForm.classList.add('active');

                        formBackBtn.classList.add('active');
                        currentStep++;
                        formSubmitBtn.textContent = (nextStep === totalSteps) ? 'Submit' : 'Next';
                    } else {
                        // You've reached the last step, submit the form
                        document.querySelector('form').submit();
                    }
                });

                formBackBtn.addEventListener("click", function (event) {
                    event.preventDefault();
                    console.log(currentStep)
                    const currentStepForm = document.querySelector(".formbold-form-step-" + currentStep);
                    const prevStep = currentStep - 1;

                    if (currentStep > 2) {
                        const prevStepForm = document.querySelector(".formbold-form-step-" + prevStep);

                        currentStepForm.classList.remove('active');
                        prevStepForm.classList.add('active');
                        currentStep--;


                    } else {
                        const prevStepForm = document.querySelector(".formbold-form-step-" + prevStep);

                        currentStepForm.classList.remove('active');
                        prevStepForm.classList.add('active');
                        currentStep--;
                        formBackBtn.classList.remove('active');
                        formSubmitBtn.textContent = 'Next';
                    }
                });


            </script>

</body>

</html>