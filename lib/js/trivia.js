var container;
var correct = new Array();


function main(url, start, end, category, callback) {

    var check = 'start=' + start + '&end=' + end + '&category=' + category;

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        //console.log('readyState: ' + xhr.readyState, 'xhr.status: ' + xhr.status);
        if (xhr.readyState === 2) {
            //console.log(xhr.status);
        }
        if (xhr.readyState === 4 && xhr.status === 200) {


            callback.call(xhr.responseXML);

            //console.log('info', info.getElementsByTagName("markers")[0]);
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

            var display = document.createElement('div');
            var displayId = document.createAttribute('id');
            displayId.value = "record" + (i + 1);
            display.setAttributeNode(displayId);
            mainGame.appendChild(display);

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
main('triviaxml.php', 0, 5, 'movie', function () {
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
    var nextButton = document.getElementById('next' + num);


    var records = container.getAttribute('data-records');

    /*
     * Show the current question being asked and hide the next
     * button in order that it won't be shown until user answers the
     * current question.
     */
    document.getElementById('mainGame' + num).style['display'] = "block";
    nextButton.style['display'] = "none";

    /*
     * Check the user's answer's against the database table's answer (computer)
     * to see if it is right or wrong. It will also calculate right/wrong and highlight
     * the right answer and wrong answer (if picked wrong).
     */
    function checkAnswer() {
        var computer = parseInt(correct[num - 1]);
        //console.log('Correc Answer', computer);
        var answer = parseInt(this.getAttribute('data-correct'));
        if (answer === computer) {
            right += 1;
            button[answer - 1 + pos].style['background-color'] = "green";

        } else {
            wrong += 1;
            button[answer - 1+ pos].style['background-color'] = 'red';
            button[computer - 1 + pos].style['background-color'] = 'green';
        }

        console.log('Right:', right, 'Wrong:', wrong);
        
        /*
         * Show the next button and an Event Listener to the button.
         */
        nextButton.style['display'] = "block";
        nextButton.addEventListener("click", resetGame); // Add next button addEventListener to the game:

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
    }

    /*
     * Reset the game after the user click on the next button.
     */
    function resetGame() {

        //console.log('Total Questions:', num);

        if (num < records) {
            nextButton.removeEventListener('click', resetGame);
            document.getElementById('mainGame' + num).style['display'] = 'none';
            num += 1;
            nextButton = document.getElementById('next' + num);
            document.getElementById('mainGame' + num).style['display'] = 'block';
            nextButton.style['display'] = "none";
            pos = pos + 4;
            addButtons();
        } else {
            removeButtons();
            console.log("Game Over!", num);
        }


    }

}); // End of main function:
