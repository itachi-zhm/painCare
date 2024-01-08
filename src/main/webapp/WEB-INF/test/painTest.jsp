<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/4/2024
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->


        <div class="layout-page">
            <!-- Navbar -->


            <div class="content-wrapper">
                <!-- Content -->
                <div class="formbold-main-wrapper">
                    <!-- Author: FormBold Team -->
                    <!-- Learn More: https://formbold.com -->
                    <div class="formbold-form-wrapper">
                        <div class="card mb-4 col-4 ml-4">
                            <form action="test" method="post">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">Diagnostic Test</h5>
                                </div>
                                <div class="card-body">
                                    <div class="formbold-form-step-1 active">
                                        <h4>When do you start your period ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="startPeriod"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio1"
                                            />
                                            <label class="form-check-label" for="defaultRadio1"> Before 11 years old </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="startPeriod"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio2"
                                            />
                                            <label class="form-check-label" for="defaultRadio2">After 11 years old </label>
                                        </div>
                                    </div>
                                    <div class="formbold-form-step-2">
                                        <h4>Your menstrual cycle length average ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="menstrualCycle"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio3"
                                            />
                                            <label class="form-check-label" for="defaultRadio3"> Less than 27 years </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="menstrualCycle"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio4"
                                            />
                                            <label class="form-check-label" for="defaultRadio4">More than 27 years </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="menstrualCycle"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="0"
                                                    id="defaultRadio5"
                                            />
                                            <label class="form-check-label" for="defaultRadio5">Not sure</label>
                                        </div>
                                    </div>
                                    <div class="formbold-form-step-3">
                                        <h4>Do you have a family history  of endometriosis ? ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="endometriosis"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio6"
                                            />
                                            <label class="form-check-label" for="defaultRadio6"> Yes </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="endometriosis"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio7"
                                            />
                                            <label class="form-check-label" for="defaultRadio7">No </label>
                                        </div>

                                    </div>
                                    <div class="formbold-form-step-4">
                                        <h4>Did you give birth ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="giveBirth"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio9"
                                            />
                                            <label class="form-check-label" for="defaultRadio9"> Yes </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="giveBirth"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio8"
                                            />
                                            <label class="form-check-label" for="defaultRadio8">No </label>
                                        </div>

                                    </div>
                                    <div class="formbold-form-step-5">
                                        <h4>Do you have trouble getting pregnant ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="pregnancyTroubles"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio10"
                                            />
                                            <label class="form-check-label" for="defaultRadio10"> Yes </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="pregnancyTroubles"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio11"
                                            />
                                            <label class="form-check-label" for="defaultRadio11">No </label>
                                        </div>

                                    </div>
                                    <div class="formbold-form-step-6">
                                        <h4>Do you have trouble getting pregnant ?</h4>
                                        <label for="bmi">Body max index: calculate your BMI</label>
                                        <input name="weight" id="bmi" type="text" placeholder="Enter your weight in kg">
                                        <input name="height"  type="text" placeholder="Enter your height in cm">
                                    </div>

                                    <div class="formbold-form-step-7">
                                        <h4>What is your abdominal/pelvic pain intensity ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="painIntensity"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="0"
                                                    id="defaultRadio12"
                                            />
                                            <label class="form-check-label" for="defaultRadio12"> 0-2 </label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="painIntensity"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio13"
                                            />
                                            <label class="form-check-label" for="defaultRadio13">3-5 </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="painIntensity"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1.5"
                                                    id="defaultRadio14"
                                            />
                                            <label class="form-check-label" for="defaultRadio14">6-8 </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="painIntensity"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio15"
                                            />
                                            <label class="form-check-label" for="defaultRadio15">9-10 </label>
                                        </div>

                                    </div>

                                    <div class="formbold-form-step-8">
                                        <h4>WSeverity of pain during intercourse ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="pelvicPain"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio18"
                                            />
                                            <label class="form-check-label" for="defaultRadio18"> Related to period </label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="pelvicPain"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio17"
                                            />
                                            <label class="form-check-label" for="defaultRadio17">Related to ovulation </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="pelvicPain"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="0"
                                                    id="defaultRadio16"
                                            />
                                            <label class="form-check-label" for="defaultRadio16">Unrelated to period or ovulation </label>
                                        </div>
                                    </div>
                                    <div class="formbold-form-step-9">
                                        <h4>Severity of pain during intercourse ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="intercoursePain"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="0"
                                                    id="defaultRadio20"
                                            />
                                            <label class="form-check-label" for="defaultRadio20"> 0-2 </label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="intercoursePain"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio21"
                                            />
                                            <label class="form-check-label" for="defaultRadio21">3-5 </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="intercoursePain"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1.5"
                                                    id="defaultRadio22"
                                            />
                                            <label class="form-check-label" for="defaultRadio22">6-8 </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="intercoursePain"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio23"
                                            />
                                            <label class="form-check-label" for="defaultRadio23">9-10 </label>
                                        </div>

                                    </div>
                                    <div class="formbold-form-step-10">
                                        <h4>What makes your pain worse ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="painWorse"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio24"
                                            />
                                            <label class="form-check-label" for="defaultRadio24"> Bowel movement</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="painWorse"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio25"
                                            />
                                            <label class="form-check-label" for="defaultRadio25">Full bladder </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="painWorse"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio26"
                                            />
                                            <label class="form-check-label" for="defaultRadio26">Oragsm </label>
                                        </div>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="painWorse"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="0"
                                                    id="defaultRadio27"
                                            />
                                            <label class="form-check-label" for="defaultRadio27">Not related to anything </label>
                                        </div>
                                    </div>

                                    <div class="formbold-form-step-11">
                                        <h4>Duration of period ?</h4>
                                        <div class="form-check mt-3">
                                            <input
                                                    name="periodDuration"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="defaultRadio28"
                                            />
                                            <label class="form-check-label" for="defaultRadio28"> 1-7 days</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="periodDuration"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="defaultRadio29"
                                            />
                                            <label class="form-check-label" for="defaultRadio29">More than 7 days </label>
                                        </div>

                                    </div>

                                    <div class="formbold-form-step-12">
                                        <h4>Nature of periods ?</h4>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="periodNature"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="periodNatureHeavy"
                                            />
                                            <label class="form-check-label" for="periodNatureHeavy">Heavy</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="periodNature"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1.5"
                                                    id="periodNatureModerate"
                                            />
                                            <label class="form-check-label" for="periodNatureModerate">Moderate</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="periodNature"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="periodNatureLight"
                                            />
                                            <label class="form-check-label" for="periodNatureLight">Light</label>
                                        </div>
                                    </div>

                                    <div class="formbold-form-step-13">
                                        <h4>What is your menstrual cycle pattern ?</h4>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="cyclePattern"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="0"
                                                    id="cyclePatternRegular"
                                            />
                                            <label class="form-check-label" for="cyclePatternRegular">Regular</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="cyclePattern"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="cyclePatternIrregular"
                                            />
                                            <label class="form-check-label" for="cyclePatternIrregular">Irregular</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="cyclePattern"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="cyclePatternBleeding"
                                            />
                                            <label class="form-check-label" for="cyclePatternBleeding">Bleeding or spotting between periods</label>
                                        </div>
                                    </div>

                                    <div class="formbold-form-step-14">
                                        <h4>Do you have?</h4>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="having"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="havingBloodInStool"
                                            />
                                            <label class="form-check-label" for="havingBloodInStool">Blood in your stool</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="having"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="havingDiarrhea"
                                            />
                                            <label class="form-check-label" for="havingDiarrhea">Diarrhea</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="having"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="havingConstipation"
                                            />
                                            <label class="form-check-label" for="havingConstipation">Constipation</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="having"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="1"
                                                    id="havingAbdominalBloating"
                                            />
                                            <label class="form-check-label" for="havingAbdominalBloating">Abdominal Bloating</label>
                                        </div>
                                    </div>
                                    <div class="formbold-form-step-15">
                                        <h4>Have you ever been a victim of physical abuse or sexual abuse?</h4>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="victim"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="2"
                                                    id="victimYes"
                                            />
                                            <label class="form-check-label" for="victimYes">Yes</label>
                                        </div>

                                        <div class="form-check mt-3">
                                            <input
                                                    name="victim"
                                                    class="form-check-input"
                                                    type="radio"
                                                    value="0"
                                                    id="victimNo"
                                            />
                                            <label class="form-check-label" for="victimNo">No</label>
                                        </div>
                                    </div>



                                    <div class="buttons">
                                        <button class="formbold-back-btn btn btn-secondary">Previous</button>
                                        <button class="formbold-btn btn btn-primary">Next</button>
                                    </div>
                                </div>

    </form>
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
