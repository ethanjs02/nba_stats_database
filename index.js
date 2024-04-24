//define url connection to backend
const url = "http://127.0.0.1:8987/input_handler"

function addGame() 
{
    //get user input
    data = 
    {
        id: '1',
        team1: document.getElementById("1a").value,
        team2: document.getElementById("1b").value,
        score1: document.getElementById("1c").value,
        score2: document.getElementById("1d").value,
        date: document.getElementById("1e").value,
    }
    
    //send request to backend
    sendRequest(data)
}

function addPlayer() 
{
    //get user input
    data = 
    {
        id: '2',
        teamId: document.getElementById("2a").value,
        name: document.getElementById("2b").value,
        number: document.getElementById("2c").value,
        position: document.getElementById("2d").value,
    }

    //send request to backend
    sendRequest(data)
}

function viewPlayersByTeam() 
{
    //get user input
    data = 
    {
        id: '3',
        teamId: document.getElementById("3").value,
    }

    //send request to backend
    sendRequest(data)
}

function viewPlayersByPos() 
{
    //get user input
    data = 
    {
        id: '4',
        position: document.getElementById("4").value
    }

    //send request to backend
    sendRequest(data)
}

function viewStandings() 
{
    //get user input
    data = 
    {
        id: '5',
        conference: document.getElementById("5").value
    }

    sendRequest(data)
}

function viewTeamsGames() 
{
    //get user input
    data = 
    {
        id: '6',
        teamId: document.getElementById("6").value
    }

    //send request to backend
    sendRequest(data)
}

function viewResultsFromDate() 
{
    //get user input
    data = 
    {
        id: '7',
        date: document.getElementById("7").value
    }

    //send request to backend
    sendRequest(data)
}

function viewTeamMatchups() 
{
    //get user input
    data = 
    {
        id: '8',
        team1: document.getElementById("8a").value,
        team2: document.getElementById("8b").value
    }

    //send request to backend
    sendRequest(data)
}

function populateTable() 
{

}

function sendRequest(data)
{
    fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(data) })
        .then(res => res.json())
        .then(data => console.log(data))
        .catch(error => console.error('Error:', error));

}

//function to populate the select element with NBA teams
function populateTeamSelect() 
{
    const nbaTeams = 
    [
        "Atlanta Hawks", "Boston Celtics", "Brooklyn Nets", "Charlotte Hornets", "Chicago Bulls",
        "Cleveland Cavaliers", "Dallas Mavericks", "Denver Nuggets", "Detroit Pistons", "Golden State Warriors",
        "Houston Rockets", "Indiana Pacers", "Los Angeles Clippers", "Los Angeles Lakers", "Memphis Grizzlies",
        "Miami Heat", "Milwaukee Bucks", "Minnesota Timberwolves", "New Orleans Pelicans", "New York Knicks",
        "Oklahoma City Thunder", "Orlando Magic", "Philadelphia 76ers", "Phoenix Suns", "Portland Trail Blazers",
        "Sacramento Kings", "San Antonio Spurs", "Toronto Raptors", "Utah Jazz", "Washington Wizards"
    ];

    //get all select elements with the class "teamSelect"
    let teamSelects = document.querySelectorAll(".teamSelect");

    for(selectElement of teamSelects)
    {
        //clear any existing options
        selectElement.innerHTML = "";

        //add an initial default option
        let defaultOption = document.createElement("option");
        defaultOption.text = "Select a team";
        selectElement.appendChild(defaultOption);

        //loop through the array of NBA teams and create an option for each one
        nbaTeams.forEach(function(team, index) 
        {
            let option = document.createElement("option");
            option.value = index; //set the value to the index
            option.text = team;   //set the text to the team name
            selectElement.appendChild(option);
        });
        
    }
}

function populateConfSelect()
{
    const conferences = ["East", "West"]

    // Get a reference to the select element
    let selectElement = document.querySelector(".confSelect");    

    selectElement.innerHTML = "";

    // Add an initial default option
    let defaultOption = document.createElement("option");
    defaultOption.text = "Select a conference";
    selectElement.appendChild(defaultOption);

    // Loop through the array of positions and create an option for each one
    conferences.forEach(function(conference) {
        let option = document.createElement("option");
        option.text = conference; // Set the text to the position
        selectElement.appendChild(option);
    });

}

function populatePositionSelect() 
{
    const positions = ["PG", "SG", "SF", "PF", "C"];

    // Get a reference to the select element
    let elements = document.querySelectorAll(".positionSelect");
 
    for(selectElement of elements)
    {
    // Clear any existing options
    selectElement.innerHTML = "";

    // Add an initial default option
    let defaultOption = document.createElement("option");
    defaultOption.text = "Select a position";
    selectElement.appendChild(defaultOption);

    // Loop through the array of positions and create an option for each one
    positions.forEach(function(position) {
        let option = document.createElement("option");
        option.text = position; // Set the text to the position
        selectElement.appendChild(option);});
    }
}

//populate html select elements
populateTeamSelect();
populatePositionSelect();
populateConfSelect();
