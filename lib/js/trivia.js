/*
 *  Trivia Game Version 3.5.0 beta with XML
 *  by John Pepp
 *  Started: January 31, 2017
 *  Revised: January 10, 2020
 */
var timesUp = false;
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
    if (!markerNodes)
        return; // short circuit out is better
    var
            d = document,
            records = markerNodes.length,
            count = 0;

    container.setAttribute('data-records', records);

    for (var i = 0; i < records; i++) {

        var
                idIndex = i + 1,
                mainGame = container.appendChild(d.createElement('div')),
                screen = mainGame.appendChild(d.createElement('div')),
                q = screen.appendChild(d.createElement('h2'));


        correct[i] = markerNodes[i].getAttribute('correct');

        mainGame.id = 'mainGame' + idIndex;
        mainGame['data-id'] = markerNodes[i].getAttribute('id');

        screen.className = 'screen';

        q.id = 'question' + idIndex;

        var question = markerNodes[i].getAttribute('question');
        q.appendChild(d.createTextNode(question.replace(/&quot;/g, '"')));


        for (var j = 1; j <= 4; j++) {
            var button = mainGame.appendChild(d.createElement('button')),
                    answer = markerNodes[i].getAttribute("answer" + j);
            button.setAttribute('data-correct', j);
            /* Yes, it is needed as I show the right and wrong answers in color
             * (red = wrong & green = right) */
            button.className = 'buttonStyle'; // is this REALLY necessary?!?
            button.id = 'button' + (++count);
            button.appendChild(d.createTextNode(answer.replace(/&quot;/g, '"')));
        } // for j
        
        var scoring = mainGame.appendChild(d.createElement('div')),
                scoreElement = scoring.appendChild(d.createElement('h2')),
                display = mainGame.appendChild(d.createElement('div')),
                displayPercent = scoring.appendChild(d.createElement('h2')),
                clock = display.appendChild(d.createElement('h2')),
                nextButton = display.appendChild(d.createElement('button'));
        scoring.id = 'scoring' + idIndex;
        scoreElement.id = 'score' + idIndex;
        display.id = 'record' + idIndex;
        displayPercent.id = 'percent' + idIndex;
        clock.id = 'clock' + idIndex;

        nextButton.id = 'next' + idIndex;
        nextButton.className = 'nextBtn';
        nextButton.textContent = 'Next';


    } // for i


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
        var seconds = 300;
        var gameOver = false;
        var timer = null;
        var totalTime = 3600;
        var playerTimer = null;


        document.getElementById('clock' + num).innerHTML = seconds + " Seconds";
        document.getElementById('clock' + num).style['color'] = "green";
        average = (right / num) * 100;
        document.getElementById('percent' + num).innerHTML = average.toFixed(0) + "%";

        function getTimeRemaining(t) {

            var seconds = Math.floor((t / 1000) % 60);
            var minutes = Math.floor((t / 1000 / 60) % 60);

            console.log(t);
            return {
                'total': t,
                'minutes': minutes,
                'seconds': seconds
            };
        }

        function initializeClock(id, endtime) {
            var clock = document.getElementById(id);
            var minutesSpan = clock.querySelector('.minutes');
            var secondsSpan = clock.querySelector('.seconds');

            function updateClock() {
                var t = getTimeRemaining(endtime);
                endtime = endtime - 1000;
                minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
                secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);
                //console.log('total', t.total);
                if (t.total <= 0) {
                    clearInterval(timeinterval);
                    clearTimeout(timer);
                    document.getElementById('score' + num).innerHTML = 'Score ' + score + ' Points';
                    document.getElementById('percent' + num).innerHTML = average.toFixed(0) + "%";
                    nextButton.style['display'] = "block";
                    nextButton.style['background-color'] = "red";
                    nextButton.innerHTML = "Game Over";
                    nextButton.removeEventListener('click', resetGame);
                    removeButtons();
                }
            }

            updateClock();
            var timeinterval = setInterval(updateClock, 1000);
        }

        initializeClock('countdownClock', totalTime * 1000)

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



function serializeFormById(id) {
    function add(name, value) {
        result +=
                (result ? '&' : '') +
                encodeURIComponent(name) +
                '=' +
                encodeURIComponent(value);
    }
    var form = document.getElementById(id);
    var result = '';

    for (var i = 0, e; e = form.elements[i]; i++)
        if (e.name)
            switch (e.tagName) {
                case 'INPUT':
                switch (e.type) {
                    case 'file' :
                        // to-do, add serialization for browsers that support it
                        throw new TypeError('Cannot Serialize a <input type="file">');
                    case 'checkbox':
                    case 'radio':
                        if (!e.checked)
                            continue;
                }
                case 'BUTTON':
                case 'TEXTAREA':
                    add(e.name, e.value);
                    break;
                case 'SELECT':
                    add(e.name, e.options[e.selectedIndex].value);
            }

    return result;
}


function getCategories() {


    form_data = serializeFormById('categories-form');
    //console.log('serialize', form_data);
    var xhr = new XMLHttpRequest();
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
            document.getElementById('textContainer').style.display = "block";
            document.getElementById('subject').innerHTML = "Category " + json.category;
            loadGame('triviaxml.php', 0, json.total, json.category);
        }
    };


    xhr.open('POST', 'totalRecords.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.send(form_data);
}

button.addEventListener("click", function (event) {
    event.preventDefault();
    getCategories();
});





//document.getElementById('categories-form').style.display = 'none';
//document.getElementById('textContainer').style.display = 'block';
//loadGame('triviaxml.php', 0, 10, 'movie');