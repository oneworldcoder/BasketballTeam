pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract BasketballTeam {
    
    struct Player {
        string name;
        uint jerseyNumber;
        uint age;
        string nationality;
        string playingPosition;
        string club;
    }
    
    mapping (address => Player) public players;
    
    Player[] public playerList;
    
    function setPlayer(string memory name, uint jerseyNumber, uint age, string memory nationality, string memory playingPosition, string memory club) public {
        address creator = msg.sender;
        
        Player memory newPlayer;
        newPlayer.name = name;
        newPlayer.jerseyNumber = jerseyNumber;
        newPlayer.age = age;
        newPlayer.nationality = nationality;
        newPlayer.playingPosition = playingPosition;
        newPlayer.club = club;
        
        players[creator] = newPlayer;
        playerList.push(newPlayer);
        
    }
    
    function getPlayer() public view returns (string memory name, uint jerseyNumber, uint age, string memory nationality, string memory playingPosition, string memory club) {
        address creator = msg.sender;
        return (players[creator].name, players[creator].jerseyNumber, players[creator].age, players[creator].nationality, players[creator].playingPosition, players[creator].club);
    }
    
    function getPlayerList()  public view returns (Player [] memory) {

        return playerList;

    }
    
}
