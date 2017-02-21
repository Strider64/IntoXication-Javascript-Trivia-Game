/*
 *  Trivia Game Version 2.70 beta with XML
 *  by John Pepp
 *  Started: January 31, 2017
 *  Revised: February 21, 2017
 */
var container;
var answer = 0;
var correct = new Array();
var button = document.getElementById("submitBtn");
var orig_button_value = button.value;

function main(url, start = 0, end = 56, category = 'movie', callback) {

    console.log(start, end, category);
    var check = 'start=' + start + '&end=' + end + '&category=' + category;

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 2) {
            //console.log(xhr.status);
        }
        if (xhr.readyState === 4 && xhr.status === 200) {
            callback.call(xhr.responseXML);
        }
    }; // End of Ready State:
    xhr.open('POST', url, true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.send(check);
}

function loadNodes(markerNodes, container) {
    if (markerNodes) {
        var records = markerNodes.length;


        var totalRecords = document.createAttribute('data-records');
        totalRecords.value = records;
        container.setAttributeNode(totalRecords);
        var count = 0;
        for (var i = 0; i < records; i++) {
            correct[i] = markerNodes[i].getAttribute('correct');
            var mainGame = document.createElement('div');
            var mainGameId = document.createAttribute('id');
            mainGameId.value = 'mainGame' + (i + 1);
            mainGame.setAttributeNode(mainGameId);
            var mainGameData = document.createAttribute('data-id');
            mainGameData.value = markerNodes[i].getAttribute("id");
            mainGame.setAttributeNode(mainGameData);
            container.appendChild(mainGame);

            /*
             *  Setup Questions div block:
             */
            var screen = document.createElement('div');
            var screenId = document.createAttribute('class');
            screenId.value = 'screen';
            screen.setAttributeNode(screenId);
            mainGame.appendChild(screen);

            var q = document.createElement('h2');
            var questionId = document.createAttribute('id');
            questionId.value = 'question' + (i + 1);
            q.setAttributeNode(questionId);
            q.innerHTML = markerNodes[i].getAttribute("question");

            screen.appendChild(q);

            for (var j = 1; j <= 4; j++) {
                count += 1
                button = document.createElement('button');
                var buttonData = document.createAttribute('data-correct');
                buttonData.value = j;
                button.setAttributeNode(buttonData);
                var buttonClass = document.createAttribute('class');
                buttonClass.value = "buttonStyle";
                button.setAttributeNode(buttonClass);
                var buttonId = document.createAttribute('id');
                buttonId.value = "button" + count;
                button.setAttributeNode(buttonId);
                button.innerHTML = markerNodes[i].getAttribute("answer" + j);

                mainGame.appendChild(button);
            }
            var scoring = document.createElement('div');
            var scoringId = document.createAttribute('id');
            scoringId.value = "scoring" + (i + 1);
            scoring.setAttributeNode(scoringId);
            mainGame.appendChild(scoring);
            var display = document.createElement('div');

            var scoreElement = document.createElement('h2');
            var scoreId = document.createAttribute('id');
            scoreId.value = "score" + (i + 1);
            scoreElement.setAttributeNode(scoreId);
            scoring.appendChild(scoreElement);

            var displayPercent = document.createElement('h2');
            var displayPercentId = document.createAttribute('id');
            displayPercentId.value = "percent" + (i + 1);
            displayPercent.setAttributeNode(displayPercentId);
            scoring.appendChild(displayPercent);

            var displayId = document.createAttribute('id');
            displayId.value = "record" + (i + 1);
            display.setAttributeNode(displayId);
            mainGame.appendChild(display);

            clock = document.createElement('h2');
            var clockId = document.createAttribute('id');
            clockId.value = "clock" + (i + 1);
            clock.setAttributeNode(clockId);
            display.appendChild(clock);

            nextButton = document.createElement('button');
            var nextBtnId = document.createAttribute('id');
            nextBtnId.value = 'next' + (i + 1);
            nextButton.setAttributeNode(nextBtnId);
            var nextBtnClass = document.createAttribute('class');
            nextBtnClass.value = "nextBtn";
            nextButton.setAttributeNode(nextBtnClass);
            nextButton.innerHTML = "next";
            display.appendChild(nextButton);


        }

    }

}

/*
 * To call Questions, Answers and the correct answer with Ajax using a callback function, and run actual game routines inside this 
 * function. All done in vanilla (pure) javascript!
 */
