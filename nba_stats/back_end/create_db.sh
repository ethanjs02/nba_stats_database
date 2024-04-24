mysql <<EOFMYSQL
use ejs022;

drop table Player;
drop table Game;
drop table Team;

create table Team(
    teamId int auto_increment,
    name varchar(30) not null,
    conference varchar(15) not null,
    division varchar(15) not null,
    primary key (teamId)
);

create table Game(
    gameId int auto_increment,
    team1 int,
    team2 int,
    score1 int,
    score2 int,
    date date,
    primary key (gameId),
    foreign key (team1) references Team(teamId),
    foreign key (team2) references Team(teamId)
);

create table Player(
    playerId int auto_increment,
    teamId int,
    name varchar(30),
    number varchar(4),
    position enum('pg', 'sg', 'sf', 'pf', 'c'),
    primary key (playerId),
    foreign key (teamId) references Team(teamId)
);

insert into Team (name, conference, division) values 
('Atlanta Hawks', 'Eastern', 'Southeast'),
('Boston Celtics', 'Eastern', 'Atlantic'),
('Brooklyn Nets', 'Eastern', 'Atlantic'),
('Charlotte Hornets', 'Eastern', 'Southeast'),
('Chicago Bulls', 'Eastern', 'Central'),
('Cleveland Cavaliers', 'Eastern', 'Central'),
('Dallas Mavericks', 'Western', 'Southwest'),
('Denver Nuggets', 'Western', 'Northwest'),
('Detroit Pistons', 'Eastern', 'Central'),
('Golden State Warriors', 'Western', 'Pacific'),
('Houston Rockets', 'Western', 'Southwest'),
('Indiana Pacers', 'Eastern', 'Central'),
('Los Angeles Clippers', 'Western', 'Pacific'),
('Los Angeles Lakers', 'Western', 'Pacific'),
('Memphis Grizzlies', 'Western', 'Southwest'),
('Miami Heat', 'Eastern', 'Southeast'),
('Milwaukee Bucks', 'Eastern', 'Central'),
('Minnesota Timberwolves', 'Western', 'Northwest'),
('New Orleans Pelicans', 'Western', 'Southwest'),
('New York Knicks', 'Eastern', 'Atlantic'),
('Oklahoma City Thunder', 'Western', 'Northwest'),
('Orlando Magic', 'Eastern', 'Southeast'),
('Philadelphia 76ers', 'Eastern', 'Atlantic'),
('Phoenix Suns', 'Western', 'Pacific'),
('Portland Trail Blazers', 'Western', 'Northwest'),
('Sacramento Kings', 'Western', 'Pacific'),
('San Antonio Spurs', 'Western', 'Southwest'),
('Toronto Raptors', 'Eastern', 'Atlantic'),
('Utah Jazz', 'Western', 'Northwest'),
('Washington Wizards', 'Eastern', 'Southeast');


insert into Game (team1, team2, score1, score2, date) values
(1, 2, 110, 105, '2024-04-20'),
(1, 3, 115, 120, '2024-04-19'),
(2, 3, 112, 114, '2024-04-18'),
(4, 5, 105, 108, '2024-04-17'),
(4, 6, 98, 100, '2024-04-16'),
(5, 7, 102, 98, '2024-04-15'),
(6, 8, 110, 106, '2024-04-14'),
(7, 8, 99, 102, '2024-04-13'),
(8, 9, 97, 94, '2024-04-12'),
(9, 10, 101, 108, '2024-04-11'),
(10, 11, 112, 110, '2024-04-10'),
(11, 12, 98, 105, '2024-04-09'),
(12, 13, 120, 115, '2024-04-08'),
(13, 14, 108, 106, '2024-04-07'),
(14, 15, 115, 112, '2024-04-06'),
(15, 16, 105, 108, '2024-04-05'),
(16, 17, 102, 98, '2024-04-04'),
(17, 18, 106, 110, '2024-04-03'),
(18, 19, 112, 114, '2024-04-02'),
(19, 20, 98, 100, '2024-04-01'),
(20, 21, 110, 105, '2024-03-31'),
(21, 22, 115, 120, '2024-03-30'),
(22, 23, 112, 114, '2024-03-29'),
(23, 24, 105, 108, '2024-03-28'),
(24, 25, 98, 100, '2024-03-27'),
(25, 26, 102, 98, '2024-03-26'),
(26, 27, 110, 106, '2024-03-25'),
(27, 28, 99, 102, '2024-03-24'),
(28, 29, 97, 94, '2024-03-23'),
(29, 30, 101, 108, '2024-03-22'),
(1, 4, 112, 110, '2024-03-21'),
(2, 5, 98, 105, '2024-03-20'),
(3, 6, 120, 115, '2024-03-19'),
(4, 7, 108, 106, '2024-03-18'),
(5, 8, 115, 112, '2024-03-17'),
(6, 9, 105, 108, '2024-03-16'),
(7, 10, 102, 98, '2024-03-15'),
(8, 11, 106, 110, '2024-03-14'),
(9, 12, 112, 114, '2024-03-13'),
(10, 13, 98, 100, '2024-03-12'),
(11, 14, 110, 105, '2024-03-11'),
(12, 15, 115, 120, '2024-03-10'),
(13, 16, 112, 114, '2024-03-09'),
(14, 17, 105, 108, '2024-03-08'),
(15, 18, 98, 100, '2024-03-07'),
(16, 19, 102, 98, '2024-03-06'),
(17, 20, 110, 106, '2024-03-05'),
(18, 21, 99, 102, '2024-03-04'),
(19, 22, 97, 94, '2024-03-03'),
(20, 23, 101, 108, '2024-03-02'),
(21, 24, 112, 110, '2024-03-01'),
(22, 25, 98, 105, '2024-02-29'),
(23, 26, 120, 115, '2024-02-28'),
(24, 27, 108, 106, '2024-02-27'),
(25, 28, 115, 112, '2024-02-26'),
(26, 29, 105, 108, '2024-02-25'),
(27, 30, 102, 98, '2024-02-24'),
(1, 5, 106, 110, '2024-02-23'),
(2, 6, 112, 114, '2024-02-22'),
(3, 7, 98, 100, '2024-02-21'),
(4, 8, 110, 105, '2024-02-20'),
(5, 9, 115, 120, '2024-02-19'),
(6, 10, 112, 114, '2024-02-18'),
(7, 11, 105, 108, '2024-02-17'),
(8, 12, 98, 100, '2024-02-16'),
(9, 13, 102, 98, '2024-02-15'),
(10, 14, 110, 106, '2024-02-14'),
(11, 15, 99, 102, '2024-02-13'),
(12, 16, 97, 94, '2024-02-12'),
(13, 17, 101, 108, '2024-02-11'),
(14, 18, 112, 110, '2024-02-10'),
(15, 19, 98, 105, '2024-02-09'),
(16, 20, 120, 115, '2024-02-08'),
(17, 21, 108, 106, '2024-02-07'),
(18, 22, 115, 112, '2024-02-06'),
(19, 23, 105, 108, '2024-02-05'),
(20, 24, 102, 98, '2024-02-04'),
(21, 25, 106, 110, '2024-02-03'),
(22, 26, 112, 114, '2024-02-02'),
(23, 27, 98, 100, '2024-02-01'),
(24, 28, 110, 105, '2024-01-31'),
(25, 29, 115, 120, '2024-01-30'),
(26, 30, 112, 114, '2024-01-29'),
(27, 1, 105, 108, '2024-01-28'),
(28, 2, 98, 100, '2024-01-27'),
(29, 3, 102, 98, '2024-01-26'),
(30, 4, 110, 106, '2024-01-25');

-- Atlanta Hawks
insert into Player(teamId, name, number, position) values
(1, 'Trae Young', '11', 'pg'),
(1, 'Bogdan Bogdanovic', '13', 'sg'),
(1, 'De\'Andre Hunter', '12', 'sf'),
(1, 'John Collins', '20', 'pf'),
(1, 'Clint Capela', '15', 'c');

-- Boston Celtics
insert into Player(teamId, name, number, position) values
(2, 'Kemba Walker', '8', 'pg'),
(2, 'Marcus Smart', '36', 'sg'),
(2, 'Jaylen Brown', '7', 'sf'),
(2, 'Jayson Tatum', '0', 'pf'),
(2, 'Tristan Thompson', '13', 'c');

-- Brooklyn Nets
insert into Player(teamId, name, number, position) values
(3, 'Kyrie Irving', '11', 'pg'),
(3, 'James Harden', '13', 'sg'),
(3, 'Joe Harris', '12', 'sf'),
(3, 'Kevin Durant', '7', 'pf'),
(3, 'DeAndre Jordan', '6', 'c');

-- Charlotte Hornets
insert into Player(teamId, name, number, position) values
(4, 'LaMelo Ball', '2', 'pg'),
(4, 'Terry Rozier', '3', 'sg'),
(4, 'Gordon Hayward', '20', 'sf'),
(4, 'P.J. Washington', '25', 'pf'),
(4, 'Cody Zeller', '40', 'c');

-- Chicago Bulls
insert into Player(teamId, name, number, position) values
(5, 'Coby White', '0', 'pg'),
(5, 'Zach LaVine', '8', 'sg'),
(5, 'Patrick Williams', '44', 'sf'),
(5, 'Thaddeus Young', '21', 'pf'),
(5, 'Nikola Vucevic', '9', 'c');

-- Cleveland Cavaliers
insert into Player(teamId, name, number, position) values
(6, 'Darius Garland', '10', 'pg'),
(6, 'Collin Sexton', '2', 'sg'),
(6, 'Isaac Okoro', '35', 'sf'),
(6, 'Kevin Love', '0', 'pf'),
(6, 'Jarrett Allen', '31', 'c');

-- Dallas Mavericks
insert into Player(teamId, name, number, position) values
(7, 'Luka Doncic', '77', 'pg'),
(7, 'Tim Hardaway Jr.', '11', 'sg'),
(7, 'Dorian Finney-Smith', '10', 'sf'),
(7, 'Kristaps Porzingis', '6', 'pf'),
(7, 'Dwight Powell', '7', 'c');

-- Denver Nuggets
insert into Player(teamId, name, number, position) values
(8, 'Jamal Murray', '27', 'pg'),
(8, 'Will Barton', '5', 'sg'),
(8, 'Michael Porter Jr.', '1', 'sf'),
(8, 'Aaron Gordon', '50', 'pf'),
(8, 'Nikola Jokic', '15', 'c');

-- Detroit Pistons
insert into Player(teamId, name, number, position) values
(9, 'Killian Hayes', '7', 'pg'),
(9, 'Hamidou Diallo', '6', 'sg'),
(9, 'Jerami Grant', '9', 'sf'),
(9, 'Saddiq Bey', '41', 'pf'),
(9, 'Isaiah Stewart', '28', 'c');

-- Golden State Warriors
insert into Player(teamId, name, number, position) values
(10, 'Stephen Curry', '30', 'pg'),
(10, 'Klay Thompson', '11', 'sg'),
(10, 'Andrew Wiggins', '22', 'sf'),
(10, 'Draymond Green', '23', 'pf'),
(10, 'Kevon Looney', '5', 'c');

-- Houston Rockets
insert into Player(teamId, name, number, position) values
(11, 'Kevin Porter Jr.', '3', 'pg'),
(11, 'Jalen Green', '0', 'sg'),
(11, 'Jae\'Sean Tate', '8', 'sf'),
(11, 'Christian Wood', '35', 'pf'),
(11, 'Daniel Theis', '27', 'c');

-- Indiana Pacers
insert into Player(teamId, name, number, position) values
(12, 'Malcolm Brogdon', '7', 'pg'),
(12, 'Caris LeVert', '22', 'sg'),
(12, 'TJ Warren', '1', 'sf'),
(12, 'Domantas Sabonis', '11', 'pf'),
(12, 'Myles Turner', '33', 'c');

-- Los Angeles Clippers
insert into Player(teamId, name, number, position) values
(13, 'Reggie Jackson', '1', 'pg'),
(13, 'Paul George', '13', 'sg'),
(13, 'Kawhi Leonard', '2', 'sf'),
(13, 'Marcus Morris Sr.', '8', 'pf'),
(13, 'Ivica Zubac', '40', 'c');

-- Los Angeles Lakers
insert into Player(teamId, name, number, position) values
(14, 'LeBron James', '6', 'pg'),
(14, 'Kentavious Caldwell-Pope', '1', 'sg'),
(14, 'Anthony Davis', '3', 'sf'),
(14, 'Markieff Morris', '88', 'pf'),
(14, 'Andre Drummond', '2', 'c');

-- Memphis Grizzlies
insert into Player(teamId, name, number, position) values
(15, 'Ja Morant', '12', 'pg'),
(15, 'Dillon Brooks', '24', 'sg'),
(15, 'Kyle Anderson', '1', 'sf'),
(15, 'Jaren Jackson Jr.', '13', 'pf'),
(15, 'Steven Adams', '12', 'c');

-- Miami Heat
insert into Player(teamId, name, number, position) values
(16, 'Kyle Lowry', '7', 'pg'),
(16, 'Duncan Robinson', '55', 'sg'),
(16, 'Jimmy Butler', '22', 'sf'),
(16, 'P.J. Tucker', '17', 'pf'),
(16, 'Bam Adebayo', '13', 'c');

-- Milwaukee Bucks
insert into Player(teamId, name, number, position) values
(17, 'Jrue Holiday', '21', 'pg'),
(17, 'Grayson Allen', '24', 'sg'),
(17, 'Khris Middleton', '22', 'sf'),
(17, 'Giannis Antetokounmpo', '34', 'pf'),
(17, 'Brook Lopez', '11', 'c');

-- Minnesota Timberwolves
insert into Player(teamId, name, number, position) values
(18, 'D\'Angelo Russell', '0', 'pg'),
(18, 'Anthony Edwards', '1', 'sg'),
(18, 'Josh Okogie', '20', 'sf'),
(18, 'Jaden McDaniels', '3', 'pf'),
(18, 'Karl-Anthony Towns', '32', 'c');

-- New Orleans Pelicans
insert into Player(teamId, name, number, position) values
(19, 'Devonte\' Graham', '4', 'pg'),
(19, 'Josh Hart', '3', 'sg'),
(19, 'Brandon Ingram', '14', 'sf'),
(19, 'Zion Williamson', '1', 'pf'),
(19, 'Jonas Valanciunas', '17', 'c');

-- New York Knicks
insert into Player(teamId, name, number, position) values
(20, 'Kemba Walker', '8', 'pg'),
(20, 'Evan Fournier', '13', 'sg'),
(20, 'RJ Barrett', '9', 'sf'),
(20, 'Julius Randle', '30', 'pf'),
(20, 'Mitchell Robinson', '23', 'c');

-- Oklahoma City Thunder
insert into Player(teamId, name, number, position) values
(21, 'Shai Gilgeous-Alexander', '2', 'pg'),
(21, 'Luguentz Dort', '5', 'sg'),
(21, 'Aleksej Pokusevski', '17', 'sf'),
(21, 'Darius Bazley', '7', 'pf'),
(21, 'Jeremiah Robinson-Earl', '50', 'c');

-- Orlando Magic
insert into Player(teamId, name, number, position) values
(22, 'Cole Anthony', '50', 'pg'),
(22, 'Terrence Ross', '31', 'sg'),
(22, 'Franz Wagner', '22', 'sf'),
(22, 'Wendell Carter Jr.', '34', 'pf'),
(22, 'Mo Bamba', '5', 'c');

-- Philadelphia 76ers
insert into Player(teamId, name, number, position) values
(23, 'Tyrese Maxey', '0', 'pg'),
(23, 'Seth Curry', '31', 'sg'),
(23, 'Danny Green', '14', 'sf'),
(23, 'Tobias Harris', '12', 'pf'),
(23, 'Joel Embiid', '21', 'c');

-- Phoenix Suns
insert into Player(teamId, name, number, position) values
(24, 'Chris Paul', '3', 'pg'),
(24, 'Devin Booker', '1', 'sg'),
(24, 'Mikal Bridges', '25', 'sf'),
(24, 'Jae Crowder', '99', 'pf'),
(24, 'Deandre Ayton', '22', 'c');

-- Portland Trail Blazers
insert into Player(teamId, name, number, position) values
(25, 'Damian Lillard', '0', 'pg'),
(25, 'CJ McCollum', '3', 'sg'),
(25, 'Norman Powell', '24', 'sf'),
(25, 'Robert Covington', '23', 'pf'),
(25, 'Jusuf Nurkic', '27', 'c');

-- Sacramento Kings
insert into Player(teamId, name, number, position) values
(26, 'De\'Aaron Fox', '5', 'pg'),
(26, 'Buddy Hield', '24', 'sg'),
(26, 'Harrison Barnes', '40', 'sf'),
(26, 'Marvin Bagley III', '35', 'pf'),
(26, 'Richaun Holmes', '22', 'c');

-- San Antonio Spurs
insert into Player(teamId, name, number, position) values
(27, 'Dejounte Murray', '5', 'pg'),
(27, 'Derrick White', '4', 'sg'),
(27, 'Devin Vassell', '24', 'sf'),
(27, 'Keldon Johnson', '3', 'pf'),
(27, 'Jakob Poeltl', '25', 'c');

-- Toronto Raptors
insert into Player(teamId, name, number, position) values
(28, 'Fred VanVleet', '23', 'pg'),
(28, 'Gary Trent Jr.', '33', 'sg'),
(28, 'OG Anunoby', '3', 'sf'),
(28, 'Pascal Siakam', '43', 'pf'),
(28, 'Chris Boucher', '25', 'c');

-- Utah Jazz
insert into Player(teamId, name, number, position) values
(29, 'Mike Conley', '10', 'pg'),
(29, 'Donovan Mitchell', '45', 'sg'),
(29, 'Bojan Bogdanovic', '44', 'sf'),
(29, 'Royce O\'Neale', '23', 'pf'),
(29, 'Rudy Gobert', '27', 'c');

-- Washington Wizards
insert into Player(teamId, name, number, position) values
(30, 'Spencer Dinwiddie', '26', 'pg'),
(30, 'Bradley Beal', '3', 'sg'),
(30, 'Kyle Kuzma', '0', 'sf'),
(30, 'Rui Hachimura', '8', 'pf'),
(30, 'Daniel Gafford', '21', 'c');


EOFMYSQL