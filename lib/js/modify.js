var button = document.getElementById('submitBtn');
var legend = document.getElementById('legend');
var id = document.getElementById('id');
var question = document.getElementById('addQuestion');
var answer1 = document.getElementById('addAnswer1');
var answer2 = document.getElementById('addAnswer2');
var answer3 = document.getElementById('addAnswer3');
var answer4 = document.getElementById('addAnswer4');
var correct = document.getElementById('addCorrect');
var pos = 0;

/*
 * 
 * @param {type} url
 * @param {type} start
 * @param {type} end
 * @param {type} category
 * @param {type} callback
 * Get all the questions from the category selected.
 */
function ajaxCall(url, start, end, category, callback) {

    //console.log(start, end, category);
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

function grabData(markers) {
    var data = new Array();
    if (markers) {
        var markerNodes = markers.childNodes;
        var records = markerNodes.length;
        for (var i = 0; i < records; i++) {
            data[i] = {
                id: markerNodes[i].getAttribute("id"),
                question: markerNodes[i].getAttribute("question"),
                answer1: markerNodes[i].getAttribute("answer1"),
                answer2: markerNodes[i].getAttribute("answer2"),
                answer3: markerNodes[i].getAttribute("answer3"),
                answer4: markerNodes[i].getAttribute("answer4"),
                correct: markerNodes[i].getAttribute("correct")
            };
        } // End of For Loop:
    } // End of If Statement:
    return data;
}

function display(data) {
    id.value = data[pos].id;
    question.innerHTML = data[pos].question;
    answer1.value = data[pos].answer1;
    answer2.value = data[pos].answer2;
    answer3.value = data[pos].answer3;
    answer4.value = data[pos].answer4;
    correct.value = data[pos].correct;
}

function save() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var result = xhr.responseText;

            var status = JSON.parse(result);
            console.log('status', status);
            function closeit() {
                document.getElementById("shadow").style.display = "none";
            }
            if (status.result) {
                document.getElementById('shadow').style.display = 'block';
                setTimeout(closeit, 2000);
            }

        }
    };
    var form = document.getElementById("addTrivia");
    var action = form.getAttribute("action");

    /*
     * Gather Form Data:
     */
    var form_data = new FormData(form);

    /*
     * open and send should be last, sot that onreadystatechange can have time
     * to trigger.
     */
    xhr.open('POST', action, true);
    /*
     * Do not set content-type with FormData
     * xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
     */
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.send(form_data);
}

function editQuiz(url, start, end, category) {

    ajaxCall(url, start, end, category, function () {
        var data = new Array();
        var markers = this.getElementsByTagName("markers")[0]; // Grab Questions and Answers:
        var prevButton = document.getElementById('prevBtn');
        var nextButton = document.getElementById('nextBtn');
        var saveButton = document.getElementById('saveBtn');

        data = grabData(markers);

        var max = data.length; // Maximum amount of records:

        /*
         * Previous Button to show previous record.
         */
        prevButton.addEventListener('click', function (e) {
            e.preventDefault();
            if (pos > 0) {
                pos--;
            } else {
                pos = max - 1;
            }
            display(data);
        });

        /*
         * Next Button to show next record.
         */
        nextButton.addEventListener('click', function (e) {
            e.preventDefault();
            if (pos < max - 1) {
                pos++;
            } else {
                pos = 0;
            }
            display(data);
        });

        display(data);

        saveButton.addEventListener('click', function (e) {
            e.preventDefault(); // Prevent submit button from firing:
            /*
             * Store the edited content in the corresponding array.
             */
            data[pos].question = question.innerHTML;
            data[pos].answer1 = answer1.value;
            data[pos].answer2 = answer2.value;
            data[pos].answer3 = answer3.value;
            data[pos].answer4 = answer4.value;
            data[pos].correct = correct.value;
            /*
             * Save data to database table.
             */
            save();
        });



    }); // End of Function Call:
}

function insertNew() {

    var addform = document.getElementById('addTrivia');
    var action = 'add_trivia.php';


    var fdata = new FormData(addform);
//    for ([key, value] of fdata.entries()) {
//        console.log(key + ': ' + value);
//    }
    var xhr = new XMLHttpRequest();
    xhr.open('POST', action, true);
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var result = xhr.responseText;
            console.log(result);
            var info = JSON.parse(result);
            console.log('info', info);
            if (info.result) {
                document.getElementById("addTrivia").reset();
                function closeit() {
                    document.getElementById("shadow").style.display = "none";
                }
                if (info.result) {
                    document.getElementById('shadow').style.display = 'block';
                    setTimeout(closeit, 2000);
                }
            }

        }
    }
    xhr.send(fdata);
}


function addQuiz(category) {
    document.getElementById('cat').value = category;
    document.getElementById('add-categories-form').style.display = "none";
    document.getElementById('prevBtn').style.display = "none";
    document.getElementById('nextBtn').style.display = "none";
    document.getElementById('addTrivia').style.display = "block";

    document.getElementById('saveBtn').addEventListener('click', function () {
        console.log('Click!');
        insertNew();
    });

}

function retrieveCategories() {
    var form = document.getElementById("add-categories-form");
    var action = form.getAttribute("action");

    /*
     * Gather Form Data:
     */
    var form_data = new FormData(form);
//    for ([key, value] of form_data.entries()) {
//        console.log(key + ': ' + value);
//    }
    var modForm = document.getElementById('addTrivia');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', action, true);
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var result = xhr.responseText;

            var json = JSON.parse(result);
            console.log('json', json, 'result', result);
            /*
             * Hide Category Selection
             */
            if (json.status === 'edit') {
                form.style.display = 'none';
                legend.innerHTML = "Edit " + json.category + " Trivia Question(s)";
                modForm.style.display = "block";
                document.getElementById('saveBtn').style['margin-left'] = "70px";
                editQuiz('triviaxml.php', 0, json.total, json.category);
            }
            if (json.status === 'new') {

                addQuiz(json.category);
            }

        }
    };
    xhr.send(form_data);
}



button.addEventListener("click", function (event) {
    event.preventDefault();
    retrieveCategories();
});