function loadGame(url, start, end, category) {
    main(url, start, end, category, function () {
        var container = document.getElementById('container');
        var markers = this.getElementsByTagName("markers")[0]; // Grab Questions and Answers:
        /*
         * Grab the individual HTML elements that make up the quiz between the
         * container element (or what ever you have called it).
         * @type trivia_xml_betaL#110@call;@arr;getElementsByTagName.childNodes
         */
        if (markers) {

            var markerNodes = markers.childNodes;
            //console.log(markerNodes);
            loadNodes(markerNodes, container);

        }
        var button = document.getElementsByClassName('buttonStyle');



        var pos = 0; // Position among the button in the questions:
        var num = 1; // Starting number for the questions to be asked:
        var right = 0;
        var wrong = 0;
        var score = 0;
        var points = 100;
        var average = 0;
        var nextButton = document.getElementById('next' + num);
        var records = container.getAttribute('data-records');
        var seconds = 15;
        var gameOver = false;
        var timer = null;


        document.getElementById('clock' + num).innerHTML = seconds + " Seconds";
        document.getElementById('clock' + num).style['color'] = "green";
        average = (right / num) * 100;
        document.getElementById('percent' + num).innerHTML = average.toFixed(0) + "%";
        function startTimer(seconds) {
            timeLeft = seconds;
            timer = setInterval(countdown, 1000);
        }

        function timesUp() {
            var computer = parseInt(correct[num - 1]);

            button[computer - 1 + pos].style['background-color'] = 'green';
            score -= (points / 2);
            document.getElementById('score' + num).innerHTML = 'Score ' + score + ' Points';
            wrong += 1;
            average = (right / num) * 100;
            document.getElementById('percent' + num).innerHTML = average.toFixed(0) + "%";
            console.log('Right:', right, 'Wrong:', wrong);
            nextButton.style['display'] = "block";
            nextButton.addEventListener("click", resetGame); // Add next button addEventListener to the game:
            removeButtons();
        }
        function countdown() {
            var counter = 0;
            if (timeLeft === 0) {
                clearTimeout(timer);
                document.getElementById('clock' + num).style['color'] = "red";
                document.getElementById('clock' + num).innerHTML = '00 Seconds';
                timesUp();

            } else {
                if (timeLeft < 10) {
                    counter = '0' + timeLeft;
                } else {
                    counter = timeLeft;
                }
                document.getElementById('clock' + num).innerHTML = counter + ' Seconds';
                timeLeft--;
            }
        }

        startTimer(seconds);

        /*
         * Show the current question being asked and hide the next
         * button in order that it won't be shown until user answers the
         * current question.
         */
        document.getElementById('score' + num).innerHTML = 'Score ' + score + ' Points';
        document.getElementById('mainGame' + num).style['display'] = "block";
        nextButton.style['display'] = "none";

        /*
         * Check the user's answer's against the database table's answer (computer)
         * to see if it is right or wrong. It will also calculate right/wrong and highlight
         * the right answer and wrong answer (if picked wrong).
         */
        function checkAnswer() {

            clearInterval(timer);
            var computer = parseInt(correct[num - 1]);

            //console.log('Correc Answer', computer);

            var answer = parseInt(this.getAttribute('data-correct'));

            if (answer === computer) {
                right += 1;
                button[answer - 1 + pos].style['background-color'] = "green";
                score += points;

            } else {
                wrong += 1;
                score -= (points / 2);
                button[answer - 1 + pos].style['background-color'] = 'red';

                button[computer - 1 + pos].style['background-color'] = 'green';
            }
            document.getElementById('score' + num).innerHTML = 'Score ' + score + ' Points';
            average = (right / num) * 100;
            document.getElementById('percent' + num).innerHTML = average.toFixed(0) + "%";
            console.log('average', average.toFixed(0));

            /*
             * Show the next button and an Event Listener to the button.
             */
            if (num < records) {
                nextButton.style['display'] = "block";
                nextButton.addEventListener("click", resetGame); // Add next button addEventListener to the game:
            } else {
                document.getElementById('score' + num).innerHTML = 'Score ' + score + ' Points';
                document.getElementById('percent' + num).innerHTML = average.toFixed(0) + "%";
                nextButton.style['display'] = "block";
                nextButton.style['background-color'] = "red";
                nextButton.innerHTML = "Game Over";

            }
            removeButtons();


        }

        /*
         * Add Event Listeners to answer buttons, so that
         * the user can click on them:
         */
        function addButtons() {
            for (var a = 1; a <= 4; a++) {
                document.getElementById('button' + (a + pos)).addEventListener("click", checkAnswer);
            }
        }

        addButtons();

        /*
         * Remove Event Listeners, so that the user can't keep on answering
         * the same question over and over againg.
         */
        function removeButtons() {
            for (var a = 1; a <= 4; a++) {
                document.getElementById('button' + (a + pos)).removeEventListener("click", checkAnswer);
            }
            //console.log(document.getElementById('score' + num).innerHTML = score);
        }

        /*
         * Reset the game after the user click on the next button.
         */
        function resetGame() {

            //console.log('Total Questions:', num);
            //console.log('score', score);
            if (num < records) {
                nextButton.removeEventListener('click', resetGame);
                document.getElementById('mainGame' + num).style['display'] = 'none';
                num += 1;
                document.getElementById('percent' + num).innerHTML = average.toFixed(0) + "%";
                nextButton = document.getElementById('next' + num);
                document.getElementById('mainGame' + num).style['display'] = 'block';
                nextButton.style['display'] = "none";
                pos = pos + 4;
                document.getElementById('clock' + num).innerHTML = seconds + " Seconds";
                startTimer(seconds);
                document.getElementById('score' + num).innerHTML = 'Score ' + score + ' Points';
                addButtons();
            }


        }

    }); // End of main function:
}

function getCategories() {
    var form = document.getElementById("categories-form");
    var action = form.getAttribute("action");

    /*
     * Gather Form Data:
     */
    var form_data = new FormData(form);
    //    for ([key, value] of form_data.entries()) {
    //        console.log(key + ': ' + value);
    //    }

    var xhr = new XMLHttpRequest();
    xhr.open('POST', action, true);
    // do not set content-type with FormData
    //xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var result = xhr.responseText;
            //console.log('Result: ' + result);

            var json = JSON.parse(result);
            //console.log(json.total);
            /*
             * Hide Category Selection
             */
            document.getElementById('categories-form').style.display = 'none';

            loadGame('triviaxml.php', 0, json.total, json.category);
        }
    };
    xhr.send(form_data);
}

button.addEventListener("click", function (event) {
    event.preventDefault();
    getCategories();
});